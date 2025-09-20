#!/bin/bash
# Copyright (C) 2000 ZeroDream

# --------------------------------------------------

# ScriptDir
scriptDir=$(dirname "${BASH_SOURCE[0]}")

# CheckScript
find "$scriptDir/" -type f \
  -exec chmod +x {} \;

# Source
chmod +x "$scriptDir/../library/script/setEnv.sh"
source "$scriptDir/../library/script/setEnv.sh"

# --------------------------------------------------

# ZeroDreamEnv
setEnv 'ZD_Owner' 'zero-dream'
setEnv 'ZD_DATE' "$(TZ=UTC-8 date +"%y%m%d%H%M%S")"
setEnv 'ZD_MainPath' "$GITHUB_WORKSPACE/zerodream"
setEnv 'ZD_AppPath' "$GITHUB_WORKSPACE/application"
setEnv 'ZD_HookPath' "$GITHUB_WORKSPACE/hook"
setEnv 'ZD_TempPath' "$GITHUB_WORKSPACE/.zerodream-temp" && mkdir -p "$ZD_TempPath"

# --------------------------------------------------

# ZeroDreamCore
source "$scriptDir/script/mergeRepo.sh"
source "$scriptDir/script/check.sh"
source "$scriptDir/script/envVar.sh"
