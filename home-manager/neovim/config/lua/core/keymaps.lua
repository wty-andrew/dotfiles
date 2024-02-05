local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

local function v_notify(cmd)
  return string.format("<cmd>call VSCodeNotifyVisual('%s', 1)<cr>", cmd)
end

local function notify(cmd)
  return string.format("<cmd>call VSCodeNotify('%s')<cr>", cmd)
end

-- Space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- resize window
keymap("n", "<C-Up>", ":resize +2<cr>", opts)
keymap("n", "<C-Down>", ":resize -2<cr>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<cr>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<cr>", opts)

keymap("n", "<A-l>", ":bnext<cr>", opts)
keymap("n", "<A-h>", ":bprevious<cr>", opts)

keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

keymap("n", "<A-j>", ":m .+1<cr>==", opts)
keymap("n", "<A-k>", ":m .-2<cr>==", opts)
keymap("v", "<A-j>", ":m '>+1<cr>gv=gv", opts)
keymap("v", "<A-k>", ":m '<-2<cr>gv=gv", opts)

keymap("v", "p", '"_dP"', opts)

keymap("i", "fd", "<ESC>", opts)

if vim.fn.exists("g:vscode") ~= 0 then
  keymap("n", "<leader><Space>", notify 'workbench.action.showCommands', opts)
  keymap("n", "<leader><Enter>", notify 'workbench.action.openLink', opts)
  keymap("n", "<leader><Tab>", notify 'workbench.action.openNextRecentlyUsedEditorInGroup', opts)

  keymap("n", "<leader>ft", notify 'workbench.action.toggleSidebarVisibility', opts)

  keymap("n", "<leader>w/", notify 'workbench.action.splitEditor', opts)
  keymap("n", "<leader>w-", notify 'workbench.action.splitEditorDown', opts)
end
