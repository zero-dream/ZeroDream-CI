#!/bin/bash
# Copyright (C) 2000 ZeroDream

# --------------------------------------------------

# ScriptDir
scriptDir=$(dirname "${BASH_SOURCE[0]}")

# Source
source "$scriptDir/../Library/Script/SetEnv.sh"

# ZeroDreamEnv
setEnv 'ZD_DATE' "$(TZ=UTC-8 date +"%y%m%d%H%M%S")"
setEnv 'ZD_Owner' 'zero-dream'
setEnv 'ZD_MainPath' "$GITHUB_WORKSPACE/ZeroDream"
setEnv 'ZD_HookPath' "$GITHUB_WORKSPACE/Hook"
setEnv 'ZD_AppPath' "$GITHUB_WORKSPACE/Application"

# --------------------------------------------------

# CheckScript
find "$scriptDir/" -type f \
  -exec chmod +x {} \;

# --------------------------------------------------

# MergeZeroDreamRepo
ZeroDreamRepo="zero-dream/ZeroDream-CI"
repoPath="$RUNNER_TEMP/ZeroDreamRepo-$(uuidgen | tr -d '-')/ZeroDreamCI"
git clone --depth=1 https://github.com/$ZeroDreamRepo.git "$repoPath/" || exit 1 # Exit
find "$ZD_MainPath/" -mindepth 1 -delete
cp -a "$repoPath/ZeroDream/." "$ZD_MainPath/"
rm -rf "$repoPath/"

# --------------------------------------------------

# ZeroDreamCore
source "$scriptDir/Script/Check.sh"
source "$scriptDir/Script/EnvVar.sh"
