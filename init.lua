-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Basic settings
vim.g.mapleader = ' '
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.hlsearch = false
vim.opt.scrolloff = 10

-- Packages
require('lazy').setup({
    -- Run test under cursor with :RustTest
    'rust-lang/rust.vim',

    {
        -- Color scheme
        'catppuccin/nvim',
        lazy = false,
        priority = 1000,
        name = 'catppuccin',
        config = function()
            require('catppuccin').setup({
                term_colors = true,
                transparent_background = false,
                background = {
                    light = 'latte',
                    dark = 'mocha',
                },
                -- with black background
                color_overrides = {
                    mocha = {
                        base = '#000000',
                        mantle = '#000000',
                        crust = '#000000',
                    },
                },
            })

            vim.api.nvim_command('colorscheme catppuccin')
        end,
    },

    {
        -- Searching for files, etc
        'nvim-telescope/telescope.nvim',
        tag = '0.1.4',
        dependencies = { 'nvim-lua/plenary.nvim' },
    },

    -- LSP support
    'neovim/nvim-lspconfig',

    {
        -- Treesitter for nice syntax highlighting
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
    },

    -- Move cursor by pressing 's'
    'ggandor/leap.nvim',

    {
        -- Better error/diagnostics UI
        'folke/trouble.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {
        },
    },

    -- Keep branching undo history
    'mbbill/undotree',

    {
        -- Show info about rust crates in `Cargo.toml`
        'saecki/crates.nvim',
        tag = 'v0.4.0',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('crates').setup()
        end,
    },
})

-- Basic key bindings

vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true }) -- Allows you to press <Esc> to exit terminal mode
vim.keymap.set('n', 'L', '<C-w><C-w>', { noremap = true, silent = true })      -- Cycle windows
vim.keymap.set('n', 'M', ':Ex<CR>', { noremap = true, silent = true })         -- Open "Netrw Directory Listing"! (Or just press Ctrl-p)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)


-- Leap (Move cursor by pressing 's')
require('leap').add_default_mappings()

-- Treesitter for nice syntax highlighting
require('nvim-treesitter.configs').setup({
    ensure_installed = { 'javascript', 'typescript', 'c', 'lua', 'rust' },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    }
})

-- Configure LSPs...
local lspconfig = require('lspconfig')

-- Rust LSP
lspconfig.rust_analyzer.setup({
    settings = {
        ['rust-analyzer'] = {
            check = {
                command = 'clippy',
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

-- Go LSP
lspconfig.gopls.setup({
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      gofumpt = true,
    },
  },
})

-- Typescript LSP
lspconfig.tsserver.setup({
})

-- Lua LSP
lspconfig.lua_ls.setup({
    settings = {
        Lua = {
            completion = {
                callSnippet = 'Replace'
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
            },
        }
    }
})

-- Telescope
local telescope = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', telescope.find_files, {})
vim.keymap.set('n', '<C-f>', telescope.live_grep, {})
vim.keymap.set('n', '<C-b>', telescope.buffers, {})
--vim.keymap.set('n', '<space>h', telescope.help_tags, {})

-- Undotree
vim.keymap.set('n', '<space>u', vim.cmd.UndotreeToggle)

-- Trouble (this needs to be configured, just tested how it works)
vim.keymap.set('n', '<leader>xx', function() require('trouble').toggle() end)
vim.keymap.set('n', '<leader>xw', function() require('trouble').toggle('workspace_diagnostics') end)
vim.keymap.set('n', '<leader>xd', function() require('trouble').toggle('document_diagnostics') end)
vim.keymap.set('n', '<leader>xq', function() require('trouble').toggle('quickfix') end)
vim.keymap.set('n', '<leader>xl', function() require('trouble').toggle('loclist') end)
vim.keymap.set('n', 'gR', function() require('trouble').toggle('lsp_references') end)

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
        vim.keymap.set('n', '<C-r>', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<C-a>', vim.lsp.buf.code_action, opts)
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
        _G.RunCargoTestSpecific_previous_input = vim.fn.input('Enter test name: ')
    end
    vim.cmd('echo ""')
    vim.cmd('!cargo t' .. run_in_release and ' --release' or
        '' .. _G.RunCargoTestSpecific_previous_input .. ' -- --include-ignored --show-output')
end

vim.cmd('command! -nargs=0 RunCargoTestSpecific lua RunCargoTestSpecific(true, false)')
vim.cmd('command! -nargs=0 RunCargoTestSpecificPrevious lua RunCargoTestSpecific(false, false)')
vim.cmd('command! -nargs=0 RunCargoTestSpecificRelease lua RunCargoTestSpecific(true, true)')
vim.cmd('command! -nargs=0 RunCargoTestSpecificPreviousRelease lua RunCargoTestSpecific(false, true)')

---[[
--vim.keymap.set('n', '<space>b', ':!cargo build<CR>', { noremap = true, silent = true })
--vim.keymap.set('n', '<space>r', ':!cargo run<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<space>ta', ':!cargo test<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<space>tA', ':!cargo test -- --include-ignored<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<space>tra', ':!cargo test --release<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<space>trA', ':!cargo test --release -- --include-ignored<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<space>ts', ':RunCargoTestSpecific<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<space>tp', ':RunCargoTestSpecificPrevious<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<space>trs', ':RunCargoTestSpecificRelease<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<space>trp', ':RunCargoTestSpecificPreviousRelease<CR>', { noremap = true, silent = true })
--]]
