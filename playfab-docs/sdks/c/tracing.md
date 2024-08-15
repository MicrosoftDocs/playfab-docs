---
title: Debug Tracing
author: amccalib
description: Debug Tracing in the PlayFab Services SDK
ms.author: andmcc
ms.date: 02/24/2023
ms.topic: article
ms.service: azure-playfab
keywords: playfab, c++, windows, xbox, gdk, debug
ms.localizationpriority: medium
---

# Debug Tracing

This PlayFab SDK supports extensible debug tracing. Use debug tracing when you're encountering errors and want a full picture of what calls the game makes and the results the server returns. There are options to control the trace verbosity and integrate with your game's own debug logs. You can also direct output to the Output pane in Visual Studio.

## Enable and set Verbosity

The following code example enables debug tracing and sets the debug error level to **Verbose**. You can also set the debug error level to **Error** to show only trace failed calls; or to **Off** to disable tracing.)

The resulting debug output is sent to the Output pane when running your project in Visual Studio.

```cpp
PFHCSettingsSetTraceLevel(PFHCTraceLevel::Verbose);
PFHCTraceSetTraceToDebugger(true);
```

## Connect to Game logs

To connect PlayFab's trace debugging to your game's own debug logs, use **PFHCTraceSetClientCallback**. Provide a callback that can take PlayFab trace output and direct to game logs.

```cpp
void CALLBACK TraceCallback(
    _In_z_ char const* areaName,
    enum PFHCTraceLevel level,
    uint64_t threadId,
    uint64_t timestamp,
    _In_z_ char const* message
)
{
    // Log info
}

PFHCTraceSetClientCallback(TraceCallback);
```

## Reference

[API reference documentation](../../api-references/c/pfhctrace/pfhctrace_members.md)
