return {

  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- { import = "nvchad.blink.lazyspec" },

  {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html",
    lazy = false,
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    opts = {
      lang = "python3", 
      storage = {
        home = vim.fn.stdpath("data") .. "/leetcode",
        cache = vim.fn.stdpath("cache") .. "/leetcode",
      },
    },
  },

  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    },
  },

  -- ENABLE ADVANCED COLORS (TreeSitter)
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim", "lua", "vimdoc",
        "html", "css", 
        "csharp" -- <--- This enables C# logic
      },
      highlight = {
        enable = true, -- <--- This enables the colors
      },
    },
  },
-- Add these to your plugin list
{
    "mfussenegger/nvim-dap",
    -- We load the keys directly here. This is the "Lazy.nvim" standard way.
    keys = {
      { "<leader>db", "<cmd> DapToggleBreakpoint <CR>", desc = "Add breakpoint" },
      { "<leader>du", function() require("dapui").toggle() end, desc = "Toggle Debug UI" },
      { "<F5>", "<cmd> DapContinue <CR>", desc = "Start/Continue Debugger" },
    },
    config = function()
      require "configs.dap"
    end,
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
    },
  },

  {
    "rcarriga/nvim-dap-ui",
    -- Remove 'lazy=false' here; the dependency above handles the loading automatically
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
  -- ENABLE ERROR LINES UNDER CODE
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    lazy = false,
    config = function()
      require("lsp_lines").setup()
      vim.diagnostic.config({
        virtual_text = false,
        virtual_lines = true, 
      })
    end,
  },

}
