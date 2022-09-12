local function setup()
  require'cpp_mappings'.setup()
  vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
end

return {
  setup = setup
}

