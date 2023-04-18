local nnoremap = require("mike.keymap").nnoremap

nnoremap("<leader>pr", 'orequire "pry-byebug"; binding.pry<esc>')
