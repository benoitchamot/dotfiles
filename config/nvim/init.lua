-- Define leader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Remaps
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Line number and relative number
vim.opt.nu = true
vim.opt.rnu = false

-- Tabs and Indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Colours and Cursor
vim.opt.wrap = true
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.termguicolors = true

-- Colour column
vim.opt.colorcolumn = "100"

-- vim.cmd.colorscheme("rose-pine")
vim.cmd('colorscheme rose-pine')

vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})

-- Clipboard
vim.schedule(function()
    vim.opt.clipboard = 'unnamedplus'
end)

-- Autoclose
require("autoclose").setup()

-- Treesitter
require("nvim-treesitter").install { 'python', 'bash', 'zig', 'go', 'javascript', 'html', 'sql', 'css' }

vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('TreesitterSetup', { clear = true }),
  callback = function(args)
    -- 1. Define a "blacklist" of filetypes to ignore
    local ignore_ft = { "netrw", "tutor", "help", "qf" }
    if vim.tbl_contains(ignore_ft, vim.bo.filetype) then
      return
    end

    -- 2. Only start if a parser is actually installed for this language
    -- We use pcall (protected call) to prevent the error popup if things fail
    local lang = vim.treesitter.language.get_lang(vim.bo.filetype)
    if lang then
      pcall(vim.treesitter.start, args.buf, lang)
    end
  end,
})

-- LSP
vim.lsp.enable('pyright')

vim.diagnostic.config({
  virtual_text = {
    prefix = "●", -- could be '■', '▎', 'x'
    spacing = 2,
  },
  signs = true,
  underline = true,
  update_in_insert = false, -- avoids flickering while typing
  severity_sort = true,
})

-- Show details
vim.keymap.set("n", "<leader>ed", vim.diagnostic.open_float)

-- Toggle floating text
vim.keymap.set("n", "<leader>ef", function()
  local current = vim.diagnostic.config().virtual_text
  vim.diagnostic.config({
    virtual_text = not current,
  })
end, { desc = "Toggle inline diagnostics" })
