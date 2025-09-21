#!/bin/bash
# Copyright (C) 2000 ZeroDream

# --------------------------------------------------

# LibraryPath
setEnv 'ZD_LibPath' "$ZD_MainPath/library"
setEnv 'ZD_AppLibPath' "$ZD_LibPath/application"
setEnv 'ZD_ScriptLibPath' "$ZD_LibPath/script"

# --------------------------------------------------

# Source
source "$ZD_ScriptLibPath/createPath.sh"

# UploadReleasePath
releaseUploadPath=$(createTempPath 'upload-release:dir')
setEnv 'ZD_ReleaseUploadPath' "$releaseUploadPath"

# UploadArtifactPath
artifactUploadPath=$(createTempPath 'upload-artifact:dir')
setEnv 'ZD_ArtifactUploadPath' "$artifactUploadPath"
