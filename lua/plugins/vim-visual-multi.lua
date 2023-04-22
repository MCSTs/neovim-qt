--> 多光标操作


--> Default keymap
-- default leader : '\'
-- Find Word                    <C-n>                        |vm-find-word|
-- Next/Previous/Skip           n / N / q                    |vm-find-next|
-- Remove Region                Q                            |vm-remove-region|
-- Add Cursors Down/Up          <C-Down> / <C-Up>            |vm-add-cursors|
-- Select Right/Left            <S-Right>, <S-Left>          |vm-shift-select|
-- Select All Words             \\A                          |vm-select-all|
-- <Space>, <Enter>, <Back> keys to add the cursor in any position... 
--
-- Add Cursor at Position       \\\                          |vm-add-cursor|
-- Slash motion                 g/                           |vm-slash|
-- Find with Regex              \\/                          |vm-regex-search|
-- Reselect Last                \\gS                         |vm-reselect-last|
-- Toggle Mappings              \\<Space>                    |vm-mappings-toggle|
-- Select Operator              s                            |vm-select-operator|
-- Find Operator                m                            |vm-find-operator|
-- Alignment                    \\a                          |vm-align|
-- Transposition                \\t                          |vm-transpose|

-- vim.g.VM_leader = " "

-- local opts = { silent = true, noremap = true }
-- vim.keymap.set("n", "<c-m>", "<Plug>(VM-Find-Under)", opts)
