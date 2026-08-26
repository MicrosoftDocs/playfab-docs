---
author: jasonsandlin
title: "PFLocalizationGetLanguageListAsync"
description: "Retrieves the list of allowed languages, only accessible by title entities"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFLocalizationGetLanguageListAsync  

Retrieves the list of allowed languages, only accessible by title entities  

## Syntax  
  
```cpp
HRESULT PFLocalizationGetLanguageListAsync(  
    PFEntityHandle entityHandle,  
    const PFLocalizationGetLanguageListRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFLocalizationGetLanguageListRequest*](../../pflocalizationtypes/structs/pflocalizationgetlanguagelistrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Windows, Linux, and macOS. When the asynchronous task is complete, call [PFLocalizationGetLanguageListGetResultSize](pflocalizationgetlanguagelistgetresultsize.md) and [PFLocalizationGetLanguageListGetResult](pflocalizationgetlanguagelistgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFLocalization.h
  
## See also  
[PFLocalization members](../pflocalization_members.md)  

  
  
