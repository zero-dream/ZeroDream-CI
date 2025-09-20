#!/bin/bash
# Copyright (C) 2000 ZeroDream

# --------------------------------------------------

# Usage:
# mergeArr=('zero-dream/RepoA' 'zero-dream/RepoB') # $ZeroDreamCI > $GITHUB_REPOSITORY > RepoA > RepoB
# mergeRepo 'mergeArr'

# MergeRepo
# $1 __mergeArr MergeArr (ProhibitedValue: __mergeArr)
function mergeRepo() {
  # Param
  local -n __mergeArr=$1
  # MergeRepo
  local repoPath="$RUNNER_TEMP/ZeroDreamRepo-$(uuidgen | tr -d '-')"
  for repository in "${__mergeArr[@]}"; do
    repoName=$(echo -n "$repository" | md5sum | awk '{print $1}')
    # GitClone
    git clone --depth=1 https://github.com/$repository.git "$repoPath/$repoName/" || exit 1 # Exit
    # DeleteDir
    rm -rf "$repoPath/$repoName/.git/" # DeleteGitDir
    rm -rf "$repoPath/$repoName/hook/" # DeleteHookDir
    rm -rf "$repoPath/$repoName/zerodream/" # DeleteZeroDreamDir
    # MergeRepo
    cp -a "$GITHUB_WORKSPACE/." "$repoPath/$repoName/"
    find "$GITHUB_WORKSPACE/" -mindepth 1 -delete
    cp -a "$repoPath/$repoName/." "$GITHUB_WORKSPACE/"
    # DeleteRepo
    rm -rf "$repoPath/$repoName/"
  done
  return 0
}
