local nvtree_status_ok, nvtree = pcall(require, 'nvim-tree')
if not nvtree_status_ok then
	print 'Error'
end
nvtree.setup({
 sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})


