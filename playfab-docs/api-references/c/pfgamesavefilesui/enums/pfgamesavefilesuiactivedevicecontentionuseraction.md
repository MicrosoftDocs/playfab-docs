---
author: jasonsandlin
title: "PFGameSaveFilesUiActiveDeviceContentionUserAction"
description: "The user action of the PFGameSaveFilesUiActiveDeviceContentionCallback."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFGameSaveFilesUiActiveDeviceContentionUserAction  

The user action of the PFGameSaveFilesUiActiveDeviceContentionCallback.    

## Syntax  
  
```cpp
enum class PFGameSaveFilesUiActiveDeviceContentionUserAction  : uint32_t  
{  
    Cancel = 0,  
    Retry,  
    SyncLastSavedData,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| Cancel | Cancel the current operation. |  
| Retry | Retry the current operation. |  
| SyncLastSavedData | Sync the last saved data. This makes the local device active. After this, the remote device will not be able to upload since it is no longer the active device. This prevents unsynchronized progression from multiple devices |  
  
  
## Requirements  
  
**Header:** PFGameSaveFilesUi.h
  
## See also  
[PFGameSaveFilesUi members](../pfgamesavefilesui_members.md)  

  
  
