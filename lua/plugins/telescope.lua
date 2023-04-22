--> 查找文件, 字符...

local builtin = require('telescope.builtin')
local opts = { silent = true, noremap = true }
local keymap = vim.keymap

-- 当前路径下所有文件 : file
keymap.set('n', '<leader>ff', builtin.find_files, opts)

-- 当前文件字符: fuzzy find
-- keymap.set('n', '<leader>fg', builtin.current_buffer_fuzzy_find, opts)

-- 当前工作目录下实时查找字符串(环境需要ripgrep:rg)
keymap.set('n', '<leader>fg', builtin.live_grep, opts)

-- 帮助文档: help file
keymap.set('n', '<leader>fh', builtin.help_tags, opts)

-- 寄存器 : register
keymap.set('n', '<leader>fr', builtin.registers, opts)

-- 历史命令 : command
keymap.set('n', '<leader>fc', builtin.command_history, opts)

-- keymaps
keymap.set('n', '<leader>fk', builtin.keymaps, opts)

-- 所有buffer: fuzzy find
keymap.set('n', '<leader>fb', builtin.buffers, opts)

-- quickfix: last content
keymap.set('n', '<leader>fq', builtin.quickfix, opts)

-- 拼写建议
keymap.set('n', '<leader>fp', builtin.spell_suggest, opts)

-- 选中高亮
keymap.set('n', '<leader>fe', builtin.vim_options, opts)

-- 标记
keymap.set('n', '<leader>fm', builtin.marks, opts)

--> Git
-- 查看commits 记录
-- checkout action <cr>, reset mixed <C-r>m, reset soft <C-r>s and reset hard <C-r>h
keymap.set('n', '<leader>gc', builtin.git_commits, opts)
keymap.set('n', '<leader>gb', builtin.git_branches, opts)
keymap.set('n', '<leader>gs', builtin.git_status, opts)
