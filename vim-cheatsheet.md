*vim core*
- `:%s/foo/bar/gc` => Search for [foo] and replace with [bar], but confirm. Leave out the `c` to skip confirmation
- `ctrl + i` => Return to previous cursor position
- `ctrl + n` => Jump to next cursor position
- `f[character]` => Jump forward to next [character] in the line
- `t[character]` => Jump forward to one character before [character] in the line
- `gd` or `*` or `#` => Search for the word under the cursor
- `ctrl + v` then `c` to select a visual block and change every line at once, like in `git rebase -i`
- `ctrl + a` to increment numbers, `ctrl + x` to decrement
- `m[character]` => set a mark at the cursor location named by [character]. Type `\`[character]` to jump back to the specific mark, or `\'[character]` to jump the line where the mark is
- `<space>dc` => run godoc on the cursor location

*vim-surround*
- `ysiw [delimiter]` => Surround the current word with [delimiter]
- `ys[number]w [delimiter]` => surround [number] words with [delimiter]
- `S[delimiter]` => surround a visual mode selection with [delimiter]

*vim-fugitive*
- `:Gstatus` to see the status of the current directory
- In the status window, navigate to the file you want to add and press `-`
- `cc` To begin a commit, write a commit message in the status window, then `:wq`

*resources*
- http://blog.superuser.com/2012/03/06/understanding-the-improved-in-vim/
