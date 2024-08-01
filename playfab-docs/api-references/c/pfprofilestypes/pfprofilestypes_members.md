---
author: jasonsandlin
title: "Services C API overview - PFProfilesTypes.h"
description: "Services C API overview - PFProfilesTypes.h"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# Services C API overview - PFProfilesTypes.h

  
## Structures  

| Structure | Description |  
| --- | --- |  
| [PFProfilesEntityDataObject](structs/pfprofilesentitydataobject.md) | PFProfilesEntityDataObject data model. An entity object and its associated meta data. |  
| [PFProfilesEntityDataObjectDictionaryEntry](structs/pfprofilesentitydataobjectdictionaryentry.md) | Dictionary entry for an associative array with PFProfilesEntityDataObject values. |  
| [PFProfilesEntityPermissionStatement](structs/pfprofilesentitypermissionstatement.md) | PFProfilesEntityPermissionStatement data model. |  
| [PFProfilesEntityProfileBody](structs/pfprofilesentityprofilebody.md) | PFProfilesEntityProfileBody data model. |  
| [PFProfilesEntityProfileFileMetadata](structs/pfprofilesentityprofilefilemetadata.md) | PFProfilesEntityProfileFileMetadata data model. An entity file's meta data. To get a download URL call File/GetFiles API. |  
| [PFProfilesEntityProfileFileMetadataDictionaryEntry](structs/pfprofilesentityprofilefilemetadatadictionaryentry.md) | Dictionary entry for an associative array with PFProfilesEntityProfileFileMetadata values. |  
| [PFProfilesEntityStatisticAttributeValue](structs/pfprofilesentitystatisticattributevalue.md) | PFProfilesEntityStatisticAttributeValue data model. |  
| [PFProfilesEntityStatisticAttributeValueDictionaryEntry](structs/pfprofilesentitystatisticattributevaluedictionaryentry.md) | Dictionary entry for an associative array with PFProfilesEntityStatisticAttributeValue values. |  
| [PFProfilesEntityStatisticValue](structs/pfprofilesentitystatisticvalue.md) | PFProfilesEntityStatisticValue data model. |  
| [PFProfilesEntityStatisticValueDictionaryEntry](structs/pfprofilesentitystatisticvaluedictionaryentry.md) | Dictionary entry for an associative array with PFProfilesEntityStatisticValue values. |  
| [PFProfilesGetEntityProfileRequest](structs/pfprofilesgetentityprofilerequest.md) | PFProfilesGetEntityProfileRequest data model. Given an entity type and entity identifier will retrieve the profile from the entity store. If the profile being retrieved is the caller's, then the read operation is consistent, if not it is an inconsistent read. An inconsistent read means that we do not guarantee all committed writes have occurred before reading the profile, allowing for a stale read. If consistency is important the Version Number on the result can be used to compare which version of the profile any reader has. |  
| [PFProfilesGetEntityProfileResponse](structs/pfprofilesgetentityprofileresponse.md) | PFProfilesGetEntityProfileResponse data model. |  
| [PFProfilesGetEntityProfilesRequest](structs/pfprofilesgetentityprofilesrequest.md) | PFProfilesGetEntityProfilesRequest data model. Given a set of entity types and entity identifiers will retrieve all readable profiles properties for the caller. Profiles that the caller is not allowed to read will silently not be included in the results. |  
| [PFProfilesGetEntityProfilesResponse](structs/pfprofilesgetentityprofilesresponse.md) | PFProfilesGetEntityProfilesResponse data model. |  
| [PFProfilesGetTitlePlayersFromMasterPlayerAccountIdsRequest](structs/pfprofilesgettitleplayersfrommasterplayeraccountidsrequest.md) | PFProfilesGetTitlePlayersFromMasterPlayerAccountIdsRequest data model. Given a master player account id (PlayFab ID), returns all title player accounts associated with it. |  
| [PFProfilesGetTitlePlayersFromMasterPlayerAccountIdsResponse](structs/pfprofilesgettitleplayersfrommasterplayeraccountidsresponse.md) | PFProfilesGetTitlePlayersFromMasterPlayerAccountIdsResponse data model. |  
| [PFProfilesSetEntityProfilePolicyRequest](structs/pfprofilessetentityprofilepolicyrequest.md) | PFProfilesSetEntityProfilePolicyRequest data model. This will set the access policy statements on the given entity profile. This is not additive, any existing statements will be replaced with the statements in this request. |  
| [PFProfilesSetEntityProfilePolicyResponse](structs/pfprofilessetentityprofilepolicyresponse.md) | PFProfilesSetEntityProfilePolicyResponse data model. |  
| [PFProfilesSetProfileLanguageRequest](structs/pfprofilessetprofilelanguagerequest.md) | PFProfilesSetProfileLanguageRequest data model. Given an entity profile, will update its language to the one passed in if the profile's version is equal to the one passed in. |  
| [PFProfilesSetProfileLanguageResponse](structs/pfprofilessetprofilelanguageresponse.md) | PFProfilesSetProfileLanguageResponse data model. |  
  
## State changes  
  
| State change | Description |  
| --- | --- |  
  
## Enumerations  

| Enumeration | Description |  
| --- | --- |  
| [PFProfilesEffectType](enums/pfprofileseffecttype.md) | EffectType enum.|  
