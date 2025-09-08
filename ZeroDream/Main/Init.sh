#!/bin/bash
# Copyright (C) 2000 ZeroDream

# --------------------------------------------------

# ScriptDir
scriptDir=$(dirname "${BASH_SOURCE[0]}")

# Source
source "$scriptDir/../Library/Script/SetEnv.sh"

# --------------------------------------------------

# CheckScript
find "$scriptDir/" -type f \
  -exec chmod +x {} \;

# --------------------------------------------------

# MergeZeroDreamRepo
ZeroDreamRepo="zero-dream/ZeroDream-CI"
repoPath="$RUNNER_TEMP/ZeroDreamRepo-$(uuidgen | tr -d '-')/ZeroDreamCI"
git clone --depth=1 https://github.com/$ZeroDreamRepo.git "$repoPath/" || exit 1 # Exit
rm -rf "$GITHUB_WORKSPACE/ZeroDream/"
cp -a "$repoPath/ZeroDream/" "$GITHUB_WORKSPACE/"
rm -rf "$repoPath/"

# --------------------------------------------------

# ZeroDreamCore
source "$scriptDir/Script/Check.sh"
source "$scriptDir/Script/EnvVar.sh"
source "$scriptDir/Script/Setting.sh"
