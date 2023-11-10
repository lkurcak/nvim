local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.hlsearch = false
vim.opt.scrolloff = 10

require("lazy").setup({
    "rust-lang/rust.vim",

    {
        "catppuccin/nvim",
        lazy = false,
        priority = 1000,
        name = "catppuccin",
        config = function()
            require("catppuccin").setup({
                term_colors = true,
                transparent_background = false,
                background = {
                    light = "latte",
                    dark = "mocha",
                },
                color_overrides = {
                    mocha = {
                        base = "#000000",
                        mantle = "#000000",
                        crust = "#000000",
                    },
                },
            })

            vim.api.nvim_command("colorscheme catppuccin")
        end,
    },

    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.4",
        dependencies = { "nvim-lua/plenary.nvim" },
    },

    "neovim/nvim-lspconfig",
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
    },

    {
        "theprimeagen/harpoon",
        dependencies = {
            "nvim-lua/plenary.nvim"
        },
    },

    {
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = {},
        keys = {
            { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end,       desc = "Flash" },
            { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
            --{ "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
            --{ "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            --{ "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },

        },
    },

    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
    },

    "mbbill/undotree",

    {
        'saecki/crates.nvim',
        tag = 'v0.4.0',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('crates').setup()
        end,
    },
})

local treesitter = require('nvim-treesitter.configs').setup({
    ensure_installed = { "javascript", "typescript", "c", "lua", "rust" },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    }
})

local lspconfig = require('lspconfig')

lspconfig.rust_analyzer.setup({
    --on_attach = lsp_status.on_attach,
    settings = {
        ['rust-analyzer'] = {
            check = {
                command = "clippy",
            },
            hover = {
                memoryLayout = {
                    niches = true,
                },
            },
            diagnostics = {
                enable = true,
                experimental = {
                    enable = true,
                },
            },
        },
    },
})

lspconfig.tsserver.setup({
})

lspconfig.lua_ls.setup({
    settings = {
        Lua = {
            completion = {
                callSnippet = "Replace"
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
            },
        }
    }
})

local harpoon_mark = require('harpoon.mark')
local harpoon_ui = require('harpoon.ui')
vim.keymap.set('n', '<space>a', harpoon_mark.add_file)
vim.keymap.set('n', '<C-e>', harpoon_ui.toggle_quick_menu)
vim.keymap.set('n', '<C-z>', function() harpoon_ui.nav_file(1) end)
vim.keymap.set('n', '<C-x>', function() harpoon_ui.nav_file(2) end)
vim.keymap.set('n', '<C-a>', function() harpoon_ui.nav_file(3) end)
vim.keymap.set('n', '<C-s>', function() harpoon_ui.nav_file(4) end)


local telescope = require("telescope.builtin")
vim.keymap.set('n', '<space>f', telescope.find_files, {})
vim.keymap.set('n', '<space>g', telescope.live_grep, {})
vim.keymap.set('n', '<space>d', telescope.buffers, {})
vim.keymap.set('n', '<space>h', telescope.help_tags, {})

vim.keymap.set('n', '<space>u', vim.cmd.UndotreeToggle)

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<space>cn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<A-f>', function()
            vim.lsp.buf.format { async = true }
        end, opts)
        vim.keymap.set('n', 'CTRL-<A-f>', function()
            vim.lsp.buf.format { async = true }
        end, opts)
    end,
})

-- cargo test helpers
function _G.RunCargoTestSpecific(ask_input, run_in_release)
    if ask_input or not _G.RunCargoTestSpecific_previous_input then
        _G.RunCargoTestSpecific_previous_input = vim.fn.input("Enter test name: ")
    end
    vim.cmd("echo ''")
    vim.cmd("!cargo t " .. _G.RunCargoTestSpecific_previous_input .. " -- --include-ignored --show-output")
end

vim.cmd("command! -nargs=0 RunCargoTestSpecific lua RunCargoTestSpecific(true, false)")
vim.cmd("command! -nargs=0 RunCargoTestSpecificPrevious lua RunCargoTestSpecific(false, false)")
vim.cmd("command! -nargs=0 RunCargoTestSpecificRelease lua RunCargoTestSpecific(true, true)")
vim.cmd("command! -nargs=0 RunCargoTestSpecificPreviousRelease lua RunCargoTestSpecific(false, true)")

vim.api.nvim_set_keymap('n', '<space>b', ':!cargo build<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<space>r', ':!cargo run<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<space>ta', ':!cargo test<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<space>tA', ':!cargo test -- --include-ignored<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<space>tra', ':!cargo test --release<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<space>trA', ':!cargo test --release -- --include-ignored<CR>',
    { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<space>ts', ':RunCargoTestSpecific<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<space>tp', ':RunCargoTestSpecificPrevious<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<space>trs', ':RunCargoTestSpecificRelease<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<space>trp', ':RunCargoTestSpecificPreviousRelease<CR>', { noremap = true, silent = true })

-- terminal escape
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', 'L', '<C-w><C-w>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'M', ':Ex<CR>', { noremap = true, silent = true })
