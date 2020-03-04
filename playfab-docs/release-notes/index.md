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

## 200303

### API Changes

* server.UnlinkXboxAccountRequest no longer requires the XboxToken to be unlinked
* The Experimentation feature and API have been relased
    * See our [Blog Post](https://api.playfab.com/blog/announcing-playfabs-experimentation-all-new-for-trustworthy-experiments) for more details
* New Methods
    * client.LoginWithApple
    * client.LinkApple
    * client.UnlinkApple

## 200220

Date: 2020-02-20

### [Cpp Gsdk](https://github.com/PlayFab/gsdk)- Breaking change
- Due to thread safety concerns, the signatures of the following methods were modified:


    |Method name| Old return type | New return type|
    |-----|--------|-----|
    |`GSDK::getConfigSettings()`| `const std::unordered_map <std::string, std::string>&` | `const std::unordered_map <std::string, std::string>`|
    |`GSDK::getLogsDirectory()`|`const std::string&`|`const std::string`|
    |`GSDK::getSharedContentDirectory()`|`const std::string& `|`const std::string`|

    Please see our [Upgrade guide](https://github.com/PlayFab/gsdk/blob/master/200220Upgrade.md) 

## 200218

### API & Documentation Changes:

* New api methods:
    * admin.CreateInsightsScheduledScalingTask
    * multiplayer.GetMultiplayerSessionLogsBySessionId
* New feature and methods:
    * A new mechanism for Cloud Script: Azure functions, can now be used in PlayFab
    * [Feature Documentation](https://docs.microsoft.com/gaming/playfab/features/automation/cloudscript-af/)
    * List of New Methods:
       * cloudscript.ExecuteFunction
       * cloudscript.ListFunctions
       * cloudscript.ListHttpFunctions
       * cloudscript.ListQueuedFunctions
       * cloudscript.PostFunctionResultForEntityTriggeredAction
       * cloudscript.PostFunctionResultForFunctionExecution
       * cloudscript.PostFunctionResultForScheduledTask
       * cloudscript.RegisterHttpFunction
       * cloudscript.RegisterQueuedFunction
       * cloudscript.UnregisterFunction
* Api method changes:
    * Region request parameter is no longer required for multiplayer.GetMultiplayerServerLogs

### [CSharpSdk](https://github.com/PlayFab/CSharpSDK) specific changes:

* Overhaul and improve the QoS ping calculation for PlayFab Multiplayer

## 200213

PlayFab’s Multiplayer Servers introduces an auto scaling enhancement named Dynamic Standby that monitors standby server threshold levels and dynamically activates increased provisioning of game servers so that demand can be met at scale.  This feature feature adds a new object to the Multiplayer programming interface called “DynamicStandby” object. The Dynamic Standby object is an optional property of the [BuildRegionParams](https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/updatebuildregions?view=playfab-rest#buildregionparams) object.

Dynamic Standby is an advanced game server feature and editing the settings from its default values should be done with caution. Configuring Dynamic Standby can be accomplished in the Game Manager Developers' portal or programmatically editing properties of the Dynamic Standby object. To learn more about Dynamic Standby, visit its user guide in the [PlayFab Multiplayer Servers](../features/multiplayer/servers/dynamic-standby.md) online documentation.

## 200128

### Multiplayer Server Event Changes:

We are introducing a change to the Multiplayer Server event naming convention in efforts to unify our event names with that of the rest of PlayFab event names.  Additionally, we are making these changes in advance of the Multiplayer Server feature becoming Public Preview.  The changes are:

* Multiplayer Server event names will be updated to use PascalCasing
* Multiplayer Server events will no longer be sent in the legacy v1 PlayStream event format; only v2 PlayStream event format will be supported

 These two changes represent breaking changes, particularly for developers who take a dependency on non-right casing of names or PlayStream v1 of Multiplayer Server events.  These changes are not breaking for developers who leverage event names in the Game Manager UI (cloud script, insights, rules, or scheduled tasks).  This change will take effect Wednesday February 26, 2020 at 10:00 AM PST.  Please adjust your code for these changes before the change date.

**Format Changes**

Generally, PlayFab Events have the format similar to:

```
{
   'Event Name':'my_event'
   'Payload':
   {
      'prop1':1
      'prop2':2
      'camelcase':3
      }
}
```

The fundamental format change are that properties in the events Payload object will be updated to use PascalCasing for consistency with other PlayStream events.  Therefore, the new property names will meet the following format:

```
{
   'Event Name':'my_event'
   'Payload':
   {
      'Prop1':1
      'Prop2':2
      'CamelCase':3
      }
}
```

Observe that the property names of Multiplayer server events are now updated to use PascalCasing.

This change will impact customers who process Multiplayer server events in (a) Kusto queries or (b) PlayFab cloud scripts.  Lastly, if a customer leverages the PlayFab Event Archive feature (currently in public preview), the properties of Multiplayer server events exported will also be formatted in PascalCasing.

**Schema Changes**

The second change introduced are that Multiplayer server events will only be delivered in PlayStream v2 format and no longer the legacy PlayStream v1 format.

PlayFab currently supports two event schemas.  

|Schema Format|Description|Multiplayer Events Namespace Value|
|-------------|-----------|----------------------------------|
|PlayStream V1|Designed around player events|com.playfab.events.multiplayer|
|PlayStream V2|Designed around entity events|playfab.servers|

Generally, PlayFab API’s generate events in either PlayStream V1 format or PlayStream V2 format.  For example, APIs that grant player items generated a PlayStream V1 event.  Whereas APIs that grant entity items generated a PlayStream V2 event.  

Because the Multiplayer Servers launched in public preview at or near the same time PlayStream V2 was introduced, the Multiplayer Server feature supported both PlayStream V1 and V2 formats.  Meaning, every Multiplayer Server API call generated two events; one in V1 and V2 format.  

To remove duplication, Multiplayer server events in the 'com.playfab.events.multiplayer.servers' namespace are being deprecated.  Events in the 'playfab.servers' namespace will be continue to be supported.

To distinguish between Multiplayer Server events of V1 and V2 format, examine the namespace property of the event.  The namespace is specified in the 3rd column of the table above.  The JSON representation resembles the following:

```
{
   'FullName':
   {
      'Namespace':'abc',
      'Name':'xyz'
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
