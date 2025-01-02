---- This file can be loaded by calling `lua require('plugins')` from your init.vim
--
---- Only required if you have packer configured as `opt`
--vim.cmd [[packadd packer.nvim]]
--
--return require('packer').startup(function(use)
--    use {
--         'nvim-telescope/telescope.nvim', tag = '0.1.8',
--        -- or                            , branch = '0.1.x',
--        requires = { {'nvim-lua/plenary.nvim'} }
--    }
--  
--    use { 
--        'rose-pine/neovim', 
--        as = 'rose-pine',
--        config = function()
--            vim.cmd('colorscheme rose-pine')
--        end
--    }
--  
--    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
--  
--    use {
--        "ThePrimeagen/harpoon",
--        branch = "harpoon2",
--        requires = { {"nvim-lua/plenary.nvim"} }
--    }
--
--    use 'mbbill/undotree'
--    use 'tpope/vim-fugitive'
-- 
--    -- https://www.reddit.com/r/neovim/comments/102bicr/you_might_not_need_lspzero/
--    use({'neovim/nvim-lspconfig'})
--    use({'hrsh7th/nvim-cmp'})
--    use({'hrsh7th/cmp-nvim-lsp'})
--end


-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.

-- Setup lazy.nvim
-- https://lazy.folke.io/configuration
require("lazy").setup({
    spec = {
        { import = "mmx86.plugins" },  -- import your plugins
    },
    -- automatically check for config file changes and reload the ui
    change_detection = { notify = false },
    -- automatically check for plugin updates
    checker = { enabled = true },
})
