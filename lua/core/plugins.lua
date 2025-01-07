-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
  {'nvim-lua/plenary.nvim'},
  {'nvim-telescope/telescope.nvim',tag = '0.1.8',dependencies = {'nvim-lua/plenary.nvim'}},
  {'phaazon/hop.nvim'},
  {'nvim-neo-tree/neo-tree.nvim', -- file list view
      branch = "v3.x",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
      }
  },
  {'nvim-treesitter/nvim-treesitter'}, -- 
  {'neovim/nvim-lspconfig'}, -- syntacs check
  {'joshdick/onedark.vim'},{'rebelot/kanagawa.nvim'}, -- color theme
  {'hrsh7th/cmp-nvim-lsp'}, {'hrsh7th/cmp-buffer'}, {'hrsh7th/cmp-path'},{'hrsh7th/cmp-cmdline'}, {'hrsh7th/nvim-cmp'}, -- auto complete
  {"williamboman/mason.nvim", build = ":MasonUpdate"},
})

