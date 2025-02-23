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
--vim.opt.hlsearch = false
vim.opt.scrolloff = 10
vim.opt.swapfile = false
vim.opt.fileformats = "unix"
vim.opt.shell = "nu"

vim.g.markdown_fenced_languages = {
    "ts=typescript"
}

-- Basic key bindings

-- Free keys: <C-n> <C-N>

--vim.keymap.set('n', '<C-t>', '<Cmd>te<CR>', { noremap = true, silent = true }) -- Open terminal
vim.keymap.set('n', '<C-s>', '<Cmd>w<CR>', { noremap = true, silent = true })                  -- Save
vim.keymap.set('i', '<C-s>', '<Esc><Cmd>w<CR>', { noremap = true, silent = true })             -- Save
vim.keymap.set('n', '<C-S>', '<Cmd>wa<CR>', { noremap = true, silent = true })                 -- Save all
vim.keymap.set('i', '<C-S>', '<Esc><Cmd>wa<CR>', { noremap = true, silent = true })            -- Save all
--vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })                 -- Allows you to press <Esc> to exit terminal mode
vim.keymap.set('t', '<C-x>', '<C-\\><C-n>', { noremap = true, silent = true })                 -- Allows you to press <Esc> to exit terminal mode
--vim.keymap.set('n', 'L', '<C-w><C-w>', { noremap = true, silent = true })           -- Cycle windows
vim.keymap.set('n', '<C-n>', '<Cmd>ISwapNodeWithRight<CR>', { noremap = true, silent = true }) -- Swap arguments
vim.keymap.set('n', '<C-t>', '<Cmd>ISwapNodeWithLeft<CR>', { noremap = true, silent = true })  -- Swap arguments
--vim.keymap.set('n', 'M', '<Cmd>Ex<CR>', { noremap = true, silent = true })     -- Open "Netrw Directory Listing"! (Or just press Ctrl-p)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<C-z>', '<Cmd>u<CR>', { noremap = true })
vim.keymap.set('n', '<C-y>', '<Cmd>redo<CR>', { noremap = true })
vim.keymap.set('n', 'u', '<Nop>', { noremap = true })
vim.keymap.set('n', 'L', '<Cmd>Gvdiffsplit<CR>', { noremap = true })


-- Packages
require('lazy').setup({
    'tpope/vim-sensible',

    -- Run test under cursor with :RustTest
    'rust-lang/rust.vim',

    -- Git integration
    'tpope/vim-fugitive',

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
                flavour = 'macchiato',
                -- flavour = 'mocha',
                -- with black background
                color_overrides = {
                    -- Color overrides by pkazmier
                    -- https://github.com/catppuccin/nvim/discussions/323#discussioncomment-8653291
                    macchiato = {
                        rosewater = "#F5B8AB",
                        flamingo = "#F29D9D",
                        pink = "#AD6FF7",
                        mauve = "#FF8F40",
                        red = "#E66767",
                        maroon = "#EB788B",
                        peach = "#FAB770",
                        yellow = "#FACA64",
                        green = "#70CF67",
                        teal = "#4CD4BD",
                        sky = "#61BDFF",
                        sapphire = "#4BA8FA",
                        blue = "#00BFFF",
                        lavender = "#00BBCC",
                        text = "#C1C9E6",
                        subtext1 = "#A3AAC2",
                        subtext0 = "#8E94AB",
                        overlay2 = "#7D8296",
                        overlay1 = "#676B80",
                        overlay0 = "#464957",
                        surface2 = "#3A3D4A",
                        surface1 = "#2F313D",
                        surface0 = "#1D1E29",
                        base = "#0b0b12",
                        mantle = "#11111a",
                        crust = "#191926",
                    },
                    mocha = {
                        --base = '#000000',
                        --mantle = '#000000',
                        --crust = '#000000',
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

    -- Swap arguments
    "mizlan/iswap.nvim",

    -- Delete buffers (terminals deleted without prompt)
    'ojroques/nvim-bufdel',

    {
        -- Better error/diagnostics UI
        'folke/trouble.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {
        },
    },

    --  Keep branching undo history
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

    -- Copilot
    'github/copilot.vim',

    -- Harpoon,
    'theprimeagen/harpoon',
})

-- Leap (Move cursor by pressing 's')
require('leap').add_default_mappings()

-- Swap arguments
require('iswap').setup()

-- Delete buffers (terminals deleted without prompt)
require('bufdel').setup({
    next = 'tabs',
})
vim.keymap.set('n', '<C-e>', '<Cmd>BufDel<CR>', { noremap = true, silent = true })
vim.keymap.set('t', '<C-e>', '<Cmd>BufDel<CR>', { noremap = true, silent = true })

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

-- Configure LSPs
local lspconfig = require('lspconfig')

-- Rust
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
            cargo = {
                features = "all",
            },
        },
    },
})

-- OCaml
lspconfig.ocamllsp.setup({})

-- Go
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

-- Typescript (Deno)
lspconfig.denols.setup({
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx", "json", "jsonc", "yaml" },
})

-- HTML (see? it's a real language)
lspconfig.html.setup({})

-- HTMX
lspconfig.htmx.setup({})

-- TOML
lspconfig.taplo.setup({})

-- Lua
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

-- Harpoon
--local harpoon_mark = require('harpoon.mark')
--local harpoon_ui = require('harpoon.ui')
local harpoon_term = require('harpoon.term')
--vim.keymap.set("n", "<C-i>", harpoon_mark.add_file)
--vim.keymap.set("n", "<C-h>", harpoon_ui.toggle_quick_menu)
vim.keymap.set("n", "<C-j>", function() harpoon_term.gotoTerminal(1) end, { noremap = true })
vim.keymap.set("n", "<C-k>", function() harpoon_term.gotoTerminal(2) end, { noremap = true })
vim.keymap.set("n", "<C-l>", function() harpoon_term.gotoTerminal(3) end, { noremap = true })

-- Telescope
local telescope = require("telescope")
local telescopeConfig = require("telescope.config")

local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

table.insert(vimgrep_arguments, "--hidden")
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!**/.git/*")
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!**/*.bin")
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!**/*.png")

telescope.setup({
    defaults = {
        vimgrep_arguments = vimgrep_arguments,
        file_ignore_patterns = { "node_modules", "target" },
    },
    pickers = {
        find_files = {
            -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
            find_command = {
                "rg",
                "--files",
                "--hidden",
                "--glob", "!**/.git/*",
                "--glob", "!**/*.bin",
                "--glob", "!**/*.png",
            },
        },
    },
})

local telescopeBuiltin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>',
    function() telescopeBuiltin.find_files({ hidden = true, no_ignore = true, no_ignore_parent = true }) end, {})
vim.keymap.set('n', '<C-f>', telescopeBuiltin.live_grep, {})
vim.keymap.set('n', '<C-b>', telescopeBuiltin.buffers, {})
--vim.keymap.set('n', '<space>h', telescope.help_tags, {})

-- Undotree
vim.keymap.set('n', 'u', vim.cmd.UndotreeToggle, { noremap = true, silent = true })

-- Trouble (this needs to be configured, just tested how it works)
vim.keymap.set('n', 'M', function() require('trouble').toggle() end)
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
