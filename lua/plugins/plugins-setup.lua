-- 自动安装packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- 保存此文件自动更新安装软件
-- 注意PackerConpile改成了PackerSync
-- plugins.lua 改成了 plugins-setup.lua, 适应本地文件名字
-- vim.cmd([[
--     augroup packer_user_config
--         autocmd!
--         autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
-- ]])

return require("packer").startup(function(use)
  use("wbthomason/packer.nvim")

  --> 1. 样式 <--
  -- 状态栏
  use({
	"nvim-lualine/lualine.nvim",
	requires = {'nvim-tree/nvim-web-devicons', opt = true},
  })
  -- 启动界面
  --use({
	--"goolord/alpha-nvim",
	--config = function()
	  --require("alpha").setup(require("alpha.themes.dashboard").config)
	--end,
  --})
  -- Trouble.nvim
  --use({
    --"folke/trouble.nvim",
  --})
  -- Noice.nvim
  --use({
    --"folke/noice.nvim",
    --requires = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      --"MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      --"rcarriga/nvim-notify",
    --},
  --})
  use({
	"folke/which-key.nvim",
	config = function()
	  vim.o.timeout = true
	  vim.o.timeoutlen = 300
	  require("which-key").setup({
		 --your configuration comes here
		 --or leave it empty to use the default settings
		 --refer to the configuration section below
	  })
	end,
  })
  -- 主题
  use("folke/tokyonight.nvim")
  use("sainnhe/sonokai")
  use({ "catppuccin/nvim", as = "catppuccin" })
  use({ "ellisonleao/gruvbox.nvim" })
  use({ "projekt0n/github-nvim-theme", tag = "v0.0.7" }) -- end
  use("akinsho/bufferline.nvim") -- buffer分割线
  use("lewis6991/gitsigns.nvim") -- 左则git提示
  use("lukas-reineke/indent-blankline.nvim") -- 缩进线

  --> 2.通用 <--
  -- 文档树
  use({
	"nvim-tree/nvim-tree.lua",
	requires = {
	  "nvim-tree/nvim-web-devicons",
	},
  })
  -- 文件检索
  use({
    "nvim-telescope/telescope.nvim",
    tag = "0.1.1",
    requires = { { "nvim-lua/plenary.nvim" } },
  })
  -- 字符快捷包裹
  use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  })  
  -- 光标快速定位
  use {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
  }
  use("lewis6991/impatient.nvim") -- 加速neovim
  use("christoomey/vim-tmux-navigator") -- ctl-hjkl窗口定位
  use("nvim-treesitter/nvim-treesitter") -- treesitter语法高亮
  --use("nvim-treesitter/nvim-treesitter-refactor")
  use("p00f/nvim-ts-rainbow") -- 配合treesitter，不同括号颜色区分
  use("numToStr/Comment.nvim") -- gcc和gc注释
  use("windwp/nvim-autopairs") -- 自动补全括号
  use("voldikss/vim-floaterm") -- 浮动终端
  use("gelguy/wilder.nvim") -- 命令模式补全
  -- use({ "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" }) -- 折叠
  use("folke/zen-mode.nvim") -- 专注模式, 中心窗口
  -- use("windwp/nvim-spectre") -- 文本替换
  use("mg979/vim-visual-multi") -- 多光标操作
  use("szw/vim-maximizer") -- 窗口尺寸管理
  use "ethanholz/nvim-lastplace" -- auto return back to the last modified positon when open a file

  --markdown
  use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })


  --> 3.LSP, 补全snippets, 管理 <--
  -- nvim-lsp, Mason管理
  -- use({
	-- "williamboman/mason.nvim", -- in charge of managing lsp servers, linters & formatters
	-- "williamboman/mason-lspconfig.nvim", -- bridges gap b/w mason & lspconfig
	-- "neovim/nvim-lspconfig", -- easily configure language servers
  --  })
  --  use("hrsh7th/cmp-nvim-lsp") -- for autocompletion

  -- coc.nvim
  use {'neoclide/coc.nvim', branch = 'release'}


  -- autocompletion
  -- use("hrsh7th/nvim-cmp") -- completion plugin
  -- use("hrsh7th/cmp-buffer") -- source for text in buffer
  -- use("hrsh7th/cmp-path") -- source for file system paths

  -- snippets
  -- use("L3MON4D3/LuaSnip") -- snippets引擎
  -- use("saadparwaiz1/cmp_luasnip") -- for autocompletion
  -- use("rafamadriz/friendly-snippets") -- useful snippets

  --use("ray-x/lsp_signature.nvim") -- 函数参数输入显示信息
  --use("mfussenegger/nvim-dap") -- Debug
  --use("leoluz/nvim-dap-go") -- Debug-Golang
  use("simrat39/symbols-outline.nvim") -- 文件大纲栏
  --use("rmagatti/goto-preview") -- 函数预览
  -- use {
  --   'kosayoda/nvim-lightbulb', -- code action for lsp
  --   requires = 'antoinemadec/FixCursorHold.nvim',
  -- }

  if packer_bootstrap then
    require("packer").sync()
  end
end)
