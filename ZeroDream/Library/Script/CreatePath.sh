#!/bin/bash
# Copyright (C) 2000 ZeroDream

# --------------------------------------------------

# Usage:
# 01: createTempPath 'Path/Test:Dir'
# 02: createTempPath 'Path/Test:File'
# 03: createDataPath 'Path/Test:Dir'
# 04: createDataPath 'Path/Test:File'

# CreateTempPath
# $1 string
function createTempPath() {
  local string=$1
  createPath "$ZD_TempPath" "$string"
}

# CreateDataPath
# $1 string
function createDataPath() {
  local string=$1
  createPath "$ZD_DataPath" "$string"
}

# CreatePath
# $1 rootPath
# $2 string
function createPath() {
  # Param
  local rootPath=$1
  local string=$2
  # CreatePath
  local name="${string%:*}"
  local type="${string##*:}"
  local uuid=$(uuidgen | tr -d '-')
  path="$rootPath/$name-$uuid"
  if [[ "$type" == 'Dir' ]]; then
    mkdir -p "$path"
  elif [[ "$type" == 'File' ]]; then
    touch "$path"
  else
    return 1
  fi
  echo "$path"
  return 0
}
