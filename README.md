# nvim

Neovim config for Rust.

## Installation
### Neovim
#### Windows
To get Neovim on Windows, you can use `winget`:
```sh
winget install Neovim.Neovim
```

### Rust
**Note**: This configuration assumes that both `cargo` (Rust's package manager) and `rust-analyzer` (Rust language server) are already installed on your system.

Install Rust with `rustup` here: https://www.rust-lang.org/tools/install to get `cargo`.

You can then install `rust-analyzer`:
```sh
rustup component add rust-analyzer
```

## Keybindings and Actions

| Mapping                   | Action                                            |
|---------------------------|---------------------------------------------------|
| `s`                       | Jump to text.|
| `M`                       | Explore files.|
| LSP mappings |
| `gd`                      | Go to definition.|
| `gD`                      | Go to declaration.|
| `gi`                      | Go to implementation.|
| `gr`                      | Find references.|
| `K`                       | Display information.|
| `<C-k>`                   | Display signature help.|
| `<leader>D`               | Go to type definition.|
| `<leader>cn`              | Rename symbol.|
| `<leader>ca`              | Perform code action.|
| `<leader>f`               | Format buffer.|
| Harpoon mappings |
| `<leader>a`               | Mark current file.                           |
| `<C-e>`                   | Toggle quick menu for harpoon.               |
| `<C-z>`                   | Navigates to the first marked file.|
| `<C-x>`                   | Navigates to the second marked file.|
| `<C-a>`                   | Navigates to the third marked file.|
| `<C-s>`                   | Navigates to the fourth marked file.|
| Diagnostics mappings |
| `<leader>e`               | Open floating window for diagnostics.|
| `[d`                      | Jump to previous diagnostic.|
| `]d`                      | Jump to next diagnostic.|
| `<leader>q`               | Set loclist to the current diagnostic.|
| Run mappings |
| `<leader>b`               | Build project.                       |
| `<leader>r`               | Run project.                         |
| `<leader>ta`              | Run all tests.                                   |
| `<leader>tA`              | Run all tests (including ignored).               |
| `<leader>ts`              | Run a specific test.                             |
| `<leader>tp`              | Run previous test.                           |
| `<leader>tra`             | Run all tests in release mode.                   |
| `<leader>trA`             | Run all tests in release mode (including ignored).|
| `<leader>trs`             | Run a specific test in release mode.             |
| `<leader>trp`             | Run the previous test in release mode.           |
