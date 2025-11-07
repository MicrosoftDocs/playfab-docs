---
title: Debug tracing in the PlayFab Unified SDK
author: amccalib  
description: Debug tracing in the PlayFab Unified SDK  
ms.author: jeffshi  
ms.date: 04/21/2025  
ms.topic: article  
ms.service: azure-playfab  
keywords: playfab, playfab unified sdk, sdk, c++, windows, xbox, gdk, debug  
ms.localizationpriority: medium  
---

# Debug tracing in the PlayFab Unified SDK

The PlayFab Unified SDK provides an extensible debug tracing system to help developers monitor internal API behavior, track errors, and integrate PlayFab logs into their game's logging infrastructure. Debug output can also be routed to the Visual Studio Output pane during development.

## Overview

Debug tracing is useful for:

- Monitoring PlayFab SDK requests and responses  
- Diagnosing API call failures  
- Integrating with custom logging systems  
- Adjusting log verbosity per environment (development vs. production)  
- Debugging multithreaded issues via thread ID tracking  

## Enabling and Configuring Tracing

You can enable tracing, set verbosity, and configure where output is sent using the following API calls:

```cpp
HCSettingsSetTraceLevel(HCTraceLevel::Verbose);  // Verbose, Error, or Off
HCTraceSetTraceToDebugger(true);                 // Route to Visual Studio Output window
HCTraceSetClientCallback(TraceCallback);         // Custom trace handler
```

## Trace Levels

| Level                        | Description                              |
|-----------------------------|------------------------------------------|
| `HCTraceLevel::Off`       | Disables all tracing                     |
| `HCTraceLevel::Error`     | Logs only failed API calls               |
| `HCTraceLevel::Verbose`   | Logs all requests, responses, metadata   |

## Integrating with Custom Logging Systems

### GameLog Helper Function

```cpp
#include <iostream>
#include <string>

void GameLog(const std::string& levelStr, const std::string& message)
{
    std::cout << "[" << levelStr << "] " << message << std::endl;
}
```

### Trace Callback Example

```cpp
#include <sstream>

void CALLBACK TraceCallback(
    const char* areaName,
    HCTraceLevel level,
    uint64_t threadId,
    uint64_t timestamp,
    const char* message)
{
    std::ostringstream oss;

    std::string levelStr;
    switch (level)
    {
        case HCTraceLevel::Error:   levelStr = "Error";   break;
        case HCTraceLevel::Verbose: levelStr = "Verbose"; break;
        default:                    levelStr = "Log";     break;
    }

    oss << "[" << areaName << "] [Thread " << threadId << "] " << message;
    GameLog(levelStr, oss.str());
}
```

### Initialization

```cpp
void InitializePlayFabTracing()
{
    HCSettingsSetTraceLevel(HCTraceLevel::Verbose);
    HCTraceSetTraceToDebugger(true);  // Set to false to suppress VS Output pane
    HCTraceSetClientCallback(TraceCallback);
}
```

## Best Practices

- **Verbose in development**: Enables comprehensive tracing for debugging and QA.  
- **Error or Off in production**: Reduces performance impact and log volume.  
- **Centralize logging**: Use a unified `GameLog` function or similar to aggregate logs from PlayFab and other systems.  
- **Debug multithreading**: Use the thread ID in logs to identify concurrency issues.  

## See also
- [Asynchronous operations](async-model.md)
- [Memory management](memory-management.md)
- [Tracing and diagnostics](debug-trace.md)