---
author: jasonsandlin
title: "PFSegmentsPlayerLocation"
description: "PFSegmentsPlayerLocation data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFSegmentsPlayerLocation  

PFSegmentsPlayerLocation data model.  

## Syntax  
  
```cpp
typedef struct PFSegmentsPlayerLocation {  
    const char* city;  
    PFContinentCode continentCode;  
    PFCountryCode countryCode;  
    double const* latitude;  
    double const* longitude;  
} PFSegmentsPlayerLocation;  
```
  
### Members  
  
**`city`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) City of the player's geographic location.
  
**`continentCode`** &nbsp; [PFContinentCode](../../pftypes/enums/pfcontinentcode.md)  
  
The two-character continent code for this location.
  
**`countryCode`** &nbsp; [PFCountryCode](../../pftypes/enums/pfcountrycode.md)  
  
The two-character ISO 3166-1 country code for the country associated with the location.
  
**`latitude`** &nbsp; double const*  
*may be nullptr*  
  
(Optional) Latitude coordinate of the player's geographic location.
  
**`longitude`** &nbsp; double const*  
*may be nullptr*  
  
(Optional) Longitude coordinate of the player's geographic location.
  
  
## Requirements  
  
**Header:** PFSegmentsTypes.h
  
## See also  
[PFSegmentsTypes members](../pfsegmentstypes_members.md)  

  
  
