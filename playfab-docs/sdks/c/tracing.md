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
HCSettingsSetTraceLevel(HCTraceLevel::Verbose);
HCTraceSetTraceToDebugger(true);
```

## Connect to Game logs

To connect PlayFab's trace debugging to your game's own debug logs, use **HCTraceSetClientCallback**. Provide a callback that can take PlayFab trace output and direct to game logs.

```cpp
void CALLBACK TraceCallback(
    _In_z_ char const* areaName,
    enum HCTraceLevel level,
    uint64_t threadId,
    uint64_t timestamp,
    _In_z_ char const* message
)
{
    // Log info
}

HCTraceSetClientCallback(TraceCallback);
```

## Write traces to a file

To write PlayFab trace output to a log file on disk, call [**PFTraceEnableTraceToFile**](../../api-references/c/pftrace/functions/pftraceenabletracetofile.md) with the directory where the trace file should be created. Call this function after initialization.

```cpp
PFTraceEnableTraceToFile("C:\\GameLogs\\PlayFabTraces");
```

This function is independent of the HCTrace functions above. You can use file tracing alongside debugger output and client callbacks.

## Reference

[PlayFab API reference documentation](../../api-references/c/pftrace/pftrace_members.md)
[Trace API reference documentation](/gaming/gdk/docs/reference/live/httpclient/trace/trace_members)