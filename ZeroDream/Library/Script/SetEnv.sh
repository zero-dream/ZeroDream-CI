#!/bin/bash
# Copyright (C) 2000 ZeroDream

# --------------------------------------------------

# SetEnv
# $1 key
# $2 value
function setEnv() {
  # Param
  local key=$1
  local value=$2
  # Declare global variables and export them
  declare -g "$key"
  export "$key"
  # SetEnv
  declare -n ref="$key"
  ref="$value"
  echo "$key=$value" >>$GITHUB_ENV
}
