vim.g.mapleader = ' '

-- Vim.
vim.keymap.set('n', '<leader>ve', vim.cmd.Ex)  -- Netrw explore 

-- Move selected lines.
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- vim.keymap.set("n", "J", "mzJ`z")  -- Cursor stays in place while 'J'
-- vim.keymap.set("n", "<C-d>", "<C-d>zz")  -- Centered half-screen scroll down
-- vim.keymap.set("n", "<C-u>", "<C-u>zz")  -- Centered half-screen scroll up
-- vim.keymap.set("n", "n", "nzzzv")  -- Centered next
-- vim.keymap.set("n", "N", "Nzzzv")  -- Centered prev
-- vim.keymap.set("n", "<leader>zig", "<cmd>LspRestart<cr>")  -- TODO: move to lsp


-- Copy to system clipbloard register.
vim.keymap.set({'n', 'v'}, '<leader>y', '"+y')
vim.keymap.set('n', '<leader>Y', '"+Y')


-- Avoid messing up register.
vim.keymap.set({'n', 'v'}, '<leader>d', '"_d')
-- vim.keymap.set("x", "<leader>p", [["_dP]])  -- visual mode paste over selection persists pasted value


vim.keymap.set("n", "gs", "<nop>")  -- Cancel critical "go to sleep" functionality.

-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")  -- TODO:
-- vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)  -- TODO: move to lsp (!NO, it is default vim.lsp event without lsp)

-- Quickfix list?
-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Search and replace.
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })  # Chmod +x current file.  # TODO: sudo in not enough perms? (mb not)
-- 
-- vim.keymap.set(
--     "n",
--     "<leader>ee",
--     "oif err != nil {<CR>}<Esc>Oreturn err<Esc>"
-- )
-- 
-- vim.keymap.set(
--     "n",
--     "<leader>ea",
--     "oassert.NoError(err, \"\")<Esc>F\";a"
-- )
-- 
-- vim.keymap.set(
--     "n",
--     "<leader>ef",
--     "oif err != nil {<CR>}<Esc>Olog.Fatalf(\"error: %s\\n\", err.Error())<Esc>jj"
-- )
-- 
-- vim.keymap.set(
--     "n",
--     "<leader>el",
--     "oif err != nil {<CR>}<Esc>O.logger.Error(\"error\", \"error\", err)<Esc>F.;i"
-- )
-- 
-- vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>");
-- vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");
-- 
-- vim.keymap.set("n", "<leader><leader>", function()
--     vim.cmd("so")
-- end)
--  
