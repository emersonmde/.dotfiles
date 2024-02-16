# .dotfiles

Install GNU Stow

```sh
brew install stow
```

Clone dotfiles
```sh
git clone git@github.com:emersonmde/.dotfiles.git && cd .dotfiles
```

Create symlinks
```sh
stow --no-folding .
```

