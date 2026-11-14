---
author: jasonsandlin
title: "PFJsonObject"
description: "Holds a JSON object as a null-terminated string."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: "11/13/2026"
---

# PFJsonObject  

Holds a JSON object as a null-terminated string.

## Syntax

```cpp
typedef struct PFJsonObject {  
    const char* stringValue;  
} PFJsonObject;  
```

### Members

**`stringValue`**   const char\*<br />_may be nullptr_<br />_is null-terminated_

The serialized JSON object. In a result, this member can be `nullptr`. For example, when the service omits `DisplayProperties` for a catalog item, the `displayProperties.stringValue` member of [PFCatalogCatalogItem](../../pfcatalogtypes/structs/pfcatalogcatalogitem.md) is `nullptr`. Check for `nullptr` before you parse it.

## Requirements

**Header:** PFTypes.h

## See also

[PFTypes members](../pftypes_members.md)

  
  
