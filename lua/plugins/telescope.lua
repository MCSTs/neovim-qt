--> 查找文件, 字符...

local builtin = require('telescope.builtin')
local opts = { silent = true, noremap = true }
local keymap = vim.keymap

-- 当前路径下所有文件 : file
keymap.set('n', '<leader>ff', builtin.find_files, 
  { silent = true, noremap = true, desc = "Find file in workDir" })

-- 当前文件字符: fuzzy find
-- keymap.set('n', '<leader>fg', builtin.current_buffer_fuzzy_find, opts)

-- 当前工作目录下实时查找字符串(环境需要ripgrep:rg)
keymap.set('n', '<leader>fg', builtin.live_grep, 
  { silent = true, noremap = true, desc = "(rg)Find string in workDir" })

keymap.set('n', '<leader>fs', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, {silent = true, noremap = true, desc = "(Grep)Find string in workDir"})

-- 帮助文档: help file
keymap.set('n', '<leader>fh', builtin.help_tags, 
  { silent = true, noremap = true, desc = "Find help files" })

-- 寄存器 : register
keymap.set('n', '<leader>fr', builtin.registers, 
  { silent = true, noremap = true, desc = "Find register" })

-- 历史命令 : command
keymap.set('n', '<leader>fc', builtin.command_history, 
  { silent = true, noremap = true, desc = "Find history of commands" })

-- keymaps
keymap.set('n', '<leader>fk', builtin.keymaps, 
  { silent = true, noremap = true, desc = "Find keymaps" })

-- 所有buffer: fuzzy find
keymap.set('n', '<leader>fb', builtin.buffers, 
  { silent = true, noremap = true, desc = "Find buffer" })

-- quickfix: last content
keymap.set('n', '<leader>fq', builtin.quickfix, 
  { silent = true, noremap = true, desc = "Find quickfix content" })

-- 拼写建议
keymap.set('n', '<leader>fp', builtin.spell_suggest, 
  { silent = true, noremap = true, desc = "Spell suggestion" })

-- 选中高亮
keymap.set('n', '<leader>fe', builtin.vim_options, 
  { silent = true, noremap = true, desc = "Select hightlight" })

-- 标记
keymap.set('n', '<leader>fm', builtin.marks, 
  { silent = true, noremap = true, desc = "Find marks" })

--> Git
-- 查看commits 记录
-- checkout action <cr>, reset mixed <C-r>m, reset soft <C-r>s and reset hard <C-r>h
keymap.set('n', '<leader>gc', builtin.git_commits, 
  { silent = true, noremap = true, desc = "List buffer's git commits" })
keymap.set('n', '<leader>gb', builtin.git_branches, 
  { silent = true, noremap = true, desc = "List all branches" })
keymap.set('n', '<leader>gs', builtin.git_status, 
  { silent = true, noremap = true, desc = "Lists current changes per file" })
