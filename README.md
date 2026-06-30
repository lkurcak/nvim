# nvim

My [Neovim](https://github.com/neovim/neovim) config. Work in progress.

Requires Neovim `0.12+`.

### Installation

<details><summary>macOS</summary>

1. Clone the repo to your config file:

```sh
cd ~/.config
git clone https://github.com/lkurcak/nvim
```

> Alternatively clone to your preferred location and create a symlink:
> ```
> ln -s "$(pwd)" ~/.config/nvim
> ```

2. Install dependencies

```sh
brew install ripgrep
brew install deno
```

</details>

<details><summary>Linux / WSL</summary>

1. Clone the repo to your config file:

```sh
cd ~/.config
git clone https://github.com/lkurcak/nvim
```

> Alternatively clone to your preferred location and create a symlink:
> ```
> ln -s "$(pwd)" ~/.config/nvim
> ```

2. Install dependencies:
* [`ripgrep`](https://github.com/BurntSushi/ripgrep?tab=readme-ov-file#installation)
* [`deno`](https://docs.deno.com/runtime/getting_started/installation/)

</details>

<details><summary>Windows</summary>

1. Clone the repo to your config file:

```sh
cd %LOCALAPPDATA%
git clone https://github.com/lkurcak/nvim
```

> Alternatively clone to your preferred location and create a symlink:
> ```powershell
> New-Item -ItemType SymbolicLink -Path "$env:LOCALAPPDATA\nvim" -Target "$(Get-Location)"
> ```

2. Install dependencies:

```powershell
winget install BurntSushi.ripgrep.MSVC
winget install DenoLand.Deno
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

<details><summary>Kulala HTTP parser</summary>

Install the `tree-sitter` CLI if you want Kulala syntax highlighting and formatting support for `.http` / `.rest` files.

```sh
cargo install tree-sitter-cli
```

</details>

### Key bindings

| Key | Action |
|-----|--------|
| `s`          | Press `s` followed by two characters to move to them.<BR>Never move with mouse or `hjkl` again! |
| `S`          | Same as above but able to jump to other buffers |
| `Ctrl`+`z`   | Undo |
| `Ctrl`+`y`   | Redo |
| `Ctrl`+`s`   | Save file |
| `Ctrl`+`S`   | Save all |
| `Ctrl`+`p`   | Open file (Follow with `Ctrl`+`a` to search all files) |
| `Ctrl`+`f`   | Find text (Follow with `Ctrl`+`a` to search all files) |
| `Alt`+`f`    | Format file |
| `Ctrl`+`r`   | Rename |
| `Ctrl`+`a`   | Code action |
| `K`          | Show info |

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
