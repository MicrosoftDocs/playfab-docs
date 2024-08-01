---
author: jasonsandlin
title: "Services C API overview - PFEventPipeline.h"
description: "Services C API overview - PFEventPipeline.h"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# Services C API overview - PFEventPipeline.h

  
## Functions  

| Function | Description |  
| --- | --- |  
| [PFEventPipelineAddUploadingEntity](functions/pfeventpipelineadduploadingentity.md) | Adds an entity to an existing pipeline. All events emitted will be linked to this entity. |  
| [PFEventPipelineBatchUploadFailedEventHandler](functions/pfeventpipelinebatchuploadfailedeventhandler.md) | A handler invoked when the SDK has attempted but failed to upload a batch of event pipeline events. It is up to the client to resubmit failed events as necessary using PFEventPipelineEmitEvent, though depending on the nature of the failure, resubmitting directly may not resolve the issue. |  
| [PFEventPipelineBatchUploadSucceededEventHandler](functions/pfeventpipelinebatchuploadsucceededeventhandler.md) | A handler invoked when the SDK successfully uploads a batch of events. |  
| [PFEventPipelineCloseHandle](functions/pfeventpipelineclosehandle.md) | Closes a PFEventPipelineHandle. |  
| [PFEventPipelineCreatePlayStreamPipelineHandle](functions/pfeventpipelinecreateplaystreampipelinehandle.md) | Creates an event pipeline to upload PlayStream events using an Entity. |  
| [PFEventPipelineCreateTelemetryPipelineHandleWithEntity](functions/pfeventpipelinecreatetelemetrypipelinehandlewithentity.md) | Creates an event pipeline to upload Telemetry events using an Entity. |  
| [PFEventPipelineCreateTelemetryPipelineHandleWithKey](functions/pfeventpipelinecreatetelemetrypipelinehandlewithkey.md) | Creates an event pipeline to upload Telemetry events using a Telemetry Key. |  
| [PFEventPipelineDuplicateHandle](functions/pfeventpipelineduplicatehandle.md) | Duplicates a PFEventPipelineHandle. |  
| [PFEventPipelineEmitEvent](functions/pfeventpipelineemitevent.md) | Adds a event to a pipelines buffer to be uploaded. The API will return synchronously and the event will be uploaded in the background based on the pipeline configuration. |  
| [PFEventPipelineRemoveUploadingEntity](functions/pfeventpipelineremoveuploadingentity.md) | Remove an entity from an existing pipeline. If a valid Telemetry Key Configuration was added at pipeline creation it will switch to it. |  
| [PFEventPipelineUpdateConfiguration](functions/pfeventpipelineupdateconfiguration.md) | Update an existing pipeline configuration. |  
  
## Structures  

| Structure | Description |  
| --- | --- |  
| [PFEvent](structs/pfevent.md) | Event to be uploaded to PlayFab. |  
| [PFEventPipelineConfig](structs/pfeventpipelineconfig.md) | Defines the Event Pipeline configuration. |  
| [PFEventPipelineTelemetryKeyConfig](structs/pfeventpipelinetelemetrykeyconfig.md) | Configuration struct that defines the properties required for using Telemetry Key. |  
| [PFUploadedEvent](structs/pfuploadedevent.md) | Event that has been uploaded to PlayFab. Associates the service assigned ID with the clientId provided when the event was emitted. |  
