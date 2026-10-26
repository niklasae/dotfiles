-- Old config for codecompanion
-- return {
--   "olimorris/codecompanion.nvim",
--   dependencies = {
--     -- Required dependencies
--     "nvim-lua/plenary.nvim",
--     "nvim-treesitter/nvim-treesitter",
--     -- Optional dependency for rendering markdown
--     { "MeanderingProgrammer/render-markdown.nvim", ft = { "markdown", "codecompanion" } },
--   },
--   config = true, -- Enable automatic configuration
--   opts = {
--     adapters = {
--       copilot = function()
--         return require("codecompanion.adapters").extend("copilot", {
--           schema = {
--             model = {
--               default = "claude-3.5-sonnet",
--             },
--           },
--         })
--       end,
--     },
--     strategies = {
--       chat = {
--         adapter = "copilot", -- Use copilot adapter for chat
--       },
--       inline = {
--         adapter = "copilot", -- Use copilot adapter for inline suggestions
--       },
--     },
--   },
-- }
-- New Avante config
-- Partly from https://github.com/tku137/lazyvim_config/blob/main/lua/plugins/ai.lua
-- Partly from https://github.com/leikoilja/dotfiles/blob/master/symlinks/nvim/lua/plugins/avante.lua
return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false, -- Never set this value to "*"! Never!
    opts = {
      provider = "copilot",
      --auto_suggestions_provider = "copilot_fast", -- Since auto-suggestions are a high-frequency operation and therefore expensive, it is recommended to specify an inexpensive provider. auto_suggestions is turned off
      behaviour = {
        auto_suggestions = false, -- for now useing copilot plugin directly
      },
      providers = {
        copilot = {
          endpoint = "https://api.githubcopilot.com/",
          model = "claude-sonnet-4",
          proxy = nil, -- [protocol://]host[:port] Use this proxy
          allow_insecure = false, -- Do not allow insecure server connections
          timeout = 30000, -- Timeout in milliseconds
          -- use_response_api = false, -- OpenAI models support responses API see https://github.com/yetone/avante.nvim/blob/main/lua/avante/config.lua#L317
          extra_request_body = {
            temperature = 0.1, -- kinda creative
            max_tokens = 8192,
          },
        },
        --copilot_fast = {
        --  endpoint = "https://api.githubcopilot.com/",
        --  model = "claude-haiku-4.5",
        --  proxy = nil, -- [protocol://]host[:port] Use this proxy
        --  allow_insecure = false, -- Do not allow insecure server connections
        --  timeout = 30000, -- Timeout in milliseconds
        --  extra_request_body = {
        --    temperature = 0.1, -- kinda creative
        --    max_tokens = 8192,
        --  },
        --},
      },
      windows = {
        position = "right",
        width = 45, -- %
      },
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      --"stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "nvim-mini/mini.pick", -- for file_selector provider mini.pick
      "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
      "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
      "ibhagwan/fzf-lua", -- for file_selector provider fzf
      "nvim-mini/mini.icons",
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
  {
    "folke/sidekick.nvim",
    opts = {
      cli = {
        prompts = {
          refactor = "Please refactor {this} to be more maintainable",
          security = "Review {file} for security vulnerabilities based on Owasp Top 10",
          custom = function(ctx)
            return "Current file: " .. ctx.buf .. " at line " .. ctx.row
          end,
        },
      },
    },
    keys = {
      {
        "<tab>",
        function()
          -- if there is a next edit, jump to it, otherwise apply it if any
          if not require("sidekick").nes_jump_or_apply() then
            return "<Tab>" -- fallback to normal tab
          end
        end,
        expr = true,
        desc = "Goto/Apply Next Edit Suggestion",
      },
      {
        "<c-.>",
        function()
          require("sidekick.cli").toggle()
        end,
        desc = "Sidekick Toggle",
        mode = { "n", "t", "i", "x" },
      },
      {
        "<leader>Aa",
        function()
          require("sidekick.cli").toggle()
        end,
        desc = "Sidekick Toggle CLI",
      },
      {
        "<leader>As",
        function()
          require("sidekick.cli").select()
        end,
        -- Or to select only installed tools:
        -- require("sidekick.cli").select({ filter = { installed = true } })
        desc = "Select CLI",
      },
      {
        "<leader>Ad",
        function()
          require("sidekick.cli").close()
        end,
        desc = "Detach a CLI Session",
      },
      {
        "<leader>At",
        function()
          require("sidekick.cli").send({ msg = "{this}" })
        end,
        mode = { "x", "n" },
        desc = "Send This",
      },
      {
        "<leader>Af",
        function()
          require("sidekick.cli").send({ msg = "{file}" })
        end,
        desc = "Send File",
      },
      {
        "<leader>Av",
        function()
          require("sidekick.cli").send({ msg = "{selection}" })
        end,
        mode = { "x" },
        desc = "Send Visual Selection",
      },
      {
        "<leader>Ap",
        function()
          require("sidekick.cli").prompt()
        end,
        mode = { "n", "x" },
        desc = "Sidekick Select Prompt",
      },
      -- Example of a keybinding to open Claude directly
      -- {
      --   "<leader>Ac",
      --   function()
      --     require("sidekick.cli").toggle({ name = "claude", focus = true })
      --   end,
      --   desc = "Sidekick Toggle Claude",
      -- },
    },
  },
}
