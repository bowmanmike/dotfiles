'use babel'

import {CompositeDisposable} from 'atom'
import path from 'path'
import _ from 'lodash'

class GocodeProvider {
  constructor (goconfigFunc, gogetFunc) {
    this.goconfig = goconfigFunc
    this.goget = gogetFunc
    this.subscriptions = new CompositeDisposable()
    this.subscribers = []

    this.selector = '.source.go'
    this.inclusionPriority = 1
    this.excludeLowerPriority = atom.config.get('autocomplete-go.suppressBuiltinAutocompleteProvider')
    this.suppressForCharacters = []
    this.filterSelectors()
    let suppressSubscription = atom.config.observe('autocomplete-go.suppressActivationForCharacters', (value) => {
      this.suppressForCharacters = _.map(value, (c) => {
        let char = c ? c.trim() : ''
        char = (() => {
          switch (false) {
            case char.toLowerCase() !== 'comma':
              return ','
            case char.toLowerCase() !== 'newline':
              return '\n'
            case char.toLowerCase() !== 'space':
              return ' '
            case char.toLowerCase() !== 'tab':
              return '\t'
            default:
              return char
          }
        })()
        return char
      })
      this.suppressForCharacters = _.compact(this.suppressForCharacters)
    })
    this.subscriptions.add(suppressSubscription)
    let snippetModeSubscription = atom.config.observe('autocomplete-go.snippetMode', (value) => {
      this.snippetMode = value
    })
    this.subscriptions.add(snippetModeSubscription)
  }

  dispose () {
    if (this.subscriptions) {
      this.subscriptions.dispose()
    }
    this.subscriptions = null
    this.goconfig = null
    this.subscribers = null
    this.selector = null
    this.inclusionPriority = null
    this.excludeLowerPriority = null
    this.suppressForCharacters = null
    this.snippetMode = null
    this.disableForSelector = null
  }

  filterSelectors () {
    let configSelectors = atom.config.get('autocomplete-go.scopeBlacklist')
    this.shouldSuppressStringQuoted = false
    let selectors = []
    if (configSelectors && configSelectors.length) {
      for (let selector of configSelectors.split(',')) {
        selector = selector.trim()
        if (selector.includes('.string.quoted')) {
          this.shouldSuppressStringQuoted = true
        } else {
          selectors.push(selector)
        }
      }
    }
    this.disableForSelector = selectors.join(', ')
  }

  ready () {
    if (!this.goconfig) {
      return false
    }
    let config = this.goconfig()
    if (!config) {
      return false
    }
    return true
  }

  isValidEditor (editor) {
    if (!editor || !editor.getGrammar) {
      return false
    }
    let grammar = editor.getGrammar()
    if (!grammar) {
      return false
    }
    if (grammar.scopeName === 'source.go') {
      return true
    }
    return false
  }

  characterIsSuppressed (char, scopeDescriptor) {
    if (scopeDescriptor && scopeDescriptor.scopes && scopeDescriptor.scopes.length > 0) {
      for (let scope of scopeDescriptor.scopes) {
        if (scope === 'entity.name.import.go') {
          return false
        }

        if (this.shouldSuppressStringQuoted && scope && scope.startsWith('string.quoted')) {
          if (scopeDescriptor.scopes.indexOf('entity.name.import.go') !== -1) {
            return false
          }
          return true
        }
      }
    }
    return this.suppressForCharacters.indexOf(char) !== -1
  }

  getSuggestions (options) {
    let p = new Promise((resolve) => {
      if (!options || !this.ready() || !this.isValidEditor(options.editor)) {
        return resolve()
      }
      let config = this.goconfig()
      let buffer = options.editor.getBuffer()
      if (!buffer || !options.bufferPosition) {
        return resolve()
      }

      let index = buffer.characterIndexForPosition(options.bufferPosition)
      let priorBufferPosition = options.bufferPosition.copy()
      priorBufferPosition.column
      if (priorBufferPosition.column > 0) {
        priorBufferPosition.column = priorBufferPosition.column - 1
      }
      let scopeDescriptor = options.editor.scopeDescriptorForBufferPosition(priorBufferPosition)
      let text = options.editor.getText()
      if (index > 0 && this.characterIsSuppressed(text[index - 1], scopeDescriptor)) {
        return resolve()
      }
      let offset = Buffer.byteLength(text.substring(0, index), 'utf8')

      let locatorOptions = {
        file: options.editor.getPath(),
        directory: path.dirname(options.editor.getPath())
      }

      let args = ['-f=json', 'autocomplete', buffer.getPath(), offset]
      config.locator.findTool('gocode', locatorOptions).then((cmd) => {
        if (!cmd) {
          resolve()
          return false
        }
        let cwd = path.dirname(buffer.getPath())
        let env = config.environment(locatorOptions)
        config.executor.exec(cmd, args, {cwd: cwd, env: env, input: text}).then((r) => {
          if (r.stderr && r.stderr.trim() !== '') {
            console.log('autocomplete-go: (stderr) ' + r.stderr)
          }
          let messages = []
          if (r.stdout && r.stdout.trim() !== '') {
            messages = this.mapMessages(r.stdout, options.editor, options.bufferPosition)
          }
          if (!messages || messages.length < 1) {
            return resolve()
          }
          resolve(messages)
        }).catch((e) => {
          console.log(e)
          resolve()
        })
      })
    })

    if (this.subscribers && this.subscribers.length > 0) {
      for (let subscriber of this.subscribers) {
        subscriber(p)
      }
    }
    return p
  }

