local bufferline_status_ok, bufferline = pcall(require, 'bufferline')
if not bufferline_status_ok then
	print '[Warning] bufferline.nvim is not installed!'
end

bufferline.setup({})


