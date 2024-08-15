---
author: jasonsandlin
title: "Services C API overview - PFEvents.h"
description: "Services C API overview - PFEvents.h"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# Services C API overview - PFEvents.h

  
## Functions  

| Function | Description |  
| --- | --- |  
| [PFEventsWriteEventsAsync](functions/pfeventswriteeventsasync.md) | Write batches of entity based events to PlayStream. The namespace of the Event must be 'custom' or start with 'custom.'. |  
| [PFEventsWriteEventsGetResult](functions/pfeventswriteeventsgetresult.md) | Gets the result of a successful PFEventsWriteEventsAsync call. |  
| [PFEventsWriteEventsGetResultSize](functions/pfeventswriteeventsgetresultsize.md) | Get the size in bytes needed to store the result of a WriteEvents call. |  
| [PFEventsWriteTelemetryEventsAsync](functions/pfeventswritetelemetryeventsasync.md) | Write batches of entity based events to as Telemetry events (bypass PlayStream). The namespace must be 'custom' or start with 'custom.' |  
| [PFEventsWriteTelemetryEventsGetResult](functions/pfeventswritetelemetryeventsgetresult.md) | Gets the result of a successful PFEventsWriteTelemetryEventsAsync call. |  
| [PFEventsWriteTelemetryEventsGetResultSize](functions/pfeventswritetelemetryeventsgetresultsize.md) | Get the size in bytes needed to store the result of a WriteTelemetryEvents call. |  
