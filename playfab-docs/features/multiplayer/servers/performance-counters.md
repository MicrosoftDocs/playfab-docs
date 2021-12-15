---
title: Collecting performance metrics on Windows multiplayer servers.
author: chpalm
description: Collecting performance metrics on Windows multiplayer servers.
ms.author: chpalm
ms.date: 01/18/2019
ms.topic: article
ms.prod: playfab
keywords: playfab. multiplayer, servers
ms.localizationpriority: medium
---
# Collecting performance metrics on Windows multiplayer servers (experimental)
Performance metrics can support a variety of development scenarios:

1. Using CPU and memory utilization data to measure the resource needs of multiplayer servers
2. Using network counters to detect an irregular network environment, such as attempted DDoS attacks or other network congestion

As an experimental feature PlayFab can monitor these Windows performance counters and write them to the virtual machine's filesystem. The multiplayer server application can upload this content to a game system or locally copy these to the [archived session directory](archiving-and-retrieving-multiplayer-server-logs.md) for later access via blob storage.

Collecting these performance metrics has itself a performance impact on the virtual machine, in particular increasing the CPU utilization of the collector, `VMAgent.` This is why performance collection is not enabled by default and requires explicit activation.

This feature is currently labeled *experimental* as we are significantly iterating on the experience and asking customers for feedback.

###	Activate collection of performance metrics

Performance monitoring is activated through the  `CreateBuildWithManagedContainer` API, and by specifying the `InstrumentationConfiguration` parameter with a list of processes to monitor on the machine. We recommend providing the name of your game server processes. Adding at least one process will enable performance metrics collection on all VMs that are created for this build.

Performance metrics will be collected at the machine level and process level for processes specified via `InstrumentationConfiguration.`  In addition to the developer-provided list, PlayFab will include the following  list of critical processes:

-  `VmAgent`
- `MsMpEng`
- `dockerd`
- `absrv`

Below is an example build configuration payload with performance monitoring enabled:
```
{
    "BuildName": "test",
    "ContainerFlavor": "ManagedWindowsServerCore",
    "GameAssetReferences": [
        {
            "FileName": "windowsSample.zip",
            "MountPath": "C:\\Assets\\"
        }
    ],
    "MultiplayerServerCountPerVm": 1,
    "Ports": [
        {
            "Name": "game_port",
            "Protocol": "TCP",
            "Num": 3600
        }
    ],
    "RegionConfigurations": [
        {
            "MaxServers": 1,
            "StandbyServers": 1,
            "Region": "WestUs"
        }
    ],
    "StartMultiplayerServerCommand": "C:\\Assets\\WindowsRunnerCSharp.exe",
    "VmSize": "Standard_D1_v2",
    "InstrumentationConfiguration": {
        "ProcessesToMonitor": [ "WindowsRunnerCSharp" ]
    }
}
```
### Access logs on the virtual machine
After the build creation has been created and has standing by servers, you can find the csv files that contain the performance metrics collection output in the shared content folder on each VM.

To manually view this file, you can log on to a VM and navigate to the `PerformanceMetricsLogs` folder under the location stored in the `PF_SHARED_CONTENT_FOLDER` environment variable (typically `D:\GameSharedContent\PerformanceMetricsLogs`). Here you will find a collection of csv files (`PerformanceMetrics-XXXXX.csv`) containing the following column data:

-	Timestamp: the time the line was written to the to the file
-	Counter Name: the name of the counter that was read
-	Process Name: the name of process or “Machine” if the counter was read at the machine level
-	Instance: If there is more than one instance of a counter, for example multiple processors, they will be uniquely numbered

### Collected performance counters

 - MemoryAvailable
 - MemoryUsed
 - CpuPercentProcessorTimePerProcessor
 - CpuPercentUserTimePerProcessor
 - DiskReadOperationsPerSecond
 - DiskReadBytesPerSecond
 - DiskWriteOperationsPerSecond
 - DiskWriteBytesPerSecond
 - IPv4DatagramsReceivedPerSecond
 - IPv4DatagramsSentPerSecond
 - IPv6DatagramsReceivedPerSecond
 - IPv6DatagramsSentPerSecond
 - NetworkInterfaceBytesReceivedPerSecond
 - NetworkInterfaceBytesSentPerSecond
 - NetworkInterfacePacketsReceivedPerSecond
 - NetworkInterfacePacketsSentPerSecond
 - NetworkInterfaceOutputQueueLength
 - NetworkAdapterBytesReceivedPerSecond
 - NetworkAdapterBytesSentPerSecond
 - NetworkAdapterPacketsReceivedPerSecond
 - NetworkAdapterPacketsSentPerSecond
 - NetworkAdapterOutputQueueLength
 - InterruptsPerSecondPerProcessor
 - DPCsQueuedPerSecondPerProcessor
