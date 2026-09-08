# Dotfiles
## Included
- `.bashrc`: a simple bash config, mainly just the prompt with some info
- `.tmux.conf`: guess...!?
- `config/gtk-3.0`: simple theme setting
- `config/hypr`: hyprland configuration file
- `config/kitty`: terminal config - not much here either
- `config/nvim`: NeoVIM (btw)
- `config/waybar`: waybar configuration files
- `config/wofi`: vibe-coded *config* for a pretty launcher, 20 well-spent minutes

## Organisation
- `config/` == `.config/`

## Specific Stuff
### Neovim
Use the provided scripts to install packages:

```bash
# Edit before running. Also, this has ZERO error handling...
scripts/install_packages.sh
```

Tree-sitter CLI must be installed separately:
```
sudo pacman -S tree-sitter-cli
```

LSPs must also be installed separately, see: [Arch Wiki - Language Server Protocol](https://wiki.archlinux.org/title/Language_Server_Protocol)...

Recommended LSPs:
- `bash-language-server`
- `pyright`
- `lua-language-server`
- `gopls`

To check that the LSPs are running as expected:

```
:checkhealth vim.lsp
```

To enable a new LSP, add to `nvim/init.lua`:

```lua
vim.lsp.enable('<lsp-name>')
```
