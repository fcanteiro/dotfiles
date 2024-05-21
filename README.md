# .dotfiles

# Requirements

## Install Homebrew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

- Make sure Homebrew is added to your PATH

```bash
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/$(whoami)/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
```

- Check if Homebrew is ready

```bash
brew doctor
```

#### You should see: `Your system is ready to brew.`

## Install Xcode Command Line Tools

```bash
xcode-select --install
```

# How to start:

```bash
cd ~ && mkdir .dotfiles && cd .dotfiles && /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/fcanteiro/dotfiles/main/install.sh)"
```

## To Install Development Tools and Quality of Life Tools:

```bash
~/.dotfiles/install/install-dev-tools.sh && ~/.dotfiles/install/install-qol.sh
```

### Install Just Development Tools:

```bash
~/.dotfiles/install/install-dev-tools.sh
```

### Install Just Quality of Life Tools:

```bash
~/.dotfiles/install/install-qol.sh
```
