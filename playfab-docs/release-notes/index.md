---
title: PlayFab Release Notes 2020
author: sebgrink
description: PlayFab Release Notes for 2020.
ms.author: sebgrink
ms.date: 01/01/2020
ms.topic: article
ms.prod: playfab
keywords: playfab, development, release, apis, features
ms.localizationpriority: medium
---
# PlayFab Release Notes 2020

## 200330

Date: 2020-03-30

### API Changes

 * [Authentication](https://docs.microsoft.com/en-us/gaming/playfab/#pivot=documentation&panel=authentication):
    * Added new [LoginIdentityProviders](https://docs.microsoft.com/en-us/gaming/playfab/api-references/events/data-types/loginidentityprovider) for Apple and Nintendo
 * [Multiplayer Server](https://docs.microsoft.com/en-us/gaming/playfab/#pivot=documentation&panel=multiplayer):
    * Added new BuildRegion management functions [DeleteBuildRegion](https://docs.microsoft.com/en-us/rest/api/playfab/multiplayer/multiplayerserver/deletebuildregion?view=playfab-rest) and [UpdateBuildRegion](https://docs.microsoft.com/en-us/rest/api/playfab/multiplayer/multiplayerserver/updatebuildregion?view=playfab-rest)
 * [UnrealMarketplacePlugin](https://github.com/PlayFab/UnrealMarketplacePlugin):
    * Added new [Mac build helper scripts](https://github.com/PlayFab/UnrealMarketplacePlugin/blob/master/4.24/ExampleProject/BuildMac.sh)
    
### [Plat SDK](https://github.com/PlayFab/XPlatCppSdk) specific changes
    * Fixed some threading issues for the PlayFabEventPipeline
### [UnrealMarketPlacePlugin](https://github.com/PlayFab/UnrealMarketplacePlugin) specific changes
    * Security bug fixes

## 200325

Date: 2020-03-25

### Improvements

* Multiplayer Servers:
    * A new section on [Formatting the game start command](https://docs.microsoft.com/gaming/playfab/features/multiplayer/servers/quickstart-for-multiplayer-servers-api-powershell) was added to the documentation.
    * A title's core server quota for a region is now based on actual consumption across a sum of activated servers for the region.

### Bug Fixes

* Authentication:
    * Previously when not passing an encryption key into the [Login with Xbox API](https://docs.microsoft.com/rest/api/playfab/client/authentication/loginwithxbox?view=playfab-rest) a generic error code was returned. Now the `EncryptionKeyMissing` error code is returned.
    * Previously when the player secret was already configured the [Login with GameCenter API](https://docs.microsoft.com/rest/api/playfab/client/authentication/loginwithgamecenter?view=playfab-rest) returned a generic error code. Now the `PlayerSecretAlreadyConfigured` error code is returned.
* Automation - Previously if you were bulk deleting PlayStream rules or Player Segments occasionally rules or segments would not be completely deleted. Now they will.
* Config - Previously when you uploaded a custom image for your title in Game Manager and then added a new user the Game Title icon would not load. Now it loads as expected.
* Social - Previously when pressing the delete button on the delete blocks dialog in the Groups feature the dialog would not go away. Now it will.

## 200318

Date: 2020-03-18

### Improvements

#### Multiplayer
* Multiplayer Servers - A C# Sample is now available on GitHub: [WindowsRunnerCSharp](https://github.com/PlayFab/gsdkSamples/tree/master/WindowsRunnerCSharp). For more details about the code in the sample, see the "Using the quality-of-service SDK" section in [Using Quality-of-Service (QoS) beacons to measure player latency to Azure](https://docs.microsoft.com/gaming/playfab/features/multiplayer/servers/using-qos-beacons-to-measure-player-latency-to-azure).

### Bug Fixes

* Authentication - Previously the UnlinkXboxAccount API required the XBL Token, now the UnlinkXboxAccount API does not require the XBL Token.
* Data - Previously the SharedGroupDataUpdateRequestSize limit was less than SharedGroupDataIndividualValueSize limit, now they have the same limit of 300,000 bytes.
* Economy (Private Preview):
    * Multiple currency modifications in quick succession no longer have the possibility of losing data.
    * Item references returned as part of the response for a Create/UpdateStore call now include the PayoutAmount.

## 200310

Date: 2020-03-10

### New
* Experiments - We launched the public preview of PlayFab Experiments. Read more on the [blog](https://blog.playfab.com/blog/announcing-playfabs-experimentation-all-new-for-trustworthy-experiments) and visit the [documentation](../features/analytics/experiments/index.md) site to learn more and get started!
* Data - PlayStream v2 events are now supported in the Game Manager Event History.
* Groups - We have added PlayStream v2 events for `MembersAdded`, `MembersRemoves`, `MembersRoleUpdated`, `EntityCreated`, and `EntityDeleted`.
* Multiplayer Servers - UX in game manager for setting the dynamic standing by configuration.

### Improvements
* Authentication - Updated [documentation](../features/authentication/platform-specific-authentication/apple-open-id.md) for how to use apple with PlayFab's OpenID integration.
* Multiplayer Servers - Dynamic Standby included in the build usage chart.
* Multiplayer Servers - A documentation update has been published to the QoS SDK to limit the number of concurrent requests for more reliable results and create a sample to show usage of that API in C#. The update is referenced in the [PlayFab Multiplayer Servers](../features/multiplayer/servers/using-qos-beacons-to-measure-player-latency-to-azure.md) online documentation. A sample of the C# QoS SDK is published in [Github](https://github.com/PlayFab/gsdkSamples/tree/master/WindowsRunnerCSharp).
* PlayStream - Contact email events now send PlayStream events in the v2 event schema.
* Social - Group events are now sent using the PlayStream v2 schema.
* Economy (Private Preview) - Optimizations have been made to the redemption service to alleviate memory pressure and increase reliability.

### Bug Fixes
* Administration - When a policy change is made by a user, it will properly populate to the Audit History page in Game Manager.
* Authentication - For some valid tokens for an OpenID token the API would return a 403. This bugs fix these instances and all valid token should return success.
* Authentication - Previously when calling `LoginWithCustomID` with a missing encryption key a generic error code was returned. Now the `EncryptionKeyMissing` error code will be returned.
* Automation - Scheduled tasks that run a cloud script once show as failed when the cloud script results in an error.
* Automation - Previously if you called `CreateActionsOnPlayersInSegmentTask` the Task's actions could disappear. This has now be fixed where the task actions will never disappear without the user deleting or updating them.
* Automation - Previously when a Cloudscript http request failed and is requested from the client APIs, the payload for the API would return the whole request, including any headers or payload information, now these requests will only be logged if the `logRequest` parameter is true.
* Config - Previously email notifications were not being sent when the `UserDataIndividualValueSize` limit is hit. Now an email will be sent when there are multiple players exceeding this limit in a two hour window.
* Game Manager - After linearizing the page within the PlayStream Monitor options, all links and buttons are properly accessible on the Title Overview page.
* Game Manager - Previously there was a bug preventing the user from updating their contact email. This is now fixed.
* Multiplayer Servers - Added detailed steps to “Overriding the UE4” methods section. Read more [here](../features/multiplayer/servers/playfabgsdk_guide.md).
* Multiplayer Servers - Previously Game Manger overwrote dynamic floor settings when updated through the API. Now Game Manager will not overwrite the dynamic floor settings.
* Multiplayer Servers - Renamed the "Stand By Cores Efficiency" chart to the more appropriately named "Stand By Cores Overhead" chart.
* PlayStream - The PlayStream v2 event name limit was 40 characters. It has been updated to 64 characters to match the limit of the `WriteEvents` API.
* Economy (Private Preview) - Stores no longer require Content Type.
* Economy (Private Preview) - Currencies can now be created in Game Manager.
* Economy (Private Preview) - Error mapping code has been updated so 422's and 404's are no longer incorrectly categorized as `EconomyServiceInternalError`.
* Economy (Private Preview) - Additional validation checks for responses sent back from asset account service.
* Economy (Private Preview) - `GetItemReviewSummary` now properly returns the average rating.
* Economy (Private Preview) - Item metadata `EndDate` is now properly converted to UTC.

## 200303

Date: 2020-03-03

### API Changes:

* server.UnlinkXboxAccountRequest no longer requires the XboxToken to be unlinked
* The Experiments feature and API have been released
    * See our [Blog Post](https://api.playfab.com/blog/announcing-playfabs-experimentation-all-new-for-trustworthy-experiments) for more details
* New Methods
    * client.LoginWithApple
    * client.LinkApple
    * client.UnlinkApple

## 200220

Date: 2020-02-20

### New
* Automation - We released a new [Visual Studio Code extension for PlayFab](https://marketplace.visualstudio.com/items?itemName=PlayFab.playfab-explorer). You can find the source code in [Github](https://github.com/PlayFab/vscode-playfab-explorer).

### [Cpp Gsdk](https://github.com/PlayFab/gsdk)- Breaking change
- Due to thread safety concerns, the signatures of the following methods were modified:


    |Method name| Old return type | New return type|
    |-----|--------|-----|
    |`GSDK::getConfigSettings()`| `const std::unordered_map <std::string, std::string>&` | `const std::unordered_map <std::string, std::string>`|
    |`GSDK::getLogsDirectory()`|`const std::string&`|`const std::string`|
    |`GSDK::getSharedContentDirectory()`|`const std::string& `|`const std::string`|

    Please see our [Upgrade guide](https://github.com/PlayFab/gsdk/blob/master/200220Upgrade.md) 

## 200218

Date: 2020-02-18

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

Date: 2020-02-13

PlayFab's Multiplayer Servers introduces an auto scaling enhancement named Dynamic Standby that monitors standby server threshold levels and dynamically activates increased provisioning of game servers so that demand can be met at scale.  This feature feature adds a new object to the Multiplayer programming interface called "DynamicStandby" object. The Dynamic Standby object is an optional property of the [BuildRegionParams](https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/updatebuildregions?view=playfab-rest#buildregionparams) object.

Dynamic Standby is an advanced game server feature and editing the settings from its default values should be done with caution. Configuring Dynamic Standby can be accomplished in the Game Manager Developers' portal or programmatically editing properties of the Dynamic Standby object. To learn more about Dynamic Standby, visit its user guide in the [PlayFab Multiplayer Servers](../features/multiplayer/servers/dynamic-standby.md) online documentation.

## 200128

Date: 2020-01-28

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

Generally, PlayFab API's generate events in either PlayStream V1 format or PlayStream V2 format.  For example, APIs that grant player items generated a PlayStream V1 event.  Whereas APIs that grant entity items generated a PlayStream V2 event.  

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

Date: 2020-01-21

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
