return {
  { "catppuccin/nvim", opts = { transparent_background = false } },
  { "ellisonleao/gruvbox.nvim", opts = { transparent_mode = false } },
  { "rebelot/kanagawa.nvim", opts = { transparent = false } },
  { "UtkarshVerma/molokai.nvim" },
  { "EdenEast/nightfox.nvim", opts = { transparent = false } },
  { "folke/tokyonight.nvim", opts = { transparent = false } },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "molokai",
    },
    -- Override background for molokai
    init = function()
      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = function()
          if vim.g.colors_name == "molokai" then
            -- hi Normal guibg=#000000  -- current window
            -- hi NormalNC guibg=#000000  -- non-current windows
            -- hi NormalFloat guibg=#000000 -- floating windows
            -- hi SignColumn guibg=#000000  -- sign column
            -- hi LineNr guibg=#000000 -- line numbers
            -- hi EndOfBuffer guibg=#000000 -- empty lines at the end of a buffer
            vim.cmd([[
                hi Normal guibg=#000000
                hi EndOfBuffer guibg=#000000
              ]])
          end
        end,
      })
    end,
  },
}
