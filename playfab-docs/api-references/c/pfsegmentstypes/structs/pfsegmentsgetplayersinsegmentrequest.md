---
author: jasonsandlin
title: "PFSegmentsGetPlayersInSegmentRequest"
description: "PFSegmentsGetPlayersInSegmentRequest data model. Initial request must contain at least a Segment ID. Subsequent requests must contain the Segment ID as well as the Continuation Token. Failure to send the Continuation Token will result in a new player segment list being generated. Each time the Continuation Token is passed in the length of the Total Seconds to Live is refreshed. If too much time passes between requests to the point that a subsequent request is past the Total Seconds to Live an error will be returned and paging will be terminated. This API is resource intensive and should not be used in scenarios which might generate high request volumes. Only one request to this API at a time should be made per title. Concurrent requests to the API may be rejected with the APIConcurrentRequestLimitExceeded error."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFSegmentsGetPlayersInSegmentRequest  

PFSegmentsGetPlayersInSegmentRequest data model. Initial request must contain at least a Segment ID. Subsequent requests must contain the Segment ID as well as the Continuation Token. Failure to send the Continuation Token will result in a new player segment list being generated. Each time the Continuation Token is passed in the length of the Total Seconds to Live is refreshed. If too much time passes between requests to the point that a subsequent request is past the Total Seconds to Live an error will be returned and paging will be terminated. This API is resource intensive and should not be used in scenarios which might generate high request volumes. Only one request to this API at a time should be made per title. Concurrent requests to the API may be rejected with the APIConcurrentRequestLimitExceeded error.  

## Syntax  
  
```cpp
typedef struct PFSegmentsGetPlayersInSegmentRequest {  
    const char* continuationToken;  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    bool const* getProfilesAsync;  
    uint32_t const* maxBatchSize;  
    uint32_t const* secondsToLive;  
    const char* segmentId;  
} PFSegmentsGetPlayersInSegmentRequest;  
```
  
### Members  
  
**`continuationToken`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Continuation token if retrieving subsequent pages of results.
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`getProfilesAsync`** &nbsp; bool const*  
*may be nullptr*  
  
(Optional) If set to true, the profiles are loaded asynchronously and the response will include a continuation token and approximate profile count until the first batch of profiles is loaded. Use this parameter to help avoid network timeouts.
  
**`maxBatchSize`** &nbsp; uint32_t const*  
*may be nullptr*  
  
(Optional) Maximum is 10,000. The value 0 will prevent loading any profiles and return only the count of profiles matching this segment.
  
**`secondsToLive`** &nbsp; uint32_t const*  
*may be nullptr*  
  
(Optional) Number of seconds to keep the continuation token active. After token expiration it is not possible to continue paging results. Default is 300 (5 minutes). Maximum is 5,400 (90 minutes).
  
**`segmentId`** &nbsp; const char*  
*is null-terminated*  
  
Unique identifier for this segment.
  
  
## Requirements  
  
**Header:** PFSegmentsTypes.h
  
## See also  
[PFSegmentsTypes members](../pfsegmentstypes_members.md)  

  
  
