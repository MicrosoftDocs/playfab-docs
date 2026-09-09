---
author: jasonsandlin
title: "PFGameSaveFilesAddUserOptions"
description: "Options to use when adding a user to the game save system."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFGameSaveFilesAddUserOptions  

Options to use when adding a user to the game save system.    

## Syntax  
  
```cpp
enum class PFGameSaveFilesAddUserOptions  : uint32_t  
{  
    None = 0x00,  
    RollbackToLastKnownGood = 0x01,  
    RollbackToLastConflict = 0x02,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| None | Default behavior |  
| RollbackToLastKnownGood | Sync using the most recently verified prior cloud save state (a previously loaded save that was later replaced by a newer upload). Use when you suspect the latest upload is bad (e.g. load failure, failed integrity / version check, crash during or immediately after save, player reports corrupted / regressed state) and you want to automatically recover to the last known good manifest. If no earlier verified state exists this behaves like None and the current latest is kept. |  
| RollbackToLastConflict | Sync using the save state that was kept aside (the "losing" choice) from the most recent conflict resolution; falls back to latest if none. Use when you determine (or the player reports) that they chose the wrong side during the last conflict resolution dialog and you want to restore the alternate snapshot that was preserved for exactly that recovery opportunity. If no preserved conflict snapshot remains this quietly falls back to the current latest. |  
  
  
## Requirements  
  
**Header:** PFGameSaveFilesTypes.h
  
## See also  
[PFGameSaveFilesTypes members](../pfgamesavefilestypes_members.md)  

  
  
