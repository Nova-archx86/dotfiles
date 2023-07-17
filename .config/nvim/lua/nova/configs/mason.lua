local mason_status_ok, mason = pcall(require, 'mason')
if not mason_status_ok then
	print '[Warning] mason.nvim is not installed'
end

mason.setup({
	ui = {
  	icons = {
    	package_installed = "✓",
    	package_pending = "➜",
    	package_uninstalled = "✗"
  	}
  }
})
