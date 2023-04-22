--> 文件中git可视化显示, 使用...

require('gitsigns').setup {
    signs = {
        add          = { text = '+' },
        change       = { text = '~' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        -- untracked    = { text = '┆' },
        untracked    = { text = '' },
    },
}
