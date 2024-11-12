---
title: PlayFab CloudScript using Azure Functions Context Models
author: williacj
description: This file details the different context variables that are available in PlayFab CloudScript using Azure Functions
ms.author: cjwill
ms.date: 02/23/2020
ms.topic: tutorial
ms.service: azure-playfab
keywords: playfab, automation, cloudscript, azure functions
ms.localizationpriority: medium
---

# Tutorial: Using CloudScript context models
PlayFab executes scripts through several mechanisms including execution through APIs, through scheduled tasks, through PlayStream events, and when a player enters and exits segments. In many cases, the context in which the script executes is important to how it runs. An example of this is knowing the Player ID of the player on whose behalf the script is being run. The context in which your script is run determines the available data model and provides context specific data that is used in your script.

In this tutorial, you learn how to:

> [!div class="checklist"]
> * Use the shared context model
> * Use the context model when executing via the ExecuteFunction API.
> * Use the context model when executing via Scheduled Task.
> * Use the context model when executing in the context of a Player.
> * Use the context model when executing in the context of an Entity.

## Use the shared Title Authentication context model

No matter the method for executing a script the Title Authentication context is always provided.  This includes the Title ID and Entity Token (see [GetEntityToken](/rest/api/playfab/authentication/authentication/get-entity-token) for more details) used to execute the script.  Knowing this context allows you to make additional API calls in your script into PlayFab using the Server APIs.

```C#
// Shared models
public class TitleAuthenticationContext
{
    public string Id { get; set; }
    public string EntityToken { get; set; }
}
```

## Use the context model when executing via the ExecuteFunction API

When you use the [ExecuteFunction API](/rest/api/playfab/cloudscript/server-side-cloud-script/execute-function) to execute a script, the context that is provided includes the following information:

* The Entity Profile of the caller
* The Title Authentication Context
* A boolean that indicates whether a PlayStream event is sent as part of the function being executed
* The functions arguments used when calling the script

```C#
// Models via ExecuteFunction API
public class FunctionExecutionContext<T>
{
    public PlayFab.ProfilesModels.EntityProfileBody CallerEntityProfile { get; set; }
    public TitleAuthenticationContext TitleAuthenticationContext { get; set; }
    public bool? GeneratePlayStreamEvent { get; set; }
    public T FunctionArgument { get; set; }
}

public class FunctionExecutionContext : FunctionExecutionContext<object>
{
}
```

## Use the context model when executing via Scheduled Task
When you [Scheduled Tasks](../scheduled-tasks/index.md) to execute a script, the context that is provided includes the following information:
* The Scheduled Task Name Id
* The event history which includes a stack of PlayStream Events
* The title Authentication Context
* A boolean that indicates whether a PlayStream event is sent as part of the function being executed
* The functions argument used when calling the script

```C#
// Models via Scheduled task
public class PlayStreamEventHistory
{
    public string ParentTriggerId { get; set; }
    public string ParentEventId { get; set; }
    public bool TriggeredEvents { get; set; }
}

public class ScheduledTaskFunctionExecutionContext<T>
{
    public PlayFab.CloudScriptModels.NameIdentifier ScheduledTaskNameId { get; set; }
    public Stack<PlayStreamEventHistory> EventHistory { get; set; }
    public TitleAuthenticationContext TitleAuthenticationContext { get; set; }
    public bool? GeneratePlayStreamEvent { get; set; }
    public T FunctionArgument { get; set; }
}

public class ScheduledTaskFunctionExecutionContext : ScheduledTaskFunctionExecutionContext<object>
{
}
```

## Use the context model when executing in the context of a Player 
When executing a script through Player PlayStream Events, entering or leaving an segment or as part of a segment based scheduled task the context that is provided includes the following information:
* The Player Profile
* Boolean indicating if the player profile is trunctated.  
   * The Player Profile will be truncated if it is over 2048 bytes.  If this occurs you will need to use the profile APIs (either server, client or entity APIs) to retrieve the full profile.
* The PlayStream event which triggered the script.
* A boolean that indicates whether a PlayStream event is sent as part of the function being executed
* The functions arguments used when calling the script

```C#
// Models via Player PlayStream event, entering or leaving a 
// player segment or as part of a player segment based scheduled task.
public class PlayerPlayStreamFunctionExecutionContext<T>
{
    public PlayFab.CloudScriptModels.PlayerProfileModel PlayerProfile { get; set; }
    public bool PlayerProfileTruncated { get; set; }
    public PlayFab.CloudScriptModels.PlayStreamEventEnvelopeModel PlayStreamEventEnvelope { get; set; }
    public TitleAuthenticationContext TitleAuthenticationContext { get; set; }
    public bool? GeneratePlayStreamEvent { get; set; }
    public T FunctionArgument { get; set; }
}

public class PlayerPlayStreamFunctionExecutionContext : PlayerPlayStreamFunctionExecutionContext<object>
{
}
```

## Use the context model when executing via an Entity PlayStream Events, entering or leaving an entity segment or as part of an entity segment based scheduled task.
When executing script through Entity PlayStream Events, entering or leaving an entity segment or as part of a entity segment based scheduled task the context that is provided includes the following information:
* The Entity Profile
* The PlayStream event which triggered the script.
* A boolean that indicates whether a PlayStream event is sent as part of the function being executed

```C#
// Models via Entity PlayStream event, entering or leaving an 
// entity segment or as part of an entity segment based scheduled task.
public class EventFullName
{
    public string Name { get; set; }
    public string Namespace { get; set; }
}

public class OriginInfo
{
    public string Id { get; set; }
    public DateTime? Timestamp { get; set; }
}

public class EntityPlayStreamEvent<T>
{
    public string SchemaVersion { get; set; }
    public EventFullName FullName { get; set; }
    public string Id { get; set; }
    public DateTime Timestamp { get; set; }
    public PlayFab.CloudScriptModels.EntityKey Entity { get; set; }
    public PlayFab.CloudScriptModels.EntityKey Originator { get; set; }
    public OriginInfo OriginInfo { get; set; }
    public T Payload { get; set; }
    public PlayFab.ProfilesModels.EntityLineage EntityLineage { get; set; }
}

public class EntityPlayStreamEvent : EntityPlayStreamEvent<object>
{
}

public class EntityPlayStreamFunctionExecutionContext<TPayload, TArg>
{
    public PlayFab.ProfilesModels.EntityProfileBody CallerEntityProfile { get; set; }
    public EntityPlayStreamEvent<TPayload> PlayStreamEvent { get; set; }
    public TitleAuthenticationContext TitleAuthenticationContext { get; set; }
    public bool? GeneratePlayStreamEvent { get; set; }
    public TArg FunctionArgument { get; set; }
}

public class EntityPlayStreamFunctionExecutionContext : EntityPlayStreamFunctionExecutionContext<object, object>
{
}
```

> [!NOTE]
> You can download the full [CloudScript using Azure Functions helper class](https://github.com/PlayFab/PlayFab-Samples/blob/master/Samples/CSharp/AzureFunctions/CS2AFHelperClasses.cs).
