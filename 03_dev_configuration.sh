#!/usr/bin/env bash
set -uo pipefail

. "${HOME}/.local/share/my-scripts/common.sh"

write_once '. $HOME/.local/share/my-scripts/common.sh' "$HOME/.bashrc"

if mise use -g starship; then
  write_once 'eval "$(starship init bash)"' "$HOME/.bashrc"
fi

if mise use -g bat; then
  bat cache --build
fi

if mise use -g fzf fd; then
  write_once 'eval "$(fzf --bash)"' "$HOME/.bashrc"
  write_once 'export FZF_DEFAULT_OPTS=" --color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8 --color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC --color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 --color=selected-bg:#45475A --color=border:#6C7086,label:#CDD6F4"' "$HOME/.bashrc"
fi

if mise use -g zoxide; then
  write_once 'eval "$(zoxide init bash)"' "$HOME/.bashrc"
fi

if mise use -g yazi; then
  write_once '. $HOME/.local/share/my-scripts/yazi/init.sh' "$HOME/.bashrc"
fi

if mise use -g zellij; then
  write_once 'eval "$(zellij setup --generate-auto-start bash)"' "$HOME/.bashrc"
fi

if mise use -g neovim; then
  # alias では非ログインシェルで neovim を使えないので、環境変数で明示する
  write_once 'export EDITOR=nvim' "$HOME/.bashrc"
  write_once 'export VISUAL=nvim' "$HOME/.bashrc"
fi

if mise use -g github-cli; then
  gh extension install dlvhdr/gh-dash
fi

mise install
