local buffline_status_ok, buffline = pcall(require, 'bufferline')
if not buffline_status_ok then
	print 'ERROR akinsho/bufferline.nvim is not installed'
end

buffline.setup({})
