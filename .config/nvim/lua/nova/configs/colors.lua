local cyberdream_status_ok, cyberdream = pcall(require, 'cyberdream')
if not cyberdream_status_ok then
	print 'Warning cyberdream theme is not installed!'
end

function setColorScheme(color)
	color = color or "cyberdream"
	vim.cmd.colorscheme(color)
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end

setColorScheme("cyberdream")
