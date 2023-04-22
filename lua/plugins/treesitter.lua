require 'nvim-treesitter.configs'.setup {
  -- 添加不同语言
  ensure_installed = { "vim", "c", "cpp", "javascript", "json", "lua", "python", "go", "typescript",
    "css", "rust", "markdown", "markdown_inline" }, -- one of "all" or a list of languages

  highlight = { enable = true },
  indent = { enable = true },

  --[[
    --> refactor
    refactor = {
        highlight_definitions = {
            enable = true,
            -- Set to false if you have an `updatetime` of ~100.
            clear_on_cursor_move = true,
        },
        -- 高亮显示当前块
        highlight_current_scope = { enable = true },
        -- 智能rename
        smart_rename = {
            enable = true,
            keymaps = {
                smart_rename = "grr",
            },
        },
    },
    --> refactor
    --]]

  -- 不同括号颜色区分
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn", -- set to `false` to disable one of the mappings
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
}
