---
author: jasonsandlin
title: "PFHCConfigSetting"
description: "Defines the config settings value that is passed to the below API's."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFHCConfigSetting  

Defines the config settings value that is passed to the below API's.    

## Syntax  
  
```cpp
enum class PFHCConfigSetting  : uint32_t  
{  
    SSLValidationEnforcedInRetailSandbox = 1  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| SSLValidationEnforcedInRetailSandbox | Only passed to the below API's to warn callers that this SSL validation is enforced RETAIL sandboxes regardless of this setting |  
  
  
## Requirements  
  
**Header:** PFHttpClient.h
  
## See also  
[PFHttpClient members](../pfhttpclient_members.md)  

  
  
