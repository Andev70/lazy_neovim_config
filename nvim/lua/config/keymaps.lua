local discipline = require("craftzdog.discipline")

discipline.cowboy()
--set leader key to space
vim.g.mapleader = " "
vim.g.python3_host_prog = "/data/data/com.termux/files/usr/bin/python3"
-- Configure vim-dotenv

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps
---------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>")

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')
-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>") -- increment
keymap.set("n", "<leader>-", "<C-x>") -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width &
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
-- keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
-- keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
-- keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

----------------------
-- Plugin Keybinds
----------------------

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

keymap.set("i", "<leader>e", "<ESC>:NvimTreeToggle<CR>")

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

-- telescope git commands (not on youtube nvim video)
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

-- restart lsp server (not on youtube nvim video)
keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary

-- Define a function to save the file
function save_file()
	vim.api.nvim_command("w!")
end

-- Map Ctrl+s in insert mode to the save_file function
vim.api.nvim_set_keymap("i", "<C-s>", "<cmd>lua save_file()<CR>", { noremap = true, silent = true })
-- for emmet

-- Copy selected text
vim.api.nvim_set_keymap("v", "<C-c>", '"+y', { noremap = true })
vim.api.nvim_set_keymap("i", "<C-c>", '<Esc>"+y', { noremap = true })
vim.api.nvim_set_keymap("c", "<C-c>", '<C-c>"+y', { noremap = true })

-- Map Ctrl+v to :put in insert, command, and visual mode
vim.api.nvim_set_keymap("i", "<C-v>", "<Esc>:put +<CR>", { noremap = true })
vim.api.nvim_set_keymap("c", "<C-v>", "<C-c>:put +<CR>", { noremap = true })
vim.api.nvim_set_keymap("v", "<C-v>", ":put<CR>", { noremap = true })

-- Map Ctrl-w to close the current buffer in Bufferline
vim.api.nvim_set_keymap("i", "<C-b>", "<ESC>:bdelete<CR>", { noremap = true })

vim.api.nvim_set_keymap("n", "<C-b>", ":bdelete<CR>", { noremap = true })

-- Undo changes in insert mode with Ctrl+Z
vim.api.nvim_set_keymap("i", "<C-z>", "<C-o>u", { noremap = true, silent = true })

-- Select all code in current buffer in insert mode
vim.api.nvim_set_keymap("i", "<C-a>", "<Esc>ggVG", { noremap = true })

-- Quit nvim without saving
vim.api.nvim_set_keymap("n", "<C-q>", ":q!<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-q>", "<ESC>:q!<CR>", { noremap = true, silent = true })

-- Map Ctrl + Left Arrow to BufferLineCycleNext
vim.api.nvim_set_keymap("n", "<C-Right>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })

-- Map Ctrl + Left Arrow to BufferLineCycleNext
vim.api.nvim_set_keymap("i", "<C-Right>", "<Esc>:BufferLineCycleNext<CR>a", { noremap = true, silent = true })
-- Diagnostics
keymap.set("n", "<C-j>", function()
	vim.diagnostic.goto_next()
end, opts)

keymap.set("n", "<leader>r", function()
	require("craftzdog.hsl").replaceHexWithHSL()
end)

keymap.set("n", "<leader>i", function()
	require("craftzdog.lsp").toggleInlayHints()
end)
