local tt_status_ok, tt = pcall(require, 'toggleterm')
if not tt_status_ok then
	print '[Error] Toggle term is not installed'
end

tt.setup{
	hide_numbers = true,
	autochdir = true,
}
