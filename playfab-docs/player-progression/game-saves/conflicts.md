---
title: Game Save conflicts
author: jasonsandlin
description: Game Save conflicts
ms.author: jasonsa
ms.date: 07/01/2025
ms.topic: article
ms.service: azure-playfab
keywords: playfab, game saves
ms.localizationpriority: medium
---

## Game Save conflicts

Save conflicts occur when the same game data has been modified on multiple devices, and the system needs to determine which version to keep.

### When Conflicts Happen
Conflicts only occur during the sync operation (`PFGameSaveFilesAddUserWithUiAsync`) when **both** conditions are true:
1. **Local changes exist**: Files have been modified locally since the last sync
2. **Cloud changes exist**: Another device has uploaded newer data since the last sync

### Conflict Resolution Approach
Some file sync systems such as OneDrive treat conflicts on a file-by-file basis – if the same file needs to be uploaded and also needs to be downloaded, then there's a conflict. In this product, each root level subfolder is considered an atomic unit when it comes to conflict detection. If any files or subfolders inside a single root level subfolder need to both download and upload, then there's a conflict. This approach better matches how games organize save data, where files within a root level subfolder are often interdependent.

### User Choice Options
When conflicts occur, players choose between:
- **Use Local Data**: Keep the device's current save data (overwrites cloud data on next upload)
- **Use Cloud Data**: Download and use the cloud save data (overwrites local data)

### Best Practices
- **Design folder structure carefully**: Group related save files into logical folders
- **Minimize conflicts**: Upload frequently to reduce the chance of conflicts
- **Clear conflict UI**: Help players understand what data they might lose with each choice
