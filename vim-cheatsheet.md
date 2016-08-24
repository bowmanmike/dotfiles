*vim core*
- `:%s/foo/bar/gc` => Search for [foo] and replace with [bar], but confirm. Leave out the `c` to skip confirmation
- `ctrl + i` => Return to previous cursor position
- `ctrl + n` => Jump to next cursor position
- `f[character]` => Jump forward to next [character] in the line
- `t[character]` => Jump forward to one character before [character] in the line
- `gd` => Search for the word under the cursor

*vim-surround*
- `ysiw [delimiter]` => Surround the current word with [delimiter]
- `ys[number]w [delimiter]` => surround [number] words with [delimiter]
- `S[delimiter]` => surround a visual mode selection with [delimiter]

*vim-fugitive*
- `:Gstatus` to see the status of the current directory
- In the status window, navigate to the file you want to add and press `-`
- `cc` To begin a commit, write a commit message in the status window, then `:wq`
