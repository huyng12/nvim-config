local function setup()
	local opt = vim.opt
	local g = vim.g

  -- general
	opt.number = true
	opt.relativenumber = true
	opt.clipboard = { "unnamed", "unnamedplus" }

  -- gui
  opt.cmdheight = 0
  opt.cursorline = true
  -- opt.wildmenu = true
  -- opt.wildmode = { "longest", "list", "full" }

  -- tab indent
	opt.tabstop = 2
	opt.shiftwidth = 2
	opt.softtabstop = 2
	opt.expandtab = true

	-- persistent undo
	opt.undofile = true
	opt.undodir = vim.fn.expand("$HOME/.config/nvim/undo", nil,  nil)
	opt.undolevels = 1000
	opt.undoreload = 10000
end

return {
	setup = setup
}

