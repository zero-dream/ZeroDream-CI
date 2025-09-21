#!/bin/bash
# Copyright (C) 2000 ZeroDream

# --------------------------------------------------

# CheckScript
find "$GITHUB_WORKSPACE/" -type f \
  -iregex ".*\.\(sh\|hook\)$" \
  -exec chmod +x {} \;
find "$ZD_MainPath/" -type f \
  ! -name '.gitkeep' \
  -exec chmod +x {} \;
find "$ZD_AppPath/" -type f \
  ! -name '.gitkeep' \
  -exec chmod +x {} \;
