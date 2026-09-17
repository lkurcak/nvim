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

</details>

<details><summary>Windows</summary>

1. Clone the repo to your config file:

```powershell
Set-Location $env:LOCALAPPDATA
git clone https://github.com/lkurcak/nvim
```

> Alternatively clone to your preferred location and create a symlink:
> ```powershell
> New-Item -ItemType SymbolicLink -Path "$env:LOCALAPPDATA\nvim" -Target "$(Get-Location)"
> ```

2. Install dependencies:

```powershell
winget install git.git
winget install BurntSushi.ripgrep.MSVC
```

</details>

Git is also required for plugin installation and Git integration. Make sure the `git` command is available in your `PATH`.

After installation, run `:checkhealth config` in Neovim to see which core and feature-specific dependencies are available.

<details>
<summary>Language servers and supporting tools</summary>

##### Rust — rust-analyzer, Cargo, and Clippy

Install [Rust with rustup](https://www.rust-lang.org/tools/install), then add the language server and Clippy components:

```sh
rustup component add rust-analyzer clippy
```

##### OCaml — ocamllsp

Install the OCaml language server through opam:

```sh
opam install ocaml-lsp-server
```

##### Go — gopls and the Go toolchain

Install [Go](https://go.dev/doc/install), then install `gopls`:

```sh
go install golang.org/x/tools/gopls@latest
```

##### JavaScript and TypeScript — Deno

Install the [Deno runtime](https://docs.deno.com/runtime/getting_started/installation/). It provides the `deno` language server used by this config.

##### HTML — VS Code HTML language server

Install the language server with npm:

```sh
npm install --global vscode-langservers-extracted
```

##### TOML — Taplo

Install the Taplo language server with Cargo:

```sh
cargo install --features lsp --locked taplo-cli
```

##### Lua — lua-language-server

Download the latest [lua-language-server release](https://github.com/LuaLS/lua-language-server/releases), extract it, and add its `bin` directory to your `PATH`.

##### Kulala HTTP support

Install `curl` to send requests from `.http` and `.rest` files. For syntax highlighting and formatting, also install the `tree-sitter` CLI:

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
| `:Build [args...]`        | Builds the current project in a reusable bottom terminal (Rust: `cargo build`) |
| `:Run [args...]`          | Runs the current project in a reusable bottom terminal (Rust: `cargo run`) |

Project commands detect the nearest supported project manifest from the current file and run from that directory. Arguments are passed through to the underlying command; for example, use `:Build --release` or `:Run --release -- first-argument` in a Rust project.
