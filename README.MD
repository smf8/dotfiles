# Dotfiles

## Theme
I use `p10k` as zsh theme with default configuration.
For ubuntu, `Flat-Remix-Teal-Dark` is used as gnome shell theme and. `Flat-Remix-GTK-Orange-Dark` is used as GTK theme.

## Third Party Applications
### oc/kubectl autocomplete
For normal autocomplition add `source <(kubectl completion zsh)` to `~/.zshrc`. For cached resources, use [kubectl-fzf](https://github.com/bonnefoa/kubectl-fzf).

Install: 
```
go install github.com/bonnefoa/kubectl-fzf/v3/cmd/kubectl-fzf-completion@main
go install github.com/bonnefoa/kubectl-fzf/v3/cmd/kubectl-fzf-server@main

wget https://raw.githubusercontent.com/bonnefoa/kubectl-fzf/master/shell/kubectl_fzf.plugin.zsh -O ~/.kubectl_fzf.plugin.zsh
echo "source <(kubectl completion zsh)" >> ~/.zshrc
echo "source ~/.kubectl_fzf.plugin.zsh >> ~/.zshrc
```
**Note**: For oc autocomplete, edit `~/.kubectl_fzf.plugin.zsh` and use `&&` for `kubectl` name check.

## Goland
I Use jetbrains cloud settings sync. But some settings can not be synced.

- Import `watchers.xml` in `Tools/File Watchers` for `gci` and `gofumpt`.
