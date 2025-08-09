# dotfiles

Minimal shell configuration for macOS and Ubuntu. No bullshit.

## Install

```bash
git clone https://github.com/ivan-loh/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

## Architecture

```
.shellrc    # Core config (171 lines)
.bashrc     # Bash wrapper (12 lines)  
.zshrc      # Zsh wrapper (9 lines)
```

One main file. Two tiny wrappers. That's it.

## Commands

### Navigation
```bash
..          # cd ..
...         # cd ../..
....        # cd ../../..
```

### Git
```bash
gs          # git status
ga          # git add
gc          # git commit
gp          # git push
gpl         # git pull
gd          # git diff
gl          # git log --oneline --graph --decorate --all
```

### Docker
```bash
dps         # docker ps
dpsa        # docker ps -a
di          # docker images
dex         # docker exec -it
dl          # docker logs
dlf         # docker logs -f
```

### AWS
```bash
dev_start   # start EC2 instance
dev_stop    # stop EC2 instance
dev_state   # check status
dev_getip   # get public IP
dev_console # SSH into instance
```

### Functions
```bash
filesearch PATTERN [PATH]    # grep -rnw
mkcd DIR                     # mkdir && cd
extract FILE                 # handles tar.gz, zip, etc
docker_cleanup               # prune everything
```

### Screen

Prefix: `Ctrl-t`

```
u/j         # prev/next window
s/S         # split horizontal/vertical
+/-/_       # resize
x           # kill window
r           # reload config
,           # rename window
```

## Local Config

Machine-specific settings go in `~/.shellrc_local`:

```bash
export DEV_ID="i-1234567890abcdef0"
export AWS_KEY_PATH="$HOME/.ssh/key.pem"
export EDITOR="vim"
```

## Structure

```
~/dotfiles/
├── .shellrc        # everything
├── .bashrc         # sources .shellrc + prompt
├── .zshrc          # sources .shellrc + prompt
├── .screenrc       # GNU screen config
├── install.sh      # symlinks everything
└── uninstall.sh    # removes symlinks
```

## Compatibility

- macOS 10.15+ (zsh default)
- macOS with bash 3.2
- Ubuntu 18.04+ (bash 4+)
- Ubuntu with zsh

## Uninstall

```bash
cd ~/dotfiles
./uninstall.sh
```

Restores backups if available.

## License

MIT