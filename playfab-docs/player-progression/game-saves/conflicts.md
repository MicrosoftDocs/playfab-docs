---
title: Game Saves conflicts
author: jasonsandlin
description: Game Saves conflicts
ms.author: jasonsa
ms.date: 07/01/2025
ms.topic: article
ms.service: azure-playfab
keywords: playfab, game saves
ms.localizationpriority: medium
---

## Game Saves conflicts

Save conflicts occur when the same game data has been modified on multiple devices, and the system needs to determine which version to keep.

### When Conflicts Happen
Conflicts only occur during the sync operation (`PFGameSaveFilesAddUserWithUiAsync`) when **both** conditions are true:
1. **Local changes exist**: Files have been modified locally since the last sync
2. **Cloud changes exist**: Another device has uploaded newer data since the last sync

### Conflict Resolution Approach
Some file sync systems treat conflicts on a file-by-file basis – if the same file needs to be uploaded and also needs to be downloaded, then there's a conflict. In Game Saves, each root level subfolder is instead treated as an atomic unit. If there are any files or subfolders inside a root level subfolder that need to be downloaded and any files or folders in that same root subfolder that need to be uploaded, then the entire atomic unit is in conflict. This approach allows you to organize save data so that interdependent data integrity is maintained, while providing isolation between root subfolders for independent data that can be safely merged with changes to other atomic units. By using top level subfolders to structure your game save layout, you can minimize the likelihood of creating a conflict when changes to different atomic units happen on different devices. A slot-based game save system where each slot is a root level subfolder is a very simple example of how these atomic units can be used.
### User Choice Options
When conflicts occur, players choose between:
- **Use Local Data**: Keep the device's current save data (overwrites cloud data on next upload)
- **Use Cloud Data**: Download and use the cloud save data (overwrites local data)

A conflict resolution decision applies to all atomic units that are in conflict at the time of sync. If the player chooses cloud, all the conflicting atomic units will be downloaded, and conversely, choosing local leads to all being uploaded.

### Best Practices
- **Design folder structure carefully**: Group related save files into logical folders
- **Minimize conflicts**: Upload frequently to reduce the chance of conflicts
- **Clear conflict UI**: Help players understand what data they might lose with each choice
