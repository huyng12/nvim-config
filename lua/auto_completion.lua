local cmp = require'cmp'

-- https://github.com/NvChad/NvChad/blob/c80b37a5d02620fad34978c4e454a01e059182e5/lua/plugins/configs/cmp.lua#L11
local function border(hl_name)
  return {
    { '╭', hl_name },
    { '─', hl_name },
    { '╮', hl_name },
    { '│', hl_name },
    { '╯', hl_name },
    { '─', hl_name },
    { '╰', hl_name },
    { '│', hl_name },
  }
end

-- https://github.com/NvChad/NvChad/blob/c80b37a5d02620fad34978c4e454a01e059182e5/lua/plugins/configs/cmp.lua#L33
local options = {
  window = {
    completion = {
      border = border 'CmpBorder',
      winhighlight = 'Normal:CmpPmenu,CursorLine:PmenuSel,Search:None',
    },
    documentation = {
      border = border 'CmpDocBorder',
    },
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  -- formatting = {
  --   format = function(_, vim_item)
  --     local icons = require('nvchad_ui.icons').lspkind
  --     vim_item.kind = string.format('%s %s', icons[vim_item.kind], vim_item.kind)
  --     return vim_item
  --   end,
  -- },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif require('luasnip').expand_or_jumpable() then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
      else
        fallback()
      end
    end, {
      'i',
      's',
    }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif require('luasnip').jumpable(-1) then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true, true, true), '')
      else
        fallback()
      end
    end, {
      'i',
      's',
    }),
  },
  sources = {
    { name = 'luasnip' },
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'nvim_lua' },
    { name = 'path' },
    { name = 'nvim_lsp_signature_help' },
  },
}

local function setup()
  vim.opt.completeopt = 'menuone,noselect'
  cmp.setup(options)
end

return {
  setup = setup
}