  onDidGetSuggestions (s) {
    if (this.subscribers) {
      this.subscribers.push(s)
    }
  }

  mapMessages (data, editor, position) {
    if (!data) {
      return []
    }
    let res
    try {
      res = JSON.parse(data)
    } catch (e) {
      if (e && e.handle) {
        e.handle()
      }
      atom.notifications.addError('gocode error', {
        detail: data,
        dismissable: true
      })
      console.log(e)
      return []
    }

    let numPrefix = res[0]
    let candidates = res[1]
    if (!candidates) {
      return []
    }
    let prefix = editor.getTextInBufferRange([[position.row, position.column - numPrefix], position])
    let suffix = false
    try {
      suffix = editor.getTextInBufferRange([position, [position.row, position.column + 1]])
    } catch (e) {
      console.log(e)
    }
    let suggestions = []
    for (let c of candidates) {
      let suggestion = {
        replacementPrefix: prefix,
        leftLabel: c.type || c.class,
        type: this.translateType(c.class)
      }
      if (c.class === 'func' && (!suffix || suffix !== '(')) {
        suggestion = this.upgradeSuggestion(suggestion, c)
      } else {
        suggestion.text = c.name
      }
      if (suggestion.type === 'package') {
        suggestion.iconHTML = '<i class="icon-package"></i>'
      }
      suggestions.push(suggestion)
    }
    return suggestions
  }

  translateType (type) {
    if (type === 'func') {
      return 'function'
    }
    if (type === 'var') {
      return 'variable'
    }
    if (type === 'const') {
      return 'constant'
    }
    if (type === 'PANIC') {
      return 'panic'
    }
    return type
  }

  matchFunc (type) {
    if (!type || !type.startsWith('func(')) {
      return
    }

    let count = 0
    let args
    let returns
    let returnsStart = 0
    for (let i = 0; i < type.length; i++) {
      if (type[i] === '(') {
        count = count + 1
      }

      if (type[i] === ')') {
        count = count - 1
        if (count === 0) {
          args = type.substring('func('.length, i)
          returnsStart = i + ') '.length
          break
        }
      }
    }

    if (type.length > returnsStart) {
      if (type[returnsStart] === '(') {
        returns = type.substring(returnsStart + 1, type.length - 1)
      } else {
        returns = type.substring(returnsStart, type.length)
      }
    }

    return [type, args, returns]
  }

  parseType (type) {
    if (!type || type.trim() === '') {
      return {
        isFunc: false,
        name: '',
        args: [],
        returns: []
      }
    }
    let match = this.matchFunc(type)
    if (!match || !match[0]) {
      return {
        isFunc: false,
        name: type,
        match: match,
        args: [],
        returns: []
      }
    }

    let a = match[1]
    let r = match[2]
    if (!a && !r) {
      return {
        isFunc: true,
        name: type,
        match: match,
        args: [],
        returns: []
      }
    }

    return {
      isFunc: true,
      name: type,
      match: match,
      args: this.parseParameters(a),
      returns: this.parseParameters(r)
    }
  }

