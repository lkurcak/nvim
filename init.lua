-- Bootstrap lazy.nvim --
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
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

-- Basic settings --

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
vim.opt.autoread = true
--vim.opt.shell = "nu"

vim.g.markdown_fenced_languages = {
    "ts=typescript"
}

vim.filetype.add({
    extension = {
        ['http'] = 'http',
    },
})

-- Basic key bindings --

-- Free keys: <C-a> <C-x> <C-t> <C-n> (<C-N> - on chromebook this one opens a new window, not recommended)

vim.keymap.set('n', '<C-s>', '<Cmd>w<CR>', { noremap = true, silent = true })       -- Save
vim.keymap.set('i', '<C-s>', '<Esc><Cmd>w<CR>', { noremap = true, silent = true })  -- Save
vim.keymap.set('n', '<C-S>', '<Cmd>wa<CR>', { noremap = true, silent = true })      -- Save all
vim.keymap.set('i', '<C-S>', '<Esc><Cmd>wa<CR>', { noremap = true, silent = true }) -- Save all
vim.keymap.set('n', '<C-a>', '', { noremap = true, silent = true })                 -- Noop
vim.keymap.set('n', '<C-x>', '', { noremap = true, silent = true })                 -- Noop
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<C-z>', '<Cmd>u<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-y>', '<Cmd>redo<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'u', '<Nop>', { noremap = true, silent = true })
vim.keymap.set('n', 'L', '<Cmd>Gvdiffsplit<CR>', { noremap = true, silent = true })
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set("n", "<C-g>", "<CMD>0Git<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<space>a", "<C-a>", { noremap = true, silent = true })
vim.keymap.set("n", "<space>x", "<C-x>", { noremap = true, silent = true })


-- Plugins --
require('lazy').setup({
    'tpope/vim-sensible',
    'tpope/vim-abolish',

    -- Reload changed files
    'djoshea/vim-autoread',

    -- Run test under cursor with :RustTest
    'rust-lang/rust.vim',

    -- Git integration
    {
        'tpope/vim-fugitive',
        cmd = { 'Git', 'Gvdiffsplit', 'Gdiffsplit' },
        lazy = true,
        event = "VeryLazy",
    },

    -- Color scheme
    {
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
                        --base = "#0b0b12",
                        base = '#000000',
                        mantle = "#11111a",
                        crust = "#191926",
                    },
                    mocha = {
                        base = '#000000',
                        --mantle = '#000000',
                        --crust = '#000000',
                    },
                },
            })

            vim.api.nvim_command('colorscheme catppuccin')
        end,
    },

    -- Leap
    {
        'https://codeberg.org/andyg/leap.nvim',
        lazy = false,
    },

    -- Searching for files, etc
    {
        'nvim-telescope/telescope.nvim',
        --version = '*',
        dependencies = { 'nvim-lua/plenary.nvim' },
        lazy = false,
    },

    -- LSP support
    {
        'neovim/nvim-lspconfig',
        lazy = false,
    },

    -- Treesitter for nice syntax highlighting
    {
        'nvim-treesitter/nvim-treesitter',
        lazy = false,
        build = ':TSUpdate',
    },

    -- Delete buffers (terminals deleted without prompt)
    'ojroques/nvim-bufdel',

    -- Better error/diagnostics UI
    {
        'folke/trouble.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {
        },
    },

    --  Keep branching undo history
    'mbbill/undotree',

    -- Show info about rust crates in `Cargo.toml`
    {
        'saecki/crates.nvim',
        tag = 'v0.4.0',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('crates').setup()
        end,
    },

    -- Copilot
    -- 'github/copilot.vim',

    -- Harpoon,
    'theprimeagen/harpoon',

    -- Oil
    {
        'stevearc/oil.nvim',
        ---@module 'oil'
        ---@type oil.SetupOpts
        opts = {},
        -- Optional dependencies
        dependencies = { { "echasnovski/mini.icons", opts = {} } },
        -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
        -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
        lazy = false,
    },

    -- Faster (disables stuff for big files)
    'pteroctopus/faster.nvim',

    --- Send HTTP requests
    {
        "mistweaverco/kulala.nvim",
        keys = {
            { "<leader>Rs", desc = "Send request" },
            { "<leader>Ra", desc = "Send all requests" },
            { "<leader>Rb", desc = "Open scratchpad" },
        },
        ft = { "http", "rest" },
        opts = {
            global_keymaps = true,
            global_keymaps_prefix = "<leader>R",
            kulala_keymaps_prefix = "",
        },
    },
})

