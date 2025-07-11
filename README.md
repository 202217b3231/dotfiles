# Manage dotfiles with git bare repo
```
git init --bare $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.bashrc
```
### `$HOME` folder can be versioned with normal commands, replacing git with your newly created config alias, like:
```
config status
config add .vimrc
config commit -m "Add vimrc"
config add .bashrc
config commit -m "Add bashrc"
config push
```
---
# Installing your dotfiles onto a new system (or migrate to this setup)
- Make sure you have committed the alias to your `.bashrc` or `.zsh`:

 `alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'`
- `echo ".cfg" >> .gitignore`
- `git clone --bare <git-repo-url> $HOME/.cfg`
- `alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'`

- `config checkout`
    - Run below if error
        ```
        mkdir -p .config-backup && \
        config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
        xargs -I{} mv {} .config-backup/{}
        ```
- Rerun `config checkout`
- `config config --local status.showUntrackedFiles no`


# Bash script
```
git clone --bare https://bitbucket.org/durdn/cfg.git $HOME/.cfg
function config {
   /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}
mkdir -p .config-backup
config checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;
config checkout
config config status.showUntrackedFiles no
```

> Reference: [Dotfiles: Best way to store in a bare git repository](https://www.atlassian.com/git/tutorials/dotfiles)
