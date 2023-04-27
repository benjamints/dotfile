vim.cmd("autocmd!")

vim.scriptencoding = 'utf-8'

local options = {
  encoding = 'utf-8',
  fileencoding = 'utf-8',

  clipboard = 'unnamedplus',

  number = true,
  
  autoindent = true,
  smartindent = true,
  smarttab = true,
  breakindent = true,
  shiftwidth = 2,
  tabstop = 2,
  
  hlsearch = true,
  ignorecase = true,

  backup = false,
  writebackup = false,
  
  showcmd = true,
  cmdheight = 1,
  laststatus = 2,
  expandtab = true,
  scrolloff = 8,
  shell = 'fish',
  inccommand = 'split',
  wrap = false,
  backspace = { 'start', 'eol', 'indent' },
  showmode = false,
  mouse = 'a',
  guifont = 'monospace:h17',
}

vim.opt.path:append { '**' }
vim.opt.wildignore:append { '*/node_modules/*' }
vim.opt.shortmess:append('c')

for k, v in pairs(options) do 
  vim.opt[k] = v
end

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = '*',
  command = "set nopaste"
})

-- Add asterisks in block comments
vim.opt.formatoptions:append { 'r' }
