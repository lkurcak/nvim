# nvim

My Neovim config. Work in progress.

### Installation for Windows from scratch

#### Neovim
```sh
winget install Neovim.Neovim
```

#### This config
Go to your local app data directory with `cmd.exe`:
```bat
cd %LOCALAPPDATA%
```
or `powershell`:
```powershell
cd $env:LOCALAPPDATA
```
Then clone this repo (it will create a folder `nvim`):
```sh
git clone https://github.com/lubomirkurcak/nvim
```

#### C compiler
Zig is able to compile C!
```sh
winget install zig.zig
```

### LSPs (Optional)
Add LSPs for languages you want to work with.

#### Rust
Install Rust with `rustup` here: https://www.rust-lang.org/tools/install

You can then install `rust-analyzer` (Rust's LSP):
```sh
rustup component add rust-analyzer
```

#### Typescript
Install Node.js https://nodejs.org/ to get `npm`
Install typescript and its LSP:
```sh
npm install -g typescript
npm install -g typescript-language-server
```

#### Lua
Download latest release from https://github.com/LuaLS/lua-language-server/releases

Unzip, go to `bin` and see the `lua-language-server` executable.

Add that directory to `PATH` so that the OS is able to find it.

### Key bindings

| Key | Action |
|-------------------|
| `s`                       | Press `s` and two characters to jump, `S` for backwards. (Never move with mouse or `hjkl` again!) |
| `Ctrl-p`                  | Open file. |
| `Ctrl-f`                  | Find text. |
| `Alt-f`                   | Format buffer. |
| `<C-r>`                   | Rename. |
| `<C-a>`                   | Code action. |
| `gd`                      | Go to *definition*. |
| `gD`                      | Go to *declaration*. |
| `gi`                      | Go to *implementation*.|
| `gr`                      | Find *references*.|
| `K`                       | Display *information*.|
| `Ctrl-k`                  | Display *signature help*. (What is that?) |
| `<space>D`                | Go to *type* definition.|
| `[d`                      | Previous diagnostic.|
| `]d`                      | Next diagnostic.|
