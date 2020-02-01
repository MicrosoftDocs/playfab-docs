---
title: PlayFab Release Notes 2020
author: v-thopra
description: PlayFab Release Notes for 2020.
ms.author: v-thopra
ms.date: 01/01/2020
ms.topic: article
ms.prod: playfab
keywords: playfab, development, release, apis, features
ms.localizationpriority: medium
---

# PlayFab Release Notes 2020

## 200128

### Multiplayer Server Event Changes:

We are introducing a change to the Multiplayer Server event naming convention in efforts to unify our event names with that of the rest of PlayFab event names.  Additionally, we are making these changes in advance of the Multiplayer Server feature becoming Public Preview.  The changes are:

* Multiplayer Server event names will be right casing
* Multiplayer Server events will no longer be sent in the legacy v1 PlayStream event format; only v2 PlayStream event format will be supported

 These two changes represent breaking changes, particularly for developers who take a dependency on non-right casing of names or PlayStream v1 of Multiplayer Server events.  These changes are not breaking for developers who leverage event names in the Game Manager UI (cloud script, insights, rules, or scheduled tasks).  This change will take effect Wednesday February 26, 2020 at 10:00 AM PST.  Please adjust your code for these changes before the change date.

**Format Changes**

Generally, PlayFab Events have the format similar to:

```
{
   “Event Name”:”my_event”
   “Payload”:
   {
      “prop1”:1
      “prop2”:2
      “camelcase”:3
      }
}
```

The fundamental format change  are that properties in the events Payload object will always support right casing.  Therefore, the new property names will meet the following format:

```
{
   “Event Name”:”my_event”
   “Payload”:
   {
      “Prop1”:1
      “Prop2”:2
      “CamelCase”:3
      }
}
```

Observe that the property names of Multiplayer server events are now right cased.

This change will impact customers who process Multiplayer server events in (a) Kusto queries or (b) PlayFab cloud scripts.  Lastly, if a customer leverages the PlayFab Event Archive feature (currently in public preview), the properties of Multiplayer server events exported will also be right cased.

**Schema Changes**

The second change introduced are that Multiplayer server events will only be delivered in PlayStream v2 format and no longer the legacy PlayStream v1 format.

PlayFab currently supports two event schemas.  

|Schema Format|Description|Multiplayer Events Namespace Value|
|-------------|-----------|----------------------------------|
|PlayStream V1|Designed around player events|com.playfab.events.multiplayer|
|PlayStream V2|Designed around entity events|playfab.servers|

Generally, PlayFab API’s generate events in either PlayStream V1 format or PlayStream V2 format.  For example, APIs that grant player items generated a PlayStream V1 event.  Whereas APIs that grant entity items generated a PlayStream V2 event.

Because the Multiplayer Servers launched in public preview at or near the same time PlayStream V2 was introduced, the Multiplayer Server feature supported both PlayStream V1 and V2 formats.  Meaning, every Multiplayer Server API call generated two events; one in V1 and V2 format.  

To distinguish between Multiplayer Server events of V1 and V2 format, examine the namespace property of the event.  The namespace is specified in the 3rd column of the table above.  The JSON representation resembles the following:

```
{
   “FullName”:
   {
      “Namespace”:”abc”,
      “Name”:”xyz”
   }
}
```

The property to search for is named `Namespace`.


## 200121

### API & Documentation Changes:

* PlayFab API Documentation site has been fully migrated to https://docs.microsoft.com/gaming/playfab/
    * Most api.playfab.com links have been converted to their equivalent docs.microsoft.com links
    * Most original links redirect to the new site properly
    * Let us know in the [forums](https://community.playfab.com/index.html) if any old links don't work
* New api methods:
    * multiplayer.ListServerBackfillTicketsForPlayer
    * multiplayer.GetServerBackfillTicket
    * multiplayer.CreateServerBackfillTicket
    * multiplayer.CancelServerBackfillTicket
    * multiplayer.CancelAllServerBackfillTicketsForPlayer
    * server.UnlinkPSNAccount
    * server.LinkPSNAccount

### [LuaSdk](https://github.com/PlayFab/LuaSdk) specific changes:

* Minor login bugfix

### [PhpSdk](https://github.com/PlayFab/PhpSdk) specific changes:

* Minor syntax fix for strict correctness

### [UnitySDK](https://github.com/PlayFab/UnitySDK) specific changes:

* Update the GitHub repro and project structure.
    * Moving the Unity EdEx package from (UnityEditorExtensions)[https://github.com/PlayFab/UnityEditorExtensions] to (UnitySdk)[https://github.com/PlayFab/UnitySDK/blob/master/Packages/PlayFabEditorExtensions.unitypackage]
    * In the future, we will also be phasing out the separate UnityEditorExtensions repo
