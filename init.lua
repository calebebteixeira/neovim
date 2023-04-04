return {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin", -- remote to use
    channel = "stable", -- "stable" or "nightly"
    version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "nightly", -- branch name (NIGHTLY ONLY)
    commit = nil, -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false, -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_quit = false, -- automatically quit the current session after a successful update
    remotes = { -- easily add new remotes to track
      --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
      --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
      --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    },
  },

  -- Set colorscheme to use
  colorscheme = "tokyonight",

  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    underline = true,
  },

  lsp = {
    -- customize lsp formatting options
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = true, -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- "sumneko_lua",
      },
      timeout_ms = 1000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
    },
  },

  -- Configure require("lazy").setup() options
  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
      },
    },
  },

  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    local opts = { noremap = true, silent = true }
    local opts_loud = { noremap = true, silent = false }
    local map = vim.api.nvim_set_keymap

    -- Matchup
    vim.cmd [[
      let g:matchup_matchparen_offscreen = {'method': 'scrolloff'}
      map <silent> ; %
      map <leader>; v;zf<esc>j
    ]]

    -- EMMET
    vim.cmd [[
      let g:user_emmet_mode='i'
      let g:user_emmet_leader_key='<C-e>'
      let g:user_emmet_expandabbr_key='<C-e>'
    ]]

    -- EREGEX (seach and replace)
    vim.cmd [[
      let g:eregex_default_enable = 0
    ]]
    map("n", "<C-s>", ":%S///gI<left><left><left><left>", opts_loud)

    -- Remove default Vimwiki mappings
    vim.cmd [[
      let g:vimwiki_map_prefix = '<F13>'
    ]]

    -- Consider '-' as keyword
    vim.cmd [[set iskeyword+=-]]

    -- Move to beginning/end of line without taking my fingers off of home row
    map("n", "H", "^", opts)
    map("v", "H", "^", opts)
    map("n", "L", "$", opts)
    map("v", "L", "$", opts)
  end,
}