  ensureNextArg (args) {
    if (!args || args.length === 0) {
      return false
    }

    let arg = args[0]
    let hasFunc = false
    if (arg.includes('func(')) {
      hasFunc = true
    }
    if (!hasFunc) {
      return args
    }
    let start = 4
    if (!arg.startsWith('func(')) {
      let splitArg = arg.split(' ')
      if (!splitArg || splitArg.length < 2 || !splitArg[1].startsWith('func(')) {
        return args
      }
      start = splitArg[0].length + 5
    }

    let funcArg = args.join(', ')
    let end = 0
    let count = 0
    for (let i = start; i < funcArg.length; i++) {
      if (funcArg[i] === '(') {
        count = count + 1
      } else if (funcArg[i] === ')') {
        count = count - 1
        if (count === 0) {
          end = i + 1
          break
        }
      }
    }

    arg = funcArg.substring(0, end)
    if (arg.length === funcArg.length || !funcArg.substring(end + 2, funcArg.length).includes(', ')) {
      return [funcArg.trim()]
    }

    if (funcArg[end + 1] === '(') {
      for (let i = end + 1; i < funcArg.length; i++) {
        if (funcArg[i] === '(') {
          count = count + 1
        } else if (funcArg[i] === ')') {
          count = count - 1
          if (count === 0) {
            end = i + 1
            break
          }
        }
      }
    }

    arg = funcArg.substring(0, end)
    if (arg.length === funcArg.length || !funcArg.substring(end + 2, funcArg.length).includes(', ')) {
      return [funcArg.trim()]
    }

    for (let i = end; i < funcArg.length; i++) {
      if (funcArg[i] === ',') {
        arg = arg + funcArg.substring(end, i)
        end = i + 1
        break
      }
    }

    args = funcArg.substring(end + 1, funcArg.length).trim().split(', ')
    args.unshift(arg.trim())
    return args
  }

  parseParameters (p) {
    if (!p || p.trim() === '') {
      return []
    }
    let args = p.split(/, /)
    let result = []
    let more = true
    while (more) {
      args = this.ensureNextArg(args)
      if (!args) {
        more = false
        continue
      }
      let arg = args.shift()
      let identifier = ''
      let type = ''

      if (arg.startsWith('func')) {
        result.push({isFunc: true, name: arg, identifier: '', type: this.parseType(arg)})
        continue
      }
      if (!arg.includes(' ')) {
        result.push({isFunc: false, name: arg, identifier: '', type: arg})
        continue
      }

      let split = arg.split(' ')
      if (!split || split.length < 2) {
        continue
      }

      identifier = split.shift()
      type = split.join(' ')
      let isFunc = false
      if (type.startsWith('func')) {
        type = this.parseType(split.join(' '))
        isFunc = true
      }
      result.push({isFunc: isFunc, name: arg, identifier: identifier, type: type})
    }

    return result
  }

  upgradeSuggestion (suggestion, c) {
    if (!c || !c.type || c.type === '' || !c.type.includes('func(')) {
      return suggestion
    }
    let type = this.parseType(c.type)
    if (!type || !type.isFunc) {
      suggestion.leftLabel = ''
      return suggestion
    }
    suggestion.leftLabel = ''
    if (type.returns && type.returns.length > 0) {
      if (type.returns.length === 1) {
        suggestion.leftLabel = type.returns[0].name
      } else {
        suggestion.leftLabel = '('
        for (let r of type.returns) {
          if (suggestion.leftLabel === '(') {
            suggestion.leftLabel = suggestion.leftLabel + r.name
          } else {
            suggestion.leftLabel = suggestion.leftLabel + ', ' + r.name
          }
        }
        suggestion.leftLabel = suggestion.leftLabel + ')'
      }
    }

    let res = this.generateSnippet(c.name, type)
    suggestion.snippet = res.snippet
    suggestion.displayText = res.displayText
    return suggestion
  }

