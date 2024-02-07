-- :help options
local options = {
		backup = false,
		mouse = "a",
		clipboard = "unnamedplus",
		fileencoding = "utf-8",
		hlsearch = true,
		showmode = true,
		tabstop = 2,
		number = true,
		termguicolors = true,
		smartindent = true,
		shiftwidth = 2,
		timeoutlen = 1000,
		wrap = false,
		guifont = "JetbrainsMono Nerd Font:h16",
		guicursor = "",
		completeopt = {menu, menuone, noselect}
}

for k, v in pairs(options) do
		vim.opt[k] = v
end
