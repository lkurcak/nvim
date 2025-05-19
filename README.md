# nvim

My Neovim config. Work in progress.

### Installation

<details><summary>Linux</summary>

Go to your config file:
```sh
cd ~/.config
```

Clone the repo (folder `nvim` will be created):
```sh
git clone https://github.com/lubomirkurcak/nvim
```

Alternatively clone somewhere else and create a symlink:
```sh
ln -s "$(pwd)" ~/.config/nvim
```

Make sure you have `ripgrep` installed for fast searching.

You can install [Deno](https://deno.com/) to support JS/TS and JSON/YAML formatting:
```sh
curl -fsSL https://deno.land/install.sh | sh
```

</details>

<details><summary>Windows</summary>

To install this config, go to your local app data directory:
```sh
cd %LOCALAPPDATA%
```

Clone this repo (folder `nvim` will be created):
```sh
git clone https://github.com/lubomirkurcak/nvim
```

Alternatively clone somewhere else and create a symlink:
```sh
mklink /D %LOCALAPPDATA%\nvim %CD%
```

If you don't already have a C compiler or ripgrep installed you can get them via `winget`:
```sh
winget install zig.zig
winget install BurntSushi.ripgrep.MSVC
```

You can install [Deno](https://deno.com/) to support JS/TS and JSON/YAML formatting:
```sh
irm https://deno.land/install.ps1 | iex
```

</details>

### Language Servers

<details><summary>Rust</summary>
Install `rustup` here: https://www.rust-lang.org/tools/install

You can then install `rust-analyzer` (Rust's LSP):
```sh
rustup component add rust-analyzer
```
</details>

<details><summary>Typescript</summary>

Install [Deno](https://deno.com/):

```sh
# Linux
curl -fsSL https://deno.land/install.sh | sh
# Windows
irm https://deno.land/install.ps1 | iex
```

Alternatively install typescript and its LSP via `npm`
```sh
npm install -g typescript
npm install -g typescript-language-server
```
</details>

<details><summary>Lua</summary>

Download latest release from https://github.com/LuaLS/lua-language-server/releases

Unzip, go to `bin` and see the `lua-language-server` executable.

Add that directory to `PATH` so that the OS is able to find it.
</details>

### Key bindings

| Key | Action |
|-----|--------|
| `s`, `S`     | Press `s` or followed by two characters, and a highlighted character to jump to. Press `S` to do the same going backwards. Never move with mouse or `hjkl` again! |
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

| Mode | Key | Action |
|---|---|---|
|          | `L` | Show file changes |
|          | `u` | Show edit history |
| Terminal | `Ctrl`+`x` | Leave terminal |
| Visual   | `gq` | Format comments (built-in!) |
| Command  | `:RustTest` | Run rust test under cursor |
