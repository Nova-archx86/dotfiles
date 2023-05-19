local go_status_ok, go = pcall(require, 'go')
if not go_status_ok then
	print 'Error: go.nvim is not installed'
end

go.setup({})
