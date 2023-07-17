-- examples for your init.lua

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups (Should already be enabled in config
-- vim.opt.termguicolors = true

local tree_status_ok, tree = pcall(require, "nvim-tree")
if not tree_status_ok then
	print '[Error] nvim.tree is not installed'
end

tree.setup({
diagnostics = {
  enable = true,
  show_on_dirs = true, show_on_open_dirs = true, debounce_delay = 50,
  severity = {
    min = vim.diagnostic.severity.HINT,
    max = vim.diagnostic.severity.ERROR,
  },
  icons = {
    hint = "",
    info = "",
    warning = "",
    error = "",
  },
},

renderer = {
	add_trailing = false,
  group_empty = false,
  highlight_git = false,
  full_name = false,
  highlight_opened_files = "none",
  highlight_modified = "none",
  root_folder_label = ":~:s?$?/..?",
  indent_width = 2,
  indent_markers = {
    enable = false,
    inline_arrows = true,
    icons = {
      corner = "└",
      edge = "│",
      item = "│",
      bottom = "─",
      none = " ",
    },
  },

  icons = {
    webdev_colors = true,
    git_placement = "before",
    modified_placement = "after",
    padding = " ",
    symlink_arrow = " ➛ ",
    show = {
      file = true,
      folder = true,
      folder_arrow = true,
      git = true,
      modified = true,
    },
    glyphs = {
      default = "",
      symlink = "",
      bookmark = "",
      modified = "●",
      folder = {
        arrow_closed = "",
        arrow_open = "",
        default = "",
        open = "",
        empty = "",
        empty_open = "",
        symlink = "",
        symlink_open = "",
      },

      git = {
        unstaged = "✗",
        staged = "✓",
        unmerged = "",
        renamed = "➜",
        untracked = "★",
        deleted = "",
        ignored = "◌",
      },

		},
	}
}
})
