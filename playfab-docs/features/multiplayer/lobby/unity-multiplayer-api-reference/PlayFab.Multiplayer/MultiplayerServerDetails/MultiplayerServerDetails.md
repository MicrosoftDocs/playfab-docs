---
author: nassosterz-ms
title: MultiplayerServerDetails
description: MultiplayerServerDetails constructor
ms.author: aterzakis
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/18/2022
---

# MultiplayerServerDetails constructor

Details about a Playfab Multiplayer Server.

```csharp
public MultiplayerServerDetails(string fqdn, string ipv4Address, IList<MultiplayerPort> ports, 
    string region)
```

| parameter | description |
| --- | --- |
| fqdn | The fully qualified domain name of the virtual machine that is hosting this multiplayer server. |
| ipv4Address | The IPv4 address of the virtual machine that is hosting this multiplayer server. |
| ports | The ports the multiplayer server uses. |
| region | The server's region. |

## See Also

* class [MultiplayerPort](../MultiplayerPort.md)
* class [MultiplayerServerDetails](../MultiplayerServerDetails.md)
* namespace [PlayFab.Multiplayer](../../PlayFabMultiplayerSDK.md)

