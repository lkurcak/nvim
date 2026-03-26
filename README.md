# nvim

My [Neovim](https://github.com/neovim/neovim) config. Work in progress.

### Installation

<details><summary>macOS</summary>

1. Go to your config file and clone the repo (folder `nvim` will be created):

```sh
cd ~/.config
git clone https://github.com/lkurcak/nvim
```

2. Install dependencies

```sh
brew install ripgrep
brew install deno
```

</details>

<details><summary>Linux / WSL</summary>

1. Go to your config file and clone the repo (folder `nvim` will be created):

```sh
cd ~/.config
git clone https://github.com/lkurcak/nvim
```

2. Install [`ripgrep`](https://github.com/BurntSushi/ripgrep?tab=readme-ov-file#installation)

3. Install [`deno`](https://deno.com/) to support `.js`, `.ts`, `.json`, `.yaml` formatting:

```sh
curl -fsSL https://deno.land/install.sh | sh
```

</details>

<details><summary>Windows</summary>

1. Go to your local app data directory and clone this repo (folder `nvim` will be created):

```sh
cd %LOCALAPPDATA%
git clone https://github.com/lkurcak/nvim
```

2. Install `ripgrep` and `zig` (unless you already have a C compiler):

```sh
winget install zig.zig
winget install BurntSushi.ripgrep.MSVC
```

3. Install [`deno`](https://deno.com/) to support `.js`, `.ts`, `.json`, `.yaml` formatting:

```sh
irm https://deno.land/install.ps1 | iex
```

</details>

#### Optional installations

<details><summary>Rust LSP</summary>
  
1. Install [`rustup`](https://www.rust-lang.org/tools/install)

2. Install `rust-analyzer`:

```sh
rustup component add rust-analyzer
```

3. Install `taplo`:

```sh
cargo install --features lsp --locked taplo-cli
```

</details>

<details><summary>Lua LSP</summary>

Download latest release from https://github.com/LuaLS/lua-language-server/releases

Unzip, go to `bin` and make sure `lua-language-server` is in your OS `PATH`.

</details>

<details><summary>Copilot</summary>

Install [Node.js](https://nodejs.org/).

In Neovim run the command `:Copilot setup` and follow the instructions.

</details>

### Key bindings

| Key | Action |
|-----|--------|
| `s`          | Press `s` followed by two characters to move to them.<BR>Never move with mouse or `hjkl` again! |
| `S`          | Press `S` followed by two characters in another window to move to them. |
| `Ctrl`+`z`   | Undo |
| `Ctrl`+`y`   | Redo |
| `Ctrl`+`s`   | Save file |
| `Ctrl`+`S`   | Save all |
| `Ctrl`+`p`   | Open file |
| `Ctrl`+`f`   | Find text |
| `Alt`+`f`    | Format file |
| `Ctrl`+`r`   | Rename |
| `Ctrl`+`a`   | Code action |
| `K`          | Show info |

**Note:** When using `Ctrl`+`p` (Open file) or `Ctrl`+`f` (Find text), you can press `Ctrl`+`a` inside the telescope window to toggle between normal mode and "show all files including ignored" mode. The prompt will show `🔍 [ALL]` when searching all files, or just `🔍` in normal mode.

#### Navigation

| Key | Action |
|-----|--------|
| `gd`         | Go to *definition* |
| `gD`         | Go to *declaration* |
| `gi`         | Go to *implementation*|
| `gr`         | Find *references*|
| `Space`+`d`  | Go to *type* definition|
| `[d`         | Previous diagnostic|
| `]d`         | Next diagnostic|

#### Other cool features

##### Plugins

###### File viewer

Press `-` to open [`oil`](https://github.com/stevearc/oil.nvim) file viewer. Create, rename, delete files like you would text. Save the buffer to confirm changes.

###### Git interaction

Press `Ctrl`+`g` or enter command `:Git` to open [`fugitive`](https://github.com/tpope/vim-fugitive). Use `=` to expand files. Use `-` to stage/unstage files or parts of the code. Press `cc` to commit staged changes. Enter command `:Git push` to push commits.

###### HTTP requests

Open a `.http` file to load [`kulala.nvim`](https://github.com/mistweaverco/kulala.nvim). Move the cursor over a HTTP request and press `Enter` to send it.


##### Commands

| Command | Action |
|-----|--------|
| `:FixLineEndings`         | Converts line endings to `unix` style in buffer |
| `:FixLineEndingsRepo`     | Converts line endings to `unix` for all tracked git repository files |
