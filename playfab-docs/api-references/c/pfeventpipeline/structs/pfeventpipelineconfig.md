---
author: jasonsandlin
title: "PFEventPipelineConfig"
description: "Defines the Event Pipeline configuration."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFEventPipelineConfig  

Defines the Event Pipeline configuration.  

## Syntax  
  
```cpp
struct PFEventPipelineConfig {  
    uint32_t* maxEventsPerBatch;  
    uint32_t* maxWaitTimeInSeconds;  
    uint32_t* pollDelayInMs;  
    PFHCCompressionLevel* compressionLevel;  
    bool* retryOnDisconnect;  
    size_t* bufferSize;  
}  
```
  
### Members  
  
**`maxEventsPerBatch`** &nbsp; uint32_t*  
*may be nullptr*  
  
The maximum number events that will be batched before writing them to PlayFab. If sent null, default value will be used (5 for Telemetry / 5 for PlayStream).
  
**`maxWaitTimeInSeconds`** &nbsp; uint32_t*  
*may be nullptr*  
  
The maximum time the pipeline will wait before sending out an incomplete batch. If sent null, default value will be used (3 for Telemetry / 3 for PlayStream).
  
**`pollDelayInMs`** &nbsp; uint32_t*  
*may be nullptr*  
  
How long the pipeline will wait to read from the event buffer again after emptying it. If sent null, default value will be used (10 for Telemetry / 10 for PlayStream).
  
**`compressionLevel`** &nbsp; [PFHCCompressionLevel*](../../pfhttpclient/enums/pfhccompressionlevel.md)  
*may be nullptr*  
  
The event pipeline will send events using GZIP compression with the level specified. If sent null, no compression will be made.
  
**`retryOnDisconnect`** &nbsp; bool*  
*may be nullptr*  
  
The event pipeline will retry sending events that failed due to lost connection. If sent null, default behavior will be to retry (true) (not available for PlayStream).
  
**`bufferSize`** &nbsp; size_t*  
*may be nullptr*  
  
The limit of the amount of events in the pipeline's buffer. If sent null, default value will be used (1024 for either type).
  
  
## Requirements  
  
**Header:** PFEventPipeline.h
  
## See also  
[PFEventPipeline members](../pfeventpipeline_members.md)  

  
  
