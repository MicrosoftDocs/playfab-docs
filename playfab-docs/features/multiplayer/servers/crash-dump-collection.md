---
title: Automatic crash dump collection
author: raakisad
description: Enabling automatic crash dump collection
ms.author: raakisad
ms.date: 08/18/2021
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer servers, crash dump collection, automatic crash dump, archived servers, logs, debugging, game manager 
ms.localizationpriority: medium
---

# Enable automatic crash dump collection 
This article will cover how to enable automatic crash dump collection for servers.

> [!Note]
> This functionality is only available for windows container servers. We do not currently have a way for linux or Windows process based servers.

To enable automatic crash dump collection, you can use CreateBuildWithManagedContainer api as shown below. To learn more about the CreateBuildwithManagedContainer see [Multiplayer Server - CreateBuild With Managed Container](/rest/api/playfab/multiplayer/multiplayer-server/create-build-with-managed-container) In the JSON, you can add in a new field called "WindowsCrashDumpConfiguration" to the request body that will enable crash dumps. 


```Json
    "BuildName": "crashDumpTest",
    "ContainerFlavor": "ManagedWindowsServerCore",
    "MultiplayerServerCountPerVm": 1,
    "Ports": [
        {
            "Name": "PortName",
            "Num": 1243,
            "Protocol": "TCP"
        }
    ],
    "RegionConfigurations": [
        {
            "Region": "EastUs",
            "MaxServers": 1,
            "StandbyServers": 1
        }
    ],
    "StartMultiplayerServerCommand": "C:\\Assets\\CrashingServerExample.exe sizeMiB:10",
    "UseStreamingForAssetDownloads": false,
    "GameAssetReferences": [
        {
            "FileName": "CrashingServerExample_v1_0.zip",
            "MountPath": "C:\\Assets"
        }
    ],
    "VmSize": "Standard_D2_v2",
    "WindowsCrashDumpConfiguration": {
        "IsEnabled": true,
        "DumpType": 0,
        "CustomDumpFlags": 6693
    }
}
```
> [!Note]
> Once you enable this your DumpType and CustomDumpFlag values will get put into the registry keys. To learn more read [Collecting User mode dumps](/windows/win32/wer/collecting-user-mode-dumps)


Once a server has crashed and logs have been created a PlayStream notification will give you a server ID. After you get the server ID, you can search for it under the archived servers page. Navigate to the Archived servers page and paste into the search bar the server ID you were given. Download the logs for the affected server and you'll see your crash dump files. To learn more, read [Archiving and retrieving multiplayer server logs](archiving-and-retrieving-multiplayer-server-logs.md)
