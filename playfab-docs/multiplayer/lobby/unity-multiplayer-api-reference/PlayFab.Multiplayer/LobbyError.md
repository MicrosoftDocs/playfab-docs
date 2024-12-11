---
author: vicodex
title: LobbyError class
description: LobbyError members
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# Class LobbyError

Helper class for the error code of operations.

```csharp
public class LobbyError
```

## Public Members

| name | description |
| --- | --- |
| [LobbyError](LobbyError/LobbyError.md)() | The default constructor. |
| const [InvalidArg](LobbyError/InvalidArg.md) | Indicates that the operation failed due to an invalid argument. |
| const [Success](LobbyError/Success.md) | Indicates that the operation succeeded. |
| static [FAILED](LobbyError/FAILED.md)(…) | Generic test for failure on any status value. |
| static [SUCCEEDED](LobbyError/SUCCEEDED.md)(…) | Generic test for success on any status value (non-negative numbers indicate success). |

## See Also

* namespace [PlayFab.Multiplayer](../PlayFabMultiplayerSDK.md)

