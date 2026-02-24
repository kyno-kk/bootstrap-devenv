#!/usr/bin/env bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# （変更不可）
# Ansible の構成情報を管理するためのディレクトリを定義
ANSIBLE_DIR=$SCRIPT_DIR/ansible

ansible-playbook -i local, -K $ANSIBLE_DIR/setup.yml

