local function setup_mappings()
  vim.keymap.set('n', '<F8>', ':w<cr>:!g++ % -O2 -o .out/%< -std=c++17 -I ./<cr>', { buffer = true })
  vim.keymap.set('n', '<F9>', ':w<cr>:!g++ % -O2 -o .out/%< -std=c++17 -I ./<cr>:!.out/%<<cr>', { buffer = true })
end

local function setup()
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "cpp",
    callback = setup_mappings,
  })
end

return {
  setup = setup
}

