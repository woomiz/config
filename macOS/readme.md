## macOS Setup

## Packages

1. ## **Git**

   #### Configure Git

   ```sh
   ln -sf ~/packages/config/macOS/dotfiles/.gitconfig ~/.gitconfig
   ```

   #### Setup SSH

   ```sh
   cd ~/.ssh &&
   ssh-keygen -t ed25519 -f github
   ```

1. ## **Homebrew**

   ```sh
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   brew doctor # To check if brew is installed correctly
   ```

1. ## **Wezterm**

   ```sh
   brew install --cask wezterm
   ```

1. ## **Zsh**

   Follow the directory for install instructions.

1. ## **Neovim**

   Follow the directory for install instructions.

   #### Configure Neovim

   ```sh
   mkdir -p ~/.config/nvim &&
   ln -sf ~/packages/config/macOS/nvim/init.vim ~/.config/nvim/init.vim
   ```

1. ## **fnm**

   ```sh
   brew install fnm &&
   fnm use 22
   ```

1. ## **Bun**

   ```sh
   curl -fsSL https://bun.com/install | bash
   ```

1. ## **keePassXC**

   Go to official [website](https://keepassxc.org/download/#macos) and download the latest version for macOS and install it.

1. ## **mailpit**

   Follow the directory for install instructions.

1. ## **wakatime**

   ```sh
   ln -sf ~/packages/config/macOS/dotfiles/.wakatime.cfg ~/.wakatime.cfg
   ```

   Go to wakatime [webiste](https://wakatime.com/) -> settings and get the `secret api key` and replace that inside the file. Current key is old.

   ```sh
   vim ~/packages/config/macOS/dotfiles/.wakatime.cfg
   ```
