vim.o.swapfile = false

-- Basic settings
vim.opt.number = true -- Line numbers
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.cursorline = true -- Highlight current line
vim.opt.wrap = false -- Don't wrap lines
vim.opt.scrolloff = 10 -- Keep 10 lines above/below cursor
vim.opt.sidescrolloff = 8 -- Keep 8 columns left/right of cursor

-- Indentation
vim.opt.tabstop = 2 -- Tab width
vim.opt.shiftwidth = 2 -- Indent width
vim.opt.softtabstop = 2 -- Soft tab stop
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.smartindent = true -- Smart auto-indenting
vim.opt.autoindent = true -- Copy indent from current line

-- Search settings
vim.opt.ignorecase = true -- Case insensitive search
vim.opt.smartcase = true -- Case sensitive if uppercase in search
vim.opt.hlsearch = false -- Don't highlight search results
vim.opt.incsearch = true -- Show matches as you type

-- Visual settings
vim.opt.termguicolors = true -- Enable 24-bit colors
vim.opt.signcolumn = "yes" -- Always show sign column
vim.opt.colorcolumn = "100" -- Show column at 100 characters
vim.opt.showmatch = true -- Highlight matching brackets
vim.opt.matchtime = 2 -- How long to show matching bracket
vim.opt.cmdheight = 1 -- Command line height
vim.opt.completeopt = "menuone,noinsert,noselect" -- Completion options
vim.opt.showmode = false -- Don't show mode in command line
vim.opt.pumheight = 10 -- Popup menu height
vim.opt.pumblend = 10 -- Popup menu transparency
vim.opt.winblend = 0 -- Floating window transparency
vim.opt.conceallevel = 2 -- Required for markview rendering
vim.opt.concealcursor = "" -- Show markup on cursor line
vim.opt.synmaxcol = 300 -- Syntax highlighting limit
vim.opt.fillchars = { eob = " " } -- Hide ~ on empty lines
vim.o.winborder = "rounded"

-- Create undo directory if it doesn't exist
local undodir = vim.fn.expand("~/.vim/undodir")
if vim.fn.isdirectory(undodir) == 0 then
	vim.fn.mkdir(undodir, "p")
end

-- File handling
vim.opt.backup = false -- Don't create backup files
vim.opt.writebackup = false -- Don't create backup before writing
vim.opt.swapfile = false -- Don't create swap files
vim.opt.undofile = true -- Persistent undo
vim.opt.undodir = vim.fn.expand("~/.vim/undodir") -- Undo directory
vim.opt.updatetime = 300 -- Faster completion
vim.opt.timeoutlen = 500 -- Key timeout duration
vim.opt.ttimeoutlen = 0 -- Key code timeout
vim.opt.autoread = true -- Auto reload files changed outside vim
vim.opt.autowrite = false -- Don't auto save

-- Behavior settings
vim.opt.hidden = true -- Allow hidden buffers
vim.opt.errorbells = false -- No error bells
vim.opt.backspace = "indent,eol,start" -- Better backspace behavior
vim.opt.autochdir = false -- Don't auto change directory
vim.opt.iskeyword:append("-") -- Treat dash as part of word
vim.opt.path:append("**") -- include subdirectories in search
vim.opt.selection = "exclusive" -- Selection behavior
vim.opt.mouse = "a" -- Enable mouse support
vim.opt.clipboard:append("unnamedplus") -- Use system clipboard
vim.opt.modifiable = true -- Allow buffer modifications
vim.opt.encoding = "UTF-8"

-- Treesitter

-- Folding settings
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 1
vim.opt.foldlevelstart = 99

-- Split behavior
vim.opt.splitbelow = true -- Horizontal splits go below
vim.opt.splitright = true -- Vertical splits go right

-- Key mappings
vim.g.mapleader = " " -- Set leader key to space
vim.g.maplocalleader = " " -- Set local leader key (NEW)

-- Normal mode mappings
vim.keymap.set("n", "<leader>c", ":nohlsearch<CR>", { desc = "Clear search highlights" })

-- Y to EOL
vim.keymap.set("n", "Y", "y$", { desc = "Yank to end of line" })

-- Center screen when jumping
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })

-- Better paste behavior
vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Paste without yanking" })

-- Delete without yanking
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete without yanking" })

-- Buffer navigation
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous buffer" })

-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Splitting & Resizing
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", ":split<CR>", { desc = "Split window horizontally" })
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- Move lines up/down
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
-- Better J behavior
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines and keep cursor position" })

-- Quick config editing
vim.keymap.set("n", "<leader>rc", ":e $MYVIMRC<CR>", { desc = "Edit config" })
vim.keymap.set("n", "<leader>rl", ":so $MYVIMRC<CR>", { desc = "Reload config" })

vim.keymap.set("n", "<leader>o", ":update<CR>:source<CR>")
vim.keymap.set("n", "<leader>w", ":write<CR>")
vim.keymap.set("n", "<leader>q", ":quit<CR>")

