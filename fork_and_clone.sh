#!/bin/bash

# List of repos to fork (org/name)
repos=(
  "BurntSushi/ripgrep"
  "starship/starship"
  "tokio-rs/tokio"
  "sharkdp/fd"
  "nushell/nushell"
)

# Destination folder
mkdir -p rust-projects
cd rust-projects

for repo in "${repos[@]}"
do
  name=$(basename "$repo")
  echo "🚀 Forking $repo..."
  gh repo fork "$repo" --clone --remote

  # Rename clone folder and move into structure
  if [ -d "$name" ]; then
    mv "$name" "$name-repo"
    echo "✅ Forked and renamed $name → $name-repo"
  fi
done