  funcSnippet (result, snipCount, argCount, param) {
    // Generate an anonymous func
    let identifier = param.identifier
    if (!identifier || !identifier.length) {
      identifier = 'arg' + argCount
    }
    snipCount = snipCount + 1
    result.snippet = result.snippet + '${' + snipCount + ':'
    result.snippet = result.snippet + 'func('
    result.displayText = result.displayText + 'func('
    let internalArgCount = 0
    for (let arg of param.type.args) {
      internalArgCount = internalArgCount + 1
      if (internalArgCount !== 1) {
        result.snippet = result.snippet + ', '
        result.displayText = result.displayText + ', '
      }

      snipCount = snipCount + 1
      let argText = 'arg' + argCount + ''
      if (arg.identifier && arg.identifier.length > 0) {
        argText = arg.identifier + ''
      }
      result.snippet = result.snippet + '${' + snipCount + ':' + argText + '} '
      result.displayText = result.displayText + argText + ' '
      if (arg.isFunc) {
        let r = this.funcSnippet(result, snipCount, argCount, arg)
        result = r.result
        snipCount = r.snipCount
        argCount = r.argCount
      } else {
        let argType = arg.type
        if (argType.endsWith('{}')) {
          argType = argType.substring(0, argType.length - 1) + '\\}'
        }
        result.snippet = result.snippet + argType
        result.displayText = result.displayText + arg.type
      }
    }
    result.snippet = result.snippet + ')'
    result.displayText = result.displayText + ')'
    if (param.type.returns && param.type.returns.length) {
      if (param.type.returns.length === 1) {
        if (param.type.returns[0].isFunc) {
          result.snippet = result.snippet + ' '
          result.displayText = result.displayText + ' '
          let r = this.funcSnippet(result, snipCount, argCount, param.type.returns[0])
          result = r.result
          snipCount = r.snipCount
          argCount = r.argCount
        } else {
          result.snippet = result.snippet + ' ' + param.type.returns[0].type
          if (result.snippet.endsWith('{}')) {
            result.snippet = result.snippet.substring(0, result.snippet.length - 1) + '\\}'
          }
          result.displayText = result.displayText + ' ' + param.type.returns[0].name
        }
      } else {
        let returnCount = 0
        result.snippet = result.snippet + ' ('
        result.displayText = result.displayText + ' ('
        for (let returnItem of param.type.returns) {
          returnCount = returnCount + 1
          if (returnCount !== 1) {
            result.snippet = result.snippet + ', '
            result.displayText = result.displayText + ', '
          }
          let returnType = returnItem.type
          if (returnType.endsWith('{}')) {
            returnType = returnType.substring(0, returnType.length - 1) + '\\}'
          }
          result.snippet = result.snippet + returnType
          result.displayText = result.displayText + returnItem.name
        }
        result.snippet = result.snippet + ')'
        result.displayText = result.displayText + ')'
      }
    }

    snipCount = snipCount + 1
    result.snippet = result.snippet + ' {\n\t$' + snipCount + '\n\\}}'
    return {
      result: result,
      snipCount: snipCount,
      argCount: argCount
    }
  }

  generateSnippet (name, type) {
    let result = {
      snippet: name + '(',
      displayText: name + '('
    }

    if (!type) {
      result.snippet = result.snippet + ')$0'
      result.displayText = result.displayText + ')'
      return result
    }
    let snipCount = 0
    let argCount = 0
    for (let arg of type.args) {
      argCount = argCount + 1
      if (argCount !== 1) {
        result.snippet = result.snippet + ', '
        result.displayText = result.displayText + ', '
      }
      if (arg.isFunc) {
        let r = this.funcSnippet(result, snipCount, argCount, arg)
        result = r.result
        snipCount = r.snipCount
        argCount = r.argCount
      } else {
        let argText = arg.name
        if (this.snippetMode === 'name' && arg.identifier && arg.identifier.length) {
          argText = arg.identifier
        }
        if (argText.endsWith('{}')) {
          argText = argText.substring(0, argText.length - 1) + '\\}'
        }
        snipCount = snipCount + 1
        result.snippet = result.snippet + '${' + snipCount + ':' + argText + '}'
        result.displayText = result.displayText + arg.name
      }
    }

    result.snippet = result.snippet + ')$0'
    result.displayText = result.displayText + ')'
    if (this.snippetMode === 'none') {
      // user doesn't care about arg names/types
      result.snippet = name + '($1)$0'
    }
    return result
    //
    // let args = type.args
    // args = _.map(args, (a) => {
    //   if (!a || a.length <= 2) {
    //     return {display: a, snippet: a}
    //   }
    //   if (a.substring(a.length - 2, a.length) === '{}') {
    //     return {display: a, snippet: a.substring(0, a.length - 1) + '\\}'}
    //   }
    //   return {display: a, snippet: a}
    // })
    //
    // let i = 1
    // for (let arg of args) {
    //   if (this.snippetMode === 'name') {
    //     let parts = arg.snippet.split(' ')
    //     arg.snippet = parts[0]
    //   }
    //   if (i === 1) {
    //     signature.snippet = name + '(${' + i + ':' + arg.snippet + '}'
    //     signature.displayText = name + '(' + arg.display
    //   } else {
    //     signature.snippet = signature.snippet + ', ${' + i + ':' + arg.snippet + '}'
    //     signature.displayText = signature.displayText + ', ' + arg.display
    //   }
    //   i = i + 1
    // }
    //
    // signature.snippet = signature.snippet + ')$0'
    // signature.displayText = signature.displayText + ')'
    //
    // if (this.snippetMode === 'none') {
    //   // user doesn't care about arg names/types
    //   signature.snippet = name + '($1)$0'
    // }
    //
    // return signature
  }
}
export {GocodeProvider}
