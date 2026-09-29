---
author: jasonsandlin
title: "PFGameSaveFilesUploadOption"
description: "Options to use when uploading game save files"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFGameSaveFilesUploadOption  

Options to use when uploading game save files    

## Syntax  
  
```cpp
enum class PFGameSaveFilesUploadOption  : uint32_t  
{  
    KeepDeviceActive = 0,  
    ReleaseDeviceAsActive  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| KeepDeviceActive | Default behavior The device will be kept active after the upload |  
| ReleaseDeviceAsActive | Release the device as active. After this, this device can no longer be used to upload game save files. To upload again on the same session, call PFGameSaveUninitializeAsync and wait for it to complete. |  
  
  
## Requirements  
  
**Header:** PFGameSaveFilesTypes.h
  
## See also  
[PFGameSaveFilesTypes members](../pfgamesavefilestypes_members.md)  

  
  
