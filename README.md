# nvim

> [!NOTE]
> Useful information that users should know, even when skimming content.

My Neovim config. Work in progress.

### Installation

<details><summary>Windows</summary>

Start by installing Neovim:
```sh
winget install Neovim.Neovim
```

To install this config, go to your local app data directory:
```sh
cd %LOCALAPPDATA%           # cmd.exe
cd $env:LOCALAPPDATA        # powershell
```

Clone this repo (folder `nvim` will be created):
```sh
git clone https://github.com/lubomirkurcak/nvim
```

If you do not have a C compiler set up, you can use Zig:
```sh
winget install zig.zig
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

<details><summary>C#</summary>
Install C# (you got this!)

When you have the `dotnet` command ready you can install `csharp-ls`:
```sh
dotnet tool install --global csharp-ls
```

You can check your installed `dotnet` tools:
```sh
dotnet tool list --global
```

> [!NOTE]
> Useful information that users should know, even when skimming content.

> [!NOTE]
> If that did not work (same here), you can try installing a specific version.
> 
> Search for the latest version:
> ```sh
> dotnet tool search csharp-ls
> ```
> 
> And install it:
> ```sh
> dotnet tool install --global csharp-ls --version 0.11
> ```

</details>

<details><summary>Lua</summary>

Download latest release from https://github.com/LuaLS/lua-language-server/releases

Unzip, go to `bin` and see the `lua-language-server` executable.

Add that directory to `PATH` so that the OS is able to find it.
</details>

### Key bindings

| Key | Action |
|-----|--------|
| `s`, `S`     | Press `s`, two characters, and a highlighted character to jump. <br /> Press `S` to do the same going backwards. <br /> Never move with mouse or `hjkl` again! |
| `Ctrl-p`     | Open file. |
| `Ctrl-f`     | Find text. |
| `Alt-f`      | Format buffer. |
| `<C-r>`      | Rename. |
| `<C-a>`      | Code action. |
| `gd`         | Go to *definition*. |
| `gD`         | Go to *declaration*. |
| `gi`         | Go to *implementation*.|
| `gr`         | Find *references*.|
| `K`          | Display *information*.|
| `Ctrl-k`     | Display *signature help*. (What is that?) |
| `<space>D`   | Go to *type* definition.|
| `[d`         | Previous diagnostic.|
| `]d`         | Next diagnostic.|
