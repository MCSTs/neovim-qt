-- 快速定位

require('hop').setup {
  keys = 'etovxqpdygfblzhckisuran'
}

local keymap = vim.keymap
local opts = { silent = true, noremap = true }

keymap.set("n", "<leader>hw", ":HopWord<CR>", opts)
keymap.set("n", "<leader>hc", ":HopChar1<CR>", opts)
keymap.set("n", "<leader>hl", ":HopLineStart<CR>", opts)
keymap.set("n", "<leader>hh", ":HopAnywhere<CR>", opts)
