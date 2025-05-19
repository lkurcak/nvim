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

</details>

### Language Servers

<details><summary>Rust</summary>
Install `rustup` here: https://www.rust-lang.org/tools/install

You can then install `rust-analyzer` (Rust's LSP):
```sh
rustup component add rust-analyzer
```

And may as well install `ripgrep` to speed up searches:
```sh
cargo install ripgrep
```
</details>

<details><summary>Typescript</summary>

Install Node.js https://nodejs.org/ to get `npm` and install typescript and its LSP:
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
| Terminal | `Ctrl+x` | Leave terminal |
| Visual   | `gq` | Format comments (built-in!) |
| Command  | `:RustTest` | Run rust test under cursor |
