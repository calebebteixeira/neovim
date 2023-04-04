-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  x = {
    ["p"] = { '"_dP', desc = "Don't loose yanked text when paste" },
  },
  n = {
    ["<C-c>"] = { "*``cgn", desc = "Replaces the word under cursor for whatever you want" },
    ["<C-a>"] = { "ggVG", desc = "Select all" },
    ["<BS>"] = { ":nohlsearch<CR>", desc = "Remove search highlight" },
    ["<F2>"] = { ":VimwikiIndex<CR>", desc = "Move to end of the line" },
    ["<Leader>s"] = { ":CtrlSF ", desc = "Search and replaces in multiple files" },
    ["<Tab>"] = { ":bnext<CR>", desc = "Go to next buffer" },
    ["<S-Tab>"] = { ":bprevious<CR>", desc = "Go to previous buffer" },
  },
  v = {
    ["J"] = { ":move '>+1<CR>gv-gv", desc = "Move selected text up" },
    ["K"] = { ":move '<-2<CR>gv-gv", desc = "Move selected text down" },
  },
}
