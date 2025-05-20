# nvim

My [Neovim](https://github.com/neovim/neovim) config. Work in progress.

### Installation

<details><summary>Linux</summary>

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

#### Language servers

<details><summary>Rust</summary>
  
1. Install [`rustup`](https://www.rust-lang.org/tools/install)

2. Install `rust-analyzer`:
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

As a last resort, you can install typescript and its LSP via `npm`
```sh
npm install -g typescript
npm install -g typescript-language-server
```

</details>

<details><summary>Lua</summary>

Download latest release from https://github.com/LuaLS/lua-language-server/releases

Unzip, go to `bin` and make sure `lua-language-server` is in your OS `PATH`.

</details>

### Key bindings

| Key | Action |
|-----|--------|
| `s`, `S`     | Press `s` followed by two characters to jump to.<BR>Press `S` to do the same going backwards.<BR>Never move with mouse or `hjkl` again! |
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
| Normal   | `L` | Show file changes |
| Normal   | `u` | Show edit history |
| Visual   | `gq` | Format comments (built-in!) |
| Terminal | `Ctrl`+`x` | Leave terminal |
| Command  | `:RustTest` | Run rust test under cursor |