vim.keymap.set("n", ";", ":")

vim.pack.add({
	{ src = "https://github.com/tiagovla/tokyodark.nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/nvim-mini/mini.pick" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/williamboman/mason.nvim" },
	{ src = "https://github.com/williamboman/mason-lspconfig.nvim" },
  { src = "https://github.com/OXY2DEV/markview.nvim"},
  { src = "https://github.com/hakonharnes/img-clip.nvim"},
  { src = "https://github.com/3rd/image.nvim"},
  { src = "https://github.com/bullets-vim/bullets.vim"},
  { src = "https://github.com/dhruvasagar/vim-table-mode"},
  { src = "https://github.com/nvim-lualine/lualine.nvim"},
  { src = "https://github.com/skwee357/nvim-prose"},
	-- { src = "https://github.com/mfussenegger/nvim-dap" },
	-- { src = "https://github.com/mfussenegger/nvim-dap-python" },
})

-- Theme
-- vim.opt.termguicolors = true
vim.cmd.colorscheme("tokyodark")
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })

-- vim.cmd[[colorscheme pureblack]]

-- Oil
require("oil").setup()
vim.keymap.set("n", "<leader>e", ":Oil<CR>")

-- Mini.pick
require("mini.pick").setup()
vim.keymap.set("n", "<leader>f", ":Pick files<CR>")
vim.keymap.set("n", "<leader>h", ":Pick help<CR>")

-- Mason
require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "ruff", "basedpyright" },
})

---------------------------------------------------------------------------------------------------
-- Handing Markdown
---------------------------------------------------------------------------------------------------
-- Bullets.vim
vim.g.bullets_enabled_file_types = { "markdown", "text", "gitcommit" }
vim.g.bullets_custom_mappings = {
	{ "imap", "<Tab>", "<Plug>(bullets-demote)" },
	{ "imap", "<S-Tab>", "<Plug>(bullets-promote)" },
	{ "nmap", "<Tab>", "<Plug>(bullets-demote)" },
	{ "nmap", "<S-Tab>", "<Plug>(bullets-promote)" },
	{ "vmap", "<Tab>", "<Plug>(bullets-demote)" },
	{ "vmap", "<S-Tab>", "<Plug>(bullets-promote)" },
}

-- Markview
require("markview").setup()
vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		vim.opt_local.wrap = true
	end,
})

-- image.nvim (inline image rendering via Kitty graphics protocol)
require("image").setup({
	backend = "kitty",
	processor = "magick_cli",
	integrations = {
		markdown = {
			enabled = true,
			sizing_strategy = "auto",
		},
	},
})

-- img-clip
require("img-clip").setup()
vim.keymap.set("n", "<leader>p", function()
	local input = vim.fn.input("Image directory (empty for default): ", "", "dir")
	if input == "" then
		require("img-clip").pasteImage()
	elseif input == "[blogs]" or input == "[projects]" then
		local subdir = input == "[blogs]" and "blog" or "projects"
		local found = vim.fn.systemlist({ "find", vim.fn.getcwd(), "-type", "d", "-name", "assets" })
		if vim.v.shell_error ~= 0 or #found == 0 then
			vim.notify("No assets/ directory found under cwd", vim.log.levels.ERROR)
			return
		end
		require("img-clip").pasteImage({
			dir_path = found[1] .. "/img/" .. subdir,
			relative_to_current_file = false,
			use_absolute_path = false,
			template = "![$CURSOR](assets/img/" .. subdir .. "/$FILE_NAME)",
		})
	else
		require("img-clip").pasteImage({
			dir_path = input,
			relative_to_current_file = false,
			use_absolute_path = true,
		})
	end
end, { desc = "Paste image from clipboard" })

-- vim-table-mode
vim.g.table_mode_corner = "|" -- markdown-compatible tables
vim.g.table_mode_header_fillchar = "-"

-- nvim-prose
require("nvim-prose").setup({})

-- lualine
require("lualine").setup({
	sections = {
		lualine_x = {
			"prose_word_count",
			"prose_reading_time",
			"encoding",
			"fileformat",
			"filetype",
		},
	},
})

---------------------------------------------------------------------------------------------------

-- LSP
vim.lsp.enable({ "lua_ls", "ruff", "pyright" })
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>bf", ":silent !black %<CR>")

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client:supports_method("textDocument/completion") then
			-- Trigger on every alphanumeric/underscore keypress (not just "." etc.)
			local chars = {}
			for i = string.byte("a"), string.byte("z") do
				chars[#chars + 1] = string.char(i)
			end
			for i = string.byte("A"), string.byte("Z") do
				chars[#chars + 1] = string.char(i)
			end
			for i = string.byte("0"), string.byte("9") do
				chars[#chars + 1] = string.char(i)
			end
			chars[#chars + 1] = "_"
			client.server_capabilities.completionProvider.triggerCharacters = chars
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end
	end,
})

vim.diagnostic.config({
	virtual_lines = {
		current_line = true,
	}
})
