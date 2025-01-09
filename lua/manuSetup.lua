vim.opt.guicursor = "n-v-c-i:block,r-cr-o:block"
vim.opt.wrap = false
vim.g.loaded_matchparen = 1
vim.api.nvim_set_keymap('n', '<BackSpace>h', ':Ex<CR>', { noremap = true, silent = true })
vim.o.foldmethod = "indent"
vim.api.nvim_set_keymap('v', 'q', '"+y<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'q', '^v$"+y<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'w', '$i<Right><CR><Esc>"+p<CR>', { noremap = true, silent = true })
-- Configuración para que el comportamiento de las pestañas sea consistent
vim.opt.expandtab = true          -- Convertir las pestañas en espacios
vim.opt.shiftwidth = 4            -- El tamaño de la indentación
vim.opt.softtabstop = 4           -- Tabulación suave (en modo de inserción)
vim.opt.tabstop = 4               -- El tamaño real de un tabulador

vim.opt.fillchars = "fold: "
vim.opt.foldtext = "getline(v:foldstart)"
-- Mapeos en modo visual para mover las líneas seleccionadas
vim.api.nvim_set_keymap('v', '<Tab>', '>gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'º', '<gv', { noremap = true, silent = true })
-- Mapeos para Modos 
vim.api.nvim_set_keymap('n', '<BackSpace>y', ':tabnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<BackSpace>t', ':tabnew<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<BackSpace>r', ':q!<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 's', ':w!<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'd', 'u', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'a', '<C-r>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'e', 'dd', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'z', ':', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v','<BackSpace>', '<Del>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n','<M-e>', '/', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n','<Esc>', 'i', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n','u', '^', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n','y', '$', { noremap = true, silent = true })
vim.opt.shiftwidth = 4            -- El tamaño de la indentación
vim.api.nvim_set_keymap('v','u', '^', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v','y', '$', { noremap = true, silent = true })






vim.api.nvim_set_keymap(
  'n',
  '<BackSpace>f',
  [[:<C-u>%s/xbuscar/xnew/gc<Left><Left><Left>]],
  { noremap = true, silent = false }
)


local indent_cache = ""

-- Captura la indentación de la línea actual
vim.api.nvim_set_keymap("n", "l", [[:lua CaptureIndent()<CR>]], { noremap = true, silent = true })
function CaptureIndent()
  local line = vim.api.nvim_get_current_line()
  indent_cache = line:match("^%s*") or ""
  print("Indentation captured")
end

-- Aplica la indentación capturada a la línea actual
vim.api.nvim_set_keymap("n", "m", [[:lua ApplyIndent()<CR>]], { noremap = true, silent = true })
function ApplyIndent()
  local line = vim.api.nvim_get_current_line()
  local new_line = indent_cache .. line:gsub("^%s*", "")
  vim.api.nvim_set_current_line(new_line)
  print("Indentation applied")
end
vim.api.nvim_set_keymap('n', 'p', 'zc', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'n', 'zR', { noremap = true, silent = true })


local switcha = 0

-- Función para alternar los mapas de teclas
function _G.moda(imp, oup, ouf)
  if switcha == 0 then
    vim.api.nvim_set_keymap('i', imp, imp, { noremap = true, silent = true })
  elseif switcha == 1 then
    vim.api.nvim_set_keymap('i', imp, oup, { noremap = true, silent = true })
  elseif switcha == 2 then
    vim.api.nvim_set_keymap('i', imp, ouf, { noremap = true, silent = true })
  end
end

-- Alternar el estado entre 0 y 1
function _G.modxa()
 if switcha == 0 then
    switcha = 1
  elseif switcha == 1 then
    switcha = 0
  end
end

function _G.modxb()
  if switcha == 1 then 
    switcha  = 2
  elseif switcha == 2 then
    switcha = 0      
  end
end
