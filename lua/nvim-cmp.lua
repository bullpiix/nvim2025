local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      -- Si usas un motor de snippets, añade la integración aquí.
    end,
  },
  mapping = {
    ['<Down>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item() -- Selecciona la siguiente sugerencia
      else
        fallback() -- Usa el comportamiento por defecto si no hay menú visible
      end
    end, { 'i', 's' }),

    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Confirma la selección con Enter
    ['<C-Space>'] = cmp.mapping.complete(), -- Muestra el menú de autocompletado manualmente
    ['<C-e>'] = cmp.mapping.abort(), -- Cierra el menú de autocompletado
  },
  sources = {
    { name = 'buffer' } -- Usa solo el buffer actual para sugerencias
  }
})
