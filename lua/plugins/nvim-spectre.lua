--> 文本替换

-- Usage
--[[ 
nnoremap <leader>S <cmd>lua require('spectre').open()<CR>

"search current word
nnoremap <leader>sw <cmd>lua require('spectre').open_visual({select_word=true})<CR>
vnoremap <leader>s <esc>:lua require('spectre').open_visual()<CR>
"  search in current file
nnoremap <leader>sp viw:lua require('spectre').open_file_search()<cr>
" run command :Spectre
]] --

--> Keymaps
local opts = { silent = true, noremap = true }
-- search current word
vim.keymap.set("n", "<leader>S", "<cmd>lua require('spectre').open()<CR>", opts)
vim.keymap.set("n", "<leader>sw", "<cmd>lua require('spectre').open_visual({select_world = true})<CR>", opts)
vim.keymap.set("v", "<leader>s", "<esc>:lua require('spectre').open_visual()<CR>", opts)
-- search in current file
vim.keymap.set("n", "<leader>sp", "viw:lua require('spectre').open_file_search()<cr>", opts)
-- or run command :Spectre


require('spectre').setup({
    -- stuff
})
