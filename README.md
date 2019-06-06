# dotfiles

## Neovim setup

1. brew update

2. brew install neovim/neovim/neovim

3. clone dotfiles repo `git@github.com:wontaeyang/dotfiles.git` to `~/development`

4. clone powerline fonts `https://github.com/powerline/fonts.git` to `~/development`

5. install fonts `./install.sh` in `~/development/fonts`

4. symlink folders `ln -s ~/development/dotfiles/nvim ~/.config/nvim`

5. install vim-plug if vim plug is not in repo*
```
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

6. brew install fzf

7. brew install the_silver_searcher

8. gem install rubocop

8. `nvim +PlugInstall`


## to-do

1. add .bash_profile

2. add .bash_rc

## apps

1. tripmode (block network activity on mobile tether) https://www.tripmode.ch/
2. 1password (password manager) https://1password.com/
3. little snitch (monitor network requests going out of computer) https://www.obdev.at/products/littlesnitch/index.html
4. alfred (search bar) https://www.alfredapp.com/
5. karabiner (keyboard customization) https://pqrs.org/osx/karabiner/
6. amphetamine (keep mac awake) https://itunes.apple.com/us/app/amphetamine/id937984704?mt=12
7. gitx (git client) http://gitx.github.io/
