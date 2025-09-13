#!/bin/bash
# Copyright (C) 2000 ZeroDream

# --------------------------------------------------

# LibraryPath
setEnv 'ZD_LibPath' "$ZD_MainPath/Library"
setEnv 'ZD_AppLibPath' "$ZD_LibPath/Application"
setEnv 'ZD_ScriptLibPath' "$ZD_LibPath/Script"

# --------------------------------------------------

# Source
source "$ZD_ScriptLibPath/CreatePath.sh"

# TempPath
tempPath="$RUNNER_TEMP/ZeroDreamTemp-$(uuidgen | tr -d '-')" && mkdir -p "$tempPath"
setEnv 'ZD_TempPath' "$tempPath"

# DataPath
dataPath="$RUNNER_TEMP/ZeroDreamData-$(uuidgen | tr -d '-')" && mkdir -p "$dataPath"
setEnv 'ZD_DataPath' "$dataPath"

# UploadReleasePath
releaseUploadPath=$(createDataPath 'UploadRelease:Dir')
setEnv 'ZD_ReleaseUploadPath' "$releaseUploadPath"

# UploadArtifactPath
artifactUploadPath=$(createDataPath 'UploadArtifact:Dir')
setEnv 'ZD_ArtifactUploadPath' "$artifactUploadPath"
