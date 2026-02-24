#!/usr/bin/env bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

#
# dotfiles を展開するためのスクリプト
# 現在は stow に依存している。

# （変更不可）
# インストールした Stow を使って dotfiles を展開するベースとなるディレクトリを定義
CONF_DIR_NAME=conf.d
CONF_DIR=$SCRIPT_DIR/$CONF_DIR_NAME

check_expand_tools() {
  if stow > /dev/null 2>&1; then
    echo stow is not installed.
    exit 1
  fi
}

expand_dotfiles() {
  if [[ ! -d $CONF_DIR ]]; then
    echo "$CONF_DIR was not found."
    exit 1
  fi

  pushd $CONF_DIR > /dev/null
  for d in $(find -maxdepth 1 -type d | cut -d"/" -f 2 | grep -v '^\.'); do
    stow -R -t $HOME $d
  done
  popd > /dev/null
}

main() {
  check_expand_tools
  expand_dotfiles
  echo "Done."
}

main "$@"

