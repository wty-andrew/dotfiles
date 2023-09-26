require "core.options"
require "core.keymaps"

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        transparent_background = true,
        integrations = {
          nvimtree = false,
        },
      })

      vim.cmd.colorscheme "catppuccin-frappe"
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      require("nvim-tree").setup({
        sort_by = "case_sensitive",
        view = {
          width = 45,
          side = 'right',
        },
        renderer = {
          group_empty = true,
        },
        filters = {
          dotfiles = true,
        },
      })

      local keymap = vim.keymap

      keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<cr>")
      keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<cr>")
      keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<cr>")
      keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<cr>")
    end,
  },
  {
    "christoomey/vim-tmux-navigator"
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({})
    end
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {}
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup({
        auto_install = true,
      })
    end
  },
  {
    "Vimjas/vim-python-pep8-indent"
  }
})
