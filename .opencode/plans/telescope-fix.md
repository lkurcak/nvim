# Telescope Search Fix Plan

## Problem

`search_dirs` in telescope picker defaults is evaluated once at startup (line 588 and 596 in `init.lua`). When the user changes the CWD later (e.g., via Oil's `` ` `` or `~` actions), the cached `search_dirs` becomes stale. Telescope then runs `rg` from the *current* CWD but searches the *stale* startup directory. `rg` returns paths relative to the current CWD, so if CWD is a parent directory and the project is `arena-game`, all file paths contain the `arena-game/` prefix. When fuzzy-matching for "arena", all files match because the prefix contains the search term.

## Solution

1. Remove the stale `search_dirs` from the picker defaults in `telescope.setup()`
2. Compute `cwd` and `search_dirs` dynamically at every picker invocation
3. Pass both `cwd` and `search_dirs` explicitly in keymaps and toggle functions

This ensures `rg` is always run from the current CWD and returns paths relative to it, so the fuzzy matching is scoped to the current directory.

## Changes

### 1. Remove `search_dirs` from picker defaults

In `telescope.setup()`, remove `search_dirs` from both `find_files` and `live_grep` picker defaults:

```lua
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
        -- REMOVE: search_dirs = telescope_search_dirs(),
    },
    live_grep = {
        prompt_prefix = "🔍 ",
        additional_args = function()
            return { "--ignore", "--no-follow" }
        end,
        -- REMOVE: search_dirs = telescope_search_dirs(),
    },
},
```

### 2. Update `toggle_find_files_all` (normal mode branch)

```lua
    else
        -- Back to normal mode
        local cwd = vim.uv.cwd()
        require('telescope.builtin').find_files({
            prompt_prefix = "🔍 ",
            default_text = current_line,
            find_command = { "rg", "--files", "--ignore", "--no-follow" },
            cwd = cwd,
            search_dirs = telescope_search_dirs(cwd),
            attach_mappings = function(_, map)
                map({ "i", "n" }, "<C-a>", toggle_find_files_all)
                return true
            end
        })
    end
```

### 3. Update `toggle_live_grep_all` (normal mode branch)

```lua
    else
        -- Back to normal mode
        local cwd = vim.uv.cwd()
        require('telescope.builtin').live_grep({
            prompt_prefix = "🔍 ",
            default_text = current_line,
            additional_args = function() return { "--ignore", "--no-follow" } end,
            cwd = cwd,
            search_dirs = telescope_search_dirs(cwd),
            attach_mappings = function(_, map)
                map({ "i", "n" }, "<C-a>", toggle_live_grep_all)
                return true
            end
        })
    end
```

### 4. Update `<C-p>` keymap

```lua
vim.keymap.set('n', '<C-p>', function()
    find_files_showing_all = false
    local cwd = vim.uv.cwd()
    require('telescope.builtin').find_files({
        cwd = cwd,
        search_dirs = telescope_search_dirs(cwd),
        attach_mappings = function(_, map)
            map({ "i", "n" }, "<C-a>", toggle_find_files_all)
            return true
        end
    })
end, {})
```

### 5. Update `<C-f>` keymap

```lua
vim.keymap.set('n', '<C-f>', function()
    live_grep_showing_all = false
    local cwd = vim.uv.cwd()
    require('telescope.builtin').live_grep({
        cwd = cwd,
        search_dirs = telescope_search_dirs(cwd),
        attach_mappings = function(_, map)
            map({ "i", "n" }, "<C-a>", toggle_live_grep_all)
            return true
        end
    })
end, {})
```

## Why this works

- `cwd = vim.uv.cwd()` ensures the `rg` job runs in the current directory
- `search_dirs = telescope_search_dirs(cwd)` ensures `rg` only searches the current directory
- Both are computed fresh every time the picker opens, so they never become stale
- `rg` returns paths relative to the current CWD, so there is no parent-directory prefix
- Fuzzy matching is done against the relative paths, so searching "arena" only matches files with "arena" in their actual filename/path

## Testing

1. Open nvim from a parent directory
2. Use Oil to navigate into a project subdirectory
3. Press `<C-p>` and search for a term that matches the project name
4. Only files within that project should appear, and the fuzzy matching should work against the relative paths
