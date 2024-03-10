local keymap = vim.keymap

local function v_notify(cmd)
  return string.format("<cmd>call VSCodeNotifyVisual('%s', 1)<cr>", cmd)
end

local function notify(cmd)
  return string.format("<cmd>call VSCodeNotify('%s')<cr>", cmd)
end

-- Space as leader key
keymap.set("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- window navigation
keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-k>", "<C-w>k")
keymap.set("n", "<C-l>", "<C-w>l")

-- resize window
keymap.set("n", "<C-Up>", ":resize +2<cr>")
keymap.set("n", "<C-Down>", ":resize -2<cr>")
keymap.set("n", "<C-Left>", ":vertical resize -2<cr>")
keymap.set("n", "<C-Right>", ":vertical resize +2<cr>")

keymap.set("n", "<A-l>", ":bnext<cr>")
keymap.set("n", "<A-h>", ":bprevious<cr>")
keymap.set("n", "<A-]>", "gt<cr>")
keymap.set("n", "<A-[>", "gT<cr>")

keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

keymap.set("n", "<A-j>", ":m .+1<cr>==")
keymap.set("n", "<A-k>", ":m .-2<cr>==")
keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv")
keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv")

keymap.set("i", "fd", "<ESC>")

if vim.fn.exists("g:vscode") ~= 0 then
  keymap.set("n", "<leader><Space>", notify 'workbench.action.showCommands')
  keymap.set("n", "<leader><Enter>", notify 'workbench.action.openLink')
  keymap.set("n", "<leader><Tab>", notify 'workbench.action.openNextRecentlyUsedEditorInGroup')
  keymap.set("n", "<leader>op", notify 'workbench.action.toggleSidebarVisibility')
  keymap.set("n", "<leader>w/", notify 'workbench.action.splitEditor')
  keymap.set("n", "<leader>w-", notify 'workbench.action.splitEditorDown')
  keymap.set("n", "<leader>wd", notify 'workbench.action.closeActiveEditor')

  keymap.set("n", "<leader>.", notify 'workbench.action.quickOpen')
  keymap.set("n", "<leader>fr", notify 'workbench.action.openRecent')
  keymap.set("n", "<leader>fs", notify 'workbench.action.files.save')

  keymap.set("n", "<leader>bb", notify 'workbench.action.quickOpenPreviousRecentlyUsedEditorInGroup')
  keymap.set("n", "<leader>bd", notify 'workbench.action.closeActiveEditor')

  keymap.set("n", "<leader>pf", notify 'workbench.action.quickOpen')
end