-- Plugin configuration --

-- Delete buffers (terminals deleted without prompt)
require('bufdel').setup({
    next = 'tabs',
})
vim.keymap.set('n', '<C-e>', '<Cmd>BufDel<CR>', { noremap = true, silent = true })
vim.keymap.set('t', '<C-e>', '<Cmd>BufDel<CR>', { noremap = true, silent = true })

-- Configure LSPs

-- Rust
vim.lsp.config('rust_analyzer', {
    settings = {
        ['rust-analyzer'] = {
            check = { command = 'clippy' },
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
            inlayHints = {
                bindingModeHints = { enabled = true },
                closureCaptureHints = { enabled = true },
                closureReturnTypeHints = { enable = 'always' },
                maxLength = 100,
            },
        },
    },
})
vim.lsp.enable('rust_analyzer')

-- OCaml
vim.lsp.config('ocamllsp', {})
vim.lsp.enable('ocamllsp')

-- Go
vim.lsp.config('gopls', {
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
vim.lsp.enable('gopls')

-- Typescript (Deno)
vim.lsp.config('denols', {
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx", "json", "jsonc", "yaml", "svelte" },
    root_markers = { "deno.json", "deno.jsonc", ".git" },
    init_options = {
        unstable = { "fmt-component" },
    },
})
vim.lsp.enable('denols')

-- HTML (see? it's a real language)
vim.lsp.config('html', {})
vim.lsp.enable('html')

-- TOML
vim.lsp.config('taplo', {})
vim.lsp.enable('taplo')

-- Lua
vim.lsp.config('lua_ls', {
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
vim.lsp.enable('lua_ls')

-- Leap
vim.keymap.set({ 'n', 'x', 'o' }, 's', '<Plug>(leap)')
vim.keymap.set('n', 'S', '<Plug>(leap-from-window)')

-- Highly recommended: define a preview filter to reduce visual noise
-- and the blinking effect after the first keypress (see
-- `:h leap.opts.preview`).
-- For example, skip preview if the first character of the match is
-- whitespace or is in the middle of an alphabetic word:
--require('leap').opts.preview = function (ch0, ch1, ch2)
--  return not (
--    ch1:match('%s')
--    or (ch0:match('%a') and ch1:match('%a') and ch2:match('%a'))
--  )
--end

-- Define equivalence classes for brackets and quotes, in addition to
-- the default whitespace group:
require('leap').opts.equivalence_classes = { ' \t\r\n', '([{', ')]}', '\'"`' }

-- Use the traversal keys to repeat the previous motion without
-- explicitly invoking Leap:
require('leap.user').set_repeat_keys('<enter>', '<backspace>')

-- Automatic paste after remote yank operations:
vim.api.nvim_create_autocmd('User', {
    pattern = 'RemoteOperationDone',
    group = vim.api.nvim_create_augroup('LeapRemote', {}),
    callback = function(event)
        if vim.v.operator == 'y' and event.data.register == '"' then
            vim.cmd('normal! p')
        end
    end,
})

vim.keymap.set({ 'n', 'x', 'o' }, 'gs', function()
    require('leap.remote').action()
end)

do
    -- Return an argument table for `leap()`, tailored for f/t-motions.
    local function as_ft(key_specific_args)
        local common_args = {
            inputlen = 1,
            inclusive = true,
            -- To limit search scope to the current line:
            -- pattern = function (pat) return '\\%.l'..pat end,
            opts = {
                labels = '',                                             -- force autojump
                safe_labels = vim.fn.mode(1):match '[no]' and '' or nil, -- [1]
            },
        }
        return vim.tbl_deep_extend('keep', common_args, key_specific_args)
    end

    local clever = require('leap.user').with_traversal_keys -- [2]
    local clever_f = clever('f', 'F')
    local clever_t = clever('t', 'T')

    for key, key_specific_args in pairs {
        f = { opts = clever_f, },
        F = { backward = true, opts = clever_f },
        t = { offset = -1, opts = clever_t },
        T = { backward = true, offset = 1, opts = clever_t },
    } do
        vim.keymap.set({ 'n', 'x', 'o' }, key, function()
            require('leap').leap(as_ft(key_specific_args))
        end)
    end
end

-- [1] Match the modes here for which you don't want to use labels
--     (`:h mode()`, `:h lua-pattern`).
-- [2] This helper function makes it easier to set "clever-f"-like
--     functionality (https://github.com/rhysd/clever-f.vim), returning
--     an `opts` table derived from the defaults, where the given keys
--     are added to `keys.next_target` and `keys.prev_target`

--do
--  local clever_s = require('leap.user').with_traversal_keys('s', 'S')
--  vim.keymap.set({ 'n', 'x', 'o' }, 's', function ()
--    require('leap').leap { opts = clever_s }
--  end)
--  vim.keymap.set({ 'n', 'x', 'o' }, 'S', function ()
--    require('leap').leap { backward = true, opts = clever_s }
--  end)
--end

-- Harpoon
local harpoon_term = require('harpoon.term')
vim.keymap.set("n", "<C-j>", function() harpoon_term.gotoTerminal(1) end, { noremap = true })
vim.keymap.set("n", "<C-k>", function() harpoon_term.gotoTerminal(2) end, { noremap = true })
vim.keymap.set("n", "<C-l>", function() harpoon_term.gotoTerminal(3) end, { noremap = true })

-- Oil
require("oil").setup({
    use_default_keymaps = false,
    keymaps = {
        ["g?"] = { "actions.show_help", mode = "n" },
        ["<CR>"] = "actions.select",
        -- ["<C-s>"] = { "actions.select", opts = { vertical = true } },
        -- ["<C-h>"] = { "actions.select", opts = { horizontal = true } },
        ["<C-t>"] = { "actions.select", opts = { tab = true } },
        -- ["<C-p>"] = "actions.preview",
        ["<C-c>"] = { "actions.close", mode = "n" },
        ["<C-l>"] = "actions.refresh",
        ["-"] = { "actions.parent", mode = "n" },
        ["_"] = { "actions.open_cwd", mode = "n" },
        ["`"] = { "actions.cd", mode = "n" },
        ["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
        ["gs"] = { "actions.change_sort", mode = "n" },
        ["gx"] = "actions.open_external",
        ["g."] = { "actions.toggle_hidden", mode = "n" },
        ["g\\"] = { "actions.toggle_trash", mode = "n" },
    },
    view_options = {
        show_hidden = true,
    },
})

-- Faster
require('faster').setup()

-- Telescope
local telescope = require("telescope")

telescope.setup({
    defaults = {
        file_ignore_patterns = {
            "node_modules/",
            "target/",
            "%.git/",
            "%.DS_Store",
            "Cargo%.lock",
            "package%-lock%.json",
            "yarn%.lock",
            "%.bin$",
            "%.png$",
            "%.glb$",
        },
    },
    pickers = {
        find_files = {
            prompt_prefix = "🔍 ",
            find_command = {
                "rg",
                "--files",
                -- "--hidden",
                "--ignore",
                "--no-follow",
            },
        },
        live_grep = {
            prompt_prefix = "🔍 ",
            additional_args = function()
                return { -- "--hidden",
                    "--ignore", "--no-follow" }
            end
        },
    },
})

local telescopeBuiltin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', telescopeBuiltin.find_files, {})
vim.keymap.set('n', '<C-f>', telescopeBuiltin.live_grep, {})
vim.keymap.set('n', '<C-b>', telescopeBuiltin.buffers, {})

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

-- Make sure Fugitive doesn't override your "s" mapping
vim.api.nvim_create_autocmd("FileType", {
    pattern = "fugitive",
    callback = function()
        vim.keymap.del("n", "s", { buffer = true })
        vim.keymap.del("x", "s", { buffer = true })
    end,
})
