#!/bin/bash
# Copyright (C) 2000 ZeroDream

# --------------------------------------------------

# Tip: Due to the workflows restrictions of GitHub, git commands can only run within $GITHUB_WORKSPACE

# GitPush
# $1 githubRef
# $2 message
function gitPush() {
  # Param
  local githubRef=$1
  local message="${2:-[$ZD_DATE]}"
  # GitConfig
  git config --global user.name "github-actions[bot]"
  git config --global user.email "github-actions[bot]@users.noreply.github.com"
  # Check if the file has been modified
  git add "$GITHUB_WORKSPACE/"
  if git diff-index HEAD --quiet --; then
    echo "No changes to commit"
    return 0
  else
    local commitMessage="ZeroDreamCI $message"
    git commit -m "$commitMessage"
    git push origin HEAD:$githubRef
    return $?
  fi
}
