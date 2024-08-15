---
author: jasonsandlin
title: "PFLocationModel"
description: "PFLocationModel data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFLocationModel  

PFLocationModel data model.  

## Syntax  
  
```cpp
typedef struct PFLocationModel {  
    const char* city;  
    PFContinentCode const* continentCode;  
    PFCountryCode const* countryCode;  
    double const* latitude;  
    double const* longitude;  
} PFLocationModel;  
```
  
### Members  
  
**`city`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) City name.
  
**`continentCode`** &nbsp; [PFContinentCode](../enums/pfcontinentcode.md) const*  
*may be nullptr*  
  
(Optional) The two-character continent code for this location.
  
**`countryCode`** &nbsp; [PFCountryCode](../enums/pfcountrycode.md) const*  
*may be nullptr*  
  
(Optional) The two-character ISO 3166-1 country code for the country associated with the location.
  
**`latitude`** &nbsp; double const*  
*may be nullptr*  
  
(Optional) Latitude coordinate of the geographic location.
  
**`longitude`** &nbsp; double const*  
*may be nullptr*  
  
(Optional) Longitude coordinate of the geographic location.
  
  
## Requirements  
  
**Header:** PFTypes.h
  
## See also  
[PFTypes members](../pftypes_members.md)  

  
  
