'use babel'

import {CompositeDisposable} from 'atom'

export default class GodocPanel {
  constructor (goconfigFunc) {
    this.key = 'reference'
    this.subscriptions = new CompositeDisposable()

    let keymap = 'alt-d'
    let bindings = atom.keymaps.findKeyBindings({command: 'golang:showdoc'})
    if (bindings && bindings.length) {
      keymap = bindings[0].keystrokes
    }

    this.doc = `Place the cursor on a symbol and run the "golang:showdoc" command (bound to ${keymap})...`
  }

  dispose () {
    if (this.subscriptions) {
      this.subscriptions.dispose()
    }
    this.subscriptions = null
  }

  updateContent (doc) {
    this.doc = doc
    if (!doc) {
      return
    }
    if (this.requestFocus) {
      this.requestFocus()
    }
    if (this.view) {
      this.view.update()
    }
  }
}
