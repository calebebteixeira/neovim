return {
  { "tpope/vim-repeat" },
  { "andymass/vim-matchup", lazy = false },
  { "dyng/ctrlsf.vim", lazy = false },
  { "vimwiki/vimwiki", lazy = false },
  { "sQVe/sort.nvim", lazy = false },
  { "tpope/vim-surround", lazy = false },
  { "othree/eregex.vim", lazy = false },
  { "mattn/emmet-vim", lazy = false },
  {
    "ggandor/leap.nvim",
    lazy = false,
    config = function() require("leap").add_default_mappings() end,
  },
  { "machakann/vim-highlightedyank", lazy = false },
  {
    "folke/todo-comments.nvim",
    lazy = false,
    requires = "nvim-lua/plenary.nvim",
    config = function() require("todo-comments").setup {} end,
  },
  {
    "folke/tokyonight.nvim",
    config = function()
      require("tokyonight").setup {
        style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
        transparent = true, -- Enable this to disable setting the background color
        styles = {
          comments = { italic = true },
          keywords = { italic = false },
          functions = { italic = false },
          variables = { italic = true },
          sidebars = "transparent", -- style for sidebars, see below
          floats = "transparent", -- style for floating windows
        },
      }
    end,
  },
}
