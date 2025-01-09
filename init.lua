-- Inicia Packer
require('typePro')
require('boxRun')
require('nvim-cmp')
require('manuSetup')
vim.cmd [[packadd packer.nvim]]
vim.cmd('source /home/srrogu/Documentos/mymorning.vim')

require('packer').startup(function(use)
  -- Packer se administra a sí mismo
  use 'wbthomason/packer.nvim'
  use 'hrsh7th/nvim-cmp'         -- Plugin principal de autocompletado
  use 'hrsh7th/cmp-buffer'       -- Fuente para el buffer actual
end)
