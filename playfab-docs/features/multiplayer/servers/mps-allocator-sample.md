---
title: Quickstart for multiplayer servers (MpsAllocator Sample)
author: dgkanatsios
description: How you can use MpsAllocator Sample to view your Builds/Virtual Machine/Game Servers
ms.author: digkanat
ms.date: 04/01/2021
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer servers, thunderhead, game manager
ms.localizationpriority: medium
---

# MpsAllocator sample

> MpsAllocatorSample can be found [here](https://github.com/PlayFab/MpsSamples/tree/master/MpsAllocatorSample) along with the rest of the MPS samples.

This sample is a simple .NET Core application that allows you to easily call some frequently used MPS APIs, like the ones that list VMs/servers and allocate game servers (RequestMultiplayerServer). To easily and quickly request a multiplayer server from Game Manager, select the button located at the top of our servers page that can help you do that. To learn more check out our [Servers overview](build-server-overview.md). In order to use it, you need to have installed .NET Core 3.1 (download [here](https://dotnet.microsoft.com/download)). You can then use either `dotnet build` command to build an executable for your platform or just run `dotnet run` to run the application.

> You can find more information about `dotnet build` command [here](/dotnet/core/tools/dotnet-build)

In order to authenticate with PlayFab APIs, the app needs your PlayFab TitleID and a developer secret key. To create a secret key for your title, visit the Settings/Secret-Keys page on the PlayFab developer portal here: https://developer.playfab.com/en-US/r/t/<Your_TitleID>/settings/secret-keys. You can provide these keys via environment variables `PF_TITLEID` and `PF_SECRET`, or as command line arguments.

> The app uses the PlayFab SDK via the corresponding [Nuget package](https://www.nuget.org/packages/PlayFabAllSDK/)

Once you run the application, you can choose which API to call. Each API will ask you to provide necessary parameters. Here's the list of the available options:

- [RequestMultiplayerServer](/rest/api/playfab/multiplayer/multiplayer-server/request-multiplayer-server): This option will allocate a game server and return its details (IP, FQDN, Port). Successful invocation of this API call will result in a game server's transition from "StandingBy" state to "Active" (more [here](allocating-game-servers-and-configuring-vs-debugging-tools.md))
- [ListBuildSummaries](/rest/api/playfab/multiplayer/multiplayer-server/list-build-summaries-v2): This option will return summaries about your title's Builds
- [GetBuild](/rest/api/playfab/multiplayer/multiplayer-server/get-build): This option will return details about the specified Build
- [ListMultiplayerServers](/rest/api/playfab/multiplayer/multiplayer-server/list-multiplayer-servers): This option will return summaries about game servers in a specified Build
- [ListVirtualMachineSummaries](/rest/api/playfab/multiplayer/multiplayer-server/list-virtual-machine-summaries): This option will return summaries about virtual machines in a specified Build
- [GetMultiplayerServerDetails](/rest/api/playfab/multiplayer/multiplayer-server/get-multiplayer-server-details): This option will return details about a specified game server

## See also

* [Create your first server](create-your-first-server.md)
* [Resources and samples](server-samples-resources.md)
* [PlayFab Multiplayer Server SDKs](server-sdks.md)
* [API Reference](xref:titleid.playfabapi.com.multiplayer.multiplayerserver)
