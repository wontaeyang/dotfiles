# dotfiles

## Neovim setup

1. brew update

2. brew install neovim/neovim/neovim

3. clone dotfiles repo `git@github.com:wontaeyang/dotfiles.git` to `~/development`

4. symlink folders `ln -s ~/development/dotfiles/nvim ~/.config/nvim`

5. install vim-plug if vim plug is not in repo*
```
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

6. brew install fzf

7. brew install the_silver_searcher

8. `nvim +PlugInstall`
