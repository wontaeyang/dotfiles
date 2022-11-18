# dotfiles

## Neovim setup

1. brew update

2. brew install neovim/neovim/neovim

3. clone dotfiles repo `git@github.com:wontaeyang/dotfiles.git` to `~/development`

4. install fonts `./install.sh` in `~/development/fonts`

5. symlink folders `ln -s ~/development/dotfiles/nvim ~/.config/nvim`

6. symlink zshrc `ln -s ~/development/dotfiles/.zshrc ~/.zshrc`

7. install vim-plug if vim plug is not in repo

```
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

6. brew install fzf

7. brew install ripgrep

8. `nvim +PlugInstall`


## apps

* tripmode (block network activity on mobile tether) https://www.tripmode.ch/
* 1password (password manager) https://1password.com/
* alfred (search bar) https://www.alfredapp.com/
* karabiner (keyboard customization) https://pqrs.org/osx/karabiner/
* amphetamine (keep mac awake) https://itunes.apple.com/us/app/amphetamine/id937984704?mt=12
* gitx (git client) http://gitx.github.io/
* paw
* licecap
* monodraw
