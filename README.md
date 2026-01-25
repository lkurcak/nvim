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
| `s`          | Press `s` followed by two characters to jump there.<BR>`S` to do the same going backwards.<BR>`gs` to jump between buffers.<BR>Never move with mouse or `hjkl` again! |
| `Ctrl`+`z`   | Undo |
| `Ctrl`+`y`   | Redo |
| `Ctrl`+`s`   | Save file |
| `Ctrl`+`S`   | Save all |
| `Ctrl`+`p`   | Open file |
| `Alt`+`f`    | Format file |
| `Ctrl`+`f`   | Find text |
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

###### file viewer

Press `-` to open `oil` file viewer. Create, rename, delete files like you would text. Save the buffer to confirm changes.

[See more](https://github.com/stevearc/oil.nvim)

###### git

Press `Ctrl`+`g` or enter command `:Git` to open `fugitive`. Use `=` to expand files. Use `-` to stage/unstage files or parts of the code. Press `cc` to commit staged changes. Enter command `:Git push` to push commits.

[See more](https://github.com/tpope/vim-fugitive)

###### http requests

Open a `.http` file to load `kulala.nvim`. Move the cursor over a HTTP request and press `Enter` to send it.

[See more](https://github.com/mistweaverco/kulala.nvim)

###### other

| Mode | Key | Action |
|---|---|---|
| Normal   | `-` | Show file explorer ([oil](https://github.com/stevearc/oil.nvim)) |
| Normal   | `L` | Show file changes |
| Normal   | `u` | Show edit history |
| Normal | `Ctrl`+`g` | Open [`fugitive`](https://github.com/tpope/vim-fugitive) |
| Command  | `:RustTest` | Run rust test under cursor |

##### Built-in

| Mode | Key | Action |
|---|---|---|
| Normal   | `Ctrl`+`6`/`^` | Toggle between last two files |
| Visual   | `gq` | Format comments  |
