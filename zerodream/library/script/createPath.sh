#!/bin/bash
# Copyright (C) 2000 ZeroDream

# --------------------------------------------------

# Usage:
# 01: createTempPath 'path/test:dir'
# 02: createTempPath 'path/test:file'

# CreateTempPath
# $1 string
function createTempPath() {
  local string=$1
  createPath "$ZD_TempPath" "$string"
  return $?
}

# CreatePath
# $1 root
# $2 string
function createPath() {
  # Param
  local root=$1
  local string=$2
  # CreatePath
  local name="${string%:*}"
  local type="${string##*:}"
  path="$root/$name"
  if [[ "$type" == 'dir' ]]; then
    mkdir -p "$path"
  elif [[ "$type" == 'file' ]]; then
    touch "$path"
  else
    return 1
  fi
  echo "$path"
  return 0
}
