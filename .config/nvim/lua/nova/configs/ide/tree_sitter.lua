local status_ok ,tree_sitter = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
	print '[Error] Tree sitter is not installed!'
	return
end

-- Tree sitter configuration
tree_sitter.setup {
  ensure_installed = { 'c', 'lua', 'rust', 'python' },

  sync_install = false,

  highlight = {
    enable = true,
   additional_vim_regex_highlighting = false,
  },

	indentation = {
		enable = true
	}
}


