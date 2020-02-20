---
title: Upgrade guide for 0.7.190918 -> 0.7.200220
author: gufabre
description: Description of breaking changes of new cpp nuget release.
ms.author: gufabre
ms.date: 02/19/2020
ms.topic: article
ms.prod: playfab
keywords: playfab, development, release, apis, features
ms.localizationpriority: medium
---

# Upgrade guide for 0.7.190918 -> 0.7.200220

The new release of cpp Gsdk will contain a some breaking changes, detailed later in the document. The primary goal for these changes is to maintain thread safety. The un-fixed implementation would allow a thread to alter a dictionary while another thread read it, causing exceptions.

The PR itself has a thorough explanation of all changes (here)[https://github.com/PlayFab/gsdk/pull/43/].

Most customers will only be affected by 3 very minor breaking changes in this PR. Nearly all customers will need to change 1 or 2 lines of code, but very few customers should need to change more. The upgrade guide below should cover all possible changes required for even the most obscure breaking changes.

## Upgrade instructions - Affects most/all customers


All customers will need to update how they treat the returned value of the following methods:
1. `GSDK::getConfigSettings()`
2. `GSDK::getLogsDirectory()`
3. `GSDK::getSharedContentDirectory()`

* All customers should change the expected return value from references to objects:

    `GSDK::getConfigSettings()`
    * Old: ```const std::unordered_map<std::string, std::string>& config = GSDK::getConfigSettings();```
    * New: ```const std::unordered_map<std::string, std::string> config = GSDK::getConfigSettings();```

    `GSDK::getLogsDirectory()`
    * Old: ```const std::string& logsDirectory = GSDK::getLogsDirectory();```
    * New: ```const std::string logsDirectory = GSDK::getLogsDirectory();```

    `GSDK::getSharedContentDirectory()`
    * Old: ```const std::string& sharedContentDirectory = GSDK::getSharedContentDirectory();```
    * New: ```const std::string sharedContentDirectory = GSDK::getSharedContentDirectory();```

We apologize that while trivial, these changes were necessary in order to ensure thread safety.
