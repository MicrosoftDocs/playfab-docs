---
author: jasonsandlin
title: "Services C API overview - PFEvents.h"
description: "Services C API overview - PFEvents.h"
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 07/25/2023
---

# Services C API overview - PFEvents.h

  
## Functions  

| Function | Description |  
| --- | --- |  
| [PFEventsCreateTelemetryKeyAsync](functions/pfeventscreatetelemetrykeyasync.md) | Creates a new telemetry key for the title. |  
| [PFEventsCreateTelemetryKeyGetResult](functions/pfeventscreatetelemetrykeygetresult.md) | Gets the result of a successful PFEventsCreateTelemetryKeyAsync call. |  
| [PFEventsCreateTelemetryKeyGetResultSize](functions/pfeventscreatetelemetrykeygetresultsize.md) | Get the size in bytes needed to store the result of a CreateTelemetryKey call. |  
| [PFEventsDeleteTelemetryKeyAsync](functions/pfeventsdeletetelemetrykeyasync.md) | Deletes a telemetry key configured for the title. |  
| [PFEventsDeleteTelemetryKeyGetResult](functions/pfeventsdeletetelemetrykeygetresult.md) | Gets the result of a successful PFEventsDeleteTelemetryKeyAsync call. |  
| [PFEventsGetTelemetryKeyAsync](functions/pfeventsgettelemetrykeyasync.md) | Gets information about a telemetry key configured for the title. |  
| [PFEventsGetTelemetryKeyGetResult](functions/pfeventsgettelemetrykeygetresult.md) | Gets the result of a successful PFEventsGetTelemetryKeyAsync call. |  
| [PFEventsGetTelemetryKeyGetResultSize](functions/pfeventsgettelemetrykeygetresultsize.md) | Get the size in bytes needed to store the result of a GetTelemetryKey call. |  
| [PFEventsListTelemetryKeysAsync](functions/pfeventslisttelemetrykeysasync.md) | Lists all telemetry keys configured for the title. |  
| [PFEventsListTelemetryKeysGetResult](functions/pfeventslisttelemetrykeysgetresult.md) | Gets the result of a successful PFEventsListTelemetryKeysAsync call. |  
| [PFEventsListTelemetryKeysGetResultSize](functions/pfeventslisttelemetrykeysgetresultsize.md) | Get the size in bytes needed to store the result of a ListTelemetryKeys call. |  
| [PFEventsSetTelemetryKeyActiveAsync](functions/pfeventssettelemetrykeyactiveasync.md) | Sets a telemetry key to the active or deactivated state. |  
| [PFEventsSetTelemetryKeyActiveGetResult](functions/pfeventssettelemetrykeyactivegetresult.md) | Gets the result of a successful PFEventsSetTelemetryKeyActiveAsync call. |  
| [PFEventsSetTelemetryKeyActiveGetResultSize](functions/pfeventssettelemetrykeyactivegetresultsize.md) | Get the size in bytes needed to store the result of a SetTelemetryKeyActive call. |  
| [PFEventsWriteEventsAsync](functions/pfeventswriteeventsasync.md) | Write batches of entity based events to PlayStream. The namespace of the Event must be 'custom' or start with 'custom.'. |  
| [PFEventsWriteEventsGetResult](functions/pfeventswriteeventsgetresult.md) | Gets the result of a successful PFEventsWriteEventsAsync call. |  
| [PFEventsWriteEventsGetResultSize](functions/pfeventswriteeventsgetresultsize.md) | Get the size in bytes needed to store the result of a WriteEvents call. |  
| [PFEventsWriteTelemetryEventsAsync](functions/pfeventswritetelemetryeventsasync.md) | Write batches of entity based events to as Telemetry events (bypass PlayStream). The namespace must be 'custom' or start with 'custom.' |  
| [PFEventsWriteTelemetryEventsGetResult](functions/pfeventswritetelemetryeventsgetresult.md) | Gets the result of a successful PFEventsWriteTelemetryEventsAsync call. |  
| [PFEventsWriteTelemetryEventsGetResultSize](functions/pfeventswritetelemetryeventsgetresultsize.md) | Get the size in bytes needed to store the result of a WriteTelemetryEvents call. |  
