---
author: jasonsandlin
title: "Services C API overview - PFDataTypes.h"
description: "Services C API overview - PFDataTypes.h"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# Services C API overview - PFDataTypes.h

  
## Structures  

| Structure | Description |  
| --- | --- |  
| [PFDataAbortFileUploadsRequest](structs/pfdataabortfileuploadsrequest.md) | PFDataAbortFileUploadsRequest data model. Aborts the pending upload of the requested files. |  
| [PFDataAbortFileUploadsResponse](structs/pfdataabortfileuploadsresponse.md) | PFDataAbortFileUploadsResponse data model. |  
| [PFDataDeleteFilesRequest](structs/pfdatadeletefilesrequest.md) | PFDataDeleteFilesRequest data model. Deletes the requested files from the entity's profile. |  
| [PFDataDeleteFilesResponse](structs/pfdatadeletefilesresponse.md) | PFDataDeleteFilesResponse data model. |  
| [PFDataFinalizeFileUploadsRequest](structs/pfdatafinalizefileuploadsrequest.md) | PFDataFinalizeFileUploadsRequest data model. Finalizes the upload of the requested files. Verifies that the files have been successfully uploaded and moves the file pointers from pending to live. |  
| [PFDataFinalizeFileUploadsResponse](structs/pfdatafinalizefileuploadsresponse.md) | PFDataFinalizeFileUploadsResponse data model. |  
| [PFDataGetFileMetadata](structs/pfdatagetfilemetadata.md) | PFDataGetFileMetadata data model. |  
| [PFDataGetFileMetadataDictionaryEntry](structs/pfdatagetfilemetadatadictionaryentry.md) | Dictionary entry for an associative array with PFDataGetFileMetadata values. |  
| [PFDataGetFilesRequest](structs/pfdatagetfilesrequest.md) | PFDataGetFilesRequest data model. Returns URLs that may be used to download the files for a profile for a limited length of time. Only returns files that have been successfully uploaded, files that are still pending will either return the old value, if it exists, or nothing. |  
| [PFDataGetFilesResponse](structs/pfdatagetfilesresponse.md) | PFDataGetFilesResponse data model. |  
| [PFDataGetObjectsRequest](structs/pfdatagetobjectsrequest.md) | PFDataGetObjectsRequest data model. Gets JSON objects from an entity profile and returns it. . |  
| [PFDataGetObjectsResponse](structs/pfdatagetobjectsresponse.md) | PFDataGetObjectsResponse data model. |  
| [PFDataInitiateFileUploadMetadata](structs/pfdatainitiatefileuploadmetadata.md) | PFDataInitiateFileUploadMetadata data model. |  
| [PFDataInitiateFileUploadsRequest](structs/pfdatainitiatefileuploadsrequest.md) | PFDataInitiateFileUploadsRequest data model. Returns URLs that may be used to upload the files for a profile 5 minutes. After using the upload calls FinalizeFileUploads must be called to move the file status from pending to live. |  
| [PFDataInitiateFileUploadsResponse](structs/pfdatainitiatefileuploadsresponse.md) | PFDataInitiateFileUploadsResponse data model. |  
| [PFDataObjectResult](structs/pfdataobjectresult.md) | PFDataObjectResult data model. |  
| [PFDataObjectResultDictionaryEntry](structs/pfdataobjectresultdictionaryentry.md) | Dictionary entry for an associative array with PFDataObjectResult values. |  
| [PFDataSetObject](structs/pfdatasetobject.md) | PFDataSetObject data model. |  
| [PFDataSetObjectInfo](structs/pfdatasetobjectinfo.md) | PFDataSetObjectInfo data model. |  
| [PFDataSetObjectsRequest](structs/pfdatasetobjectsrequest.md) | PFDataSetObjectsRequest data model. Sets JSON objects on the requested entity profile. May include a version number to be used to perform optimistic concurrency operations during update. If the current version differs from the version in the request the request will be ignored. If no version is set on the request then the value will always be updated if the values differ. Using the version value does not guarantee a write though, ConcurrentEditError may still occur if multiple clients are attempting to update the same profile. . |  
| [PFDataSetObjectsResponse](structs/pfdatasetobjectsresponse.md) | PFDataSetObjectsResponse data model. |  
