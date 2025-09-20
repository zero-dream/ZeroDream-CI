#!/bin/bash
# Copyright (C) 2000 ZeroDream

# --------------------------------------------------

# MergeRepo
ZeroDreamCiRepo="zero-dream/ZeroDream-CI"
repoPath="$ZD_TempPath/ZeroDreamCiRepo"
git clone --depth=1 https://github.com/$ZeroDreamCiRepo.git "$repoPath/" || exit 1 # Exit
find "$ZD_MainPath/" -mindepth 1 -delete
cp -a "$repoPath/zerodream/." "$ZD_MainPath/"
rm -rf "$repoPath/"
