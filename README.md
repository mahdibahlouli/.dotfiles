# My Dotfiles

This repository contains my personal dotfiles and configurations for a productive development environment . It includes setups for Neovim, TMUX, Ghostty, and the Powerlevel10k prompt suited for the catppuccin theme.

---

## Contents

- **Neovim** (`~/.config/nvim`)  
  - `init.lua`, plugin configs, Mason setup, and Lua modules.
- **TMUX** (`~/.tmux`)  
  - Configured with plugins for better session and pane management.
- **Ghostty**  
  - Terminal UI configuration and theme.
- **Powerlevel10k**  
  - Zsh prompt theme for an informative shell prompt.

---

## Requirements

- Linux or Unix-based systems 
- Git
- GNU Stow
- Neovim
- TMUX
- Zsh (for Powerlevel10k)

---

## Setup Instructions

1. **Clone the repository:**

```bash
git clone https://github.com/mahdibahlouli/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
stow -R -t ~/.config nvim ghostty
stow -R ~ tmux powerlevel10k

