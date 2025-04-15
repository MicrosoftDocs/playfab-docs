---
title: Multiplayer Android getting started
author: yuehanlin
description: Android supplement for PlayFab Multiplayer quickstart
ms.author: yuehanlin
ms.date: 04/11/2025
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, party, networking, communication, prerequisites, Android
ms.localizationpriority: medium
---

# Getting started for PlayFab Multiplayer Android C++ SDK
This document lists the basic prerequisites and steps to integrate PlayFab Multiplayer into your Android applications.

## Prerequisites

- A [PlayFab developer account](https://developer.playfab.com).  
- [Android Studio](https://developer.android.com/studio) installed.

## Project setup

Download the PlayFab Multiplayer to your project from the [PlayFab Multiplayer Release Page](https://github.com/PlayFab/PlayFabMultiplayer/releases).

### Integrate PlayFab Multiplayer into your own project

These next steps are written with the assumption that you have created a new project using Android Studio.

#### Add binaries to your game

There are two parts of the binaries that you'll need to integrate into your project: the shared object files (.so) and the android archive files (.aar). You can build the binaries yourself or you can download them from the releases page.

#### Adding the .so files

These files are integrated into your project using CMake.

1. Unzip the PlayFab Multiplayer Android zip file for Android release and place its contents in your desired directory.

2. Using `TARGET_INCLUDE_DIRECTORIES` or another equivalent function, add the headers under "Include" from the PlayFab Multiplayer release:
```cmake
TARGET_INCLUDE_DIRECTORIES(
    ${PROJECT_NAME}
    "Include"
)
```
3. Using `TARGET_LINK_LIBRARIES` or another equivalent function, link the locations of the .so files to your project.

    For example:

```cmake
set(PLAYFAB_MULTIPLAYER_PATH "[LOCATION OF YOUR FILE]/libPlayFabMultiplayer.so")

TARGET_LINK_LIBRARIES(
    [YOUR PROJECT NAME]
    ${PLAYFAB_MULTIPLAYER_PATH}
)
```

#### Adding the .aar files

These files are integrated into your project using Gradle.

1. Create a libs folder within app level Android project directory.
2. Copy the .aar files into the libs folder.
   > **Note:** If your project already includes `libHttpClient` as a dependency, make sure to only link **one** instance of `libHttpClient.Android-release.aar` to avoid duplicate symbol errors.
3. In app level build.gradle file, the one in the same directory as the libs folder, add these lines to the dependencies section. The second line is required as a dependency for libHttpClient.

```gradle
implementation fileTree(dir: 'libs', include: ['*.aar'])
implementation 'com.squareup.okhttp3:okhttp:4.9.1'
```
