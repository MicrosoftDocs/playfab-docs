---
title: PlayFab CloudScript using Azure Functions Quickstart Guide  
author: williacj
description: PlayFab CloudScript using Azure Functions Quickstart Guide
ms.author: cjwill
ms.date: 04/03/2020
ms.topic: quickstart
ms.prod: playfab
keywords: playfab, automation, cloudscript, azure functions
ms.localizationpriority: medium
---
 
# Quickstart: Writing a PlayFab CloudScript using Azure Functions

In this quickstart, you will write a CloudScript using Azure Functions with Visual Studio Code, Azure Functions C# and Unity C#. After finishing this guide you will be able to link your new CloudScript to rules, scheduled tasks or even call it from your client code.

## Prerequisites

There are a couple of steps needed to get started with PlayFab C# CloudScript.

- Visit the Visual Studio Code [QuickStart: Create an Azure Functions project using Visual Studio Code](https://docs.microsoft.com/azure/azure-functions/functions-create-first-function-vs-code?pivots=programming-language-csharp) and return here once you are completely set up. The following prerequisites are covered in their quickstart guide:
  - An [Azure account](https://azure.microsoft.com/free).  Signing up for an Azure Account is free
  - An [Azure Subscription](https://docs.microsoft.com/azure/billing/billing-create-subscription)
  - A Functions App resource configured in the Azure Portal
    - To minimize latency of your CloudScript using Azure Functions place them in either *US-West* or *US-West 2* Azure regions.   
    - **Security Note:** From a security perspective you should make sure to only use a given function secret with PlayFab and not use it for calling the same function from any other source.
    - **Security Note:** For queued functions you should set up a distinct storage account for the queues used for the queue trigger.
- A [PlayFab account](https://developer.playfab.com/signup)

> [!NOTE] 
> PlayFab Azure Functions can use the Azure Functions V2 runtime or greater, and .NET Core 2 or greater. Ideally you should use the latest version (currently Azure Functions V3 and .NET Core 3).

## Enable the Feature

To begin using this feature you need to enable it.  In Game Manager, go to **Automation** > **CloudScript** > **Functions (Preview)**.

* Select the **Enable** button to turn on Game Manager pages that  allow you to register functions, hook them up to rules, tasks etc.

![Enable PlayFab C# CloudScript](media/enable_azure_functions.jpg)

## Create an Azure Function

1. Create a basic "HelloWorld" example function. You can see how to do this by following the [Create your first function using Visual Studio Code guide](https://docs.microsoft.com/azure/azure-functions/functions-create-first-function-vs-code).  For a code example using PlayFab variables, see the section below [PlayFab Function Context, Variables and using the Server SDKs](#playfabfunctioncontext).
2. Once your function has been created and deployed, select the **Register Function** button in the top right hand corner of the **Functions (Preview)** page.

   ![Register CloudScript Function](media/register_cs_function.jpg)
1. For **Name**, enter a human-friendly name for your function. For **Function URL**, enter the HTTP Trigger URL of the function. The URL can be found in the output of your deployment.

   ![Deployment Output](media/azure_func_deployment.jpg)

> [!TIP] 
> To learn more about deploying Azure functions, see [Deploy Azure Functions from Visual Studio Code](https://code.visualstudio.com/tutorials/functions-extension/deploy-app).


## Using and Calling CloudScript using Azure Functions from your PlayFab Title

> [!NOTE]
>  The example code in this guide are written in Unity C# & Azure Function C# code.

Now that your function is registered, you can call that function from within your client.

```C#
//This snippet assumes that your game client is already logged into PlayFab.

using PlayFab;
using PlayFab.CloudScriptModels;

private void CallCSharpExecuteFunction()
{
    PlayFabCloudScriptAPI.ExecuteFunction(new ExecuteFunctionRequest()
    {
        Entity = new PlayFab.CloudScriptModels.EntityKey()
        {
            Id = PlayFabSettings.staticPlayer.EntityId, //Get this from when you logged in,
            Type = PlayFabSettings.staticPlayer.EntityType, //Get this from when you logged in
        },
        FunctionName = "HelloWorld", //This should be the name of your Azure Function that you created.
        FunctionParameter = new Dictionary<string, object>() { { "inputValue", "Test" } }, //This is the data that you would want to pass into your function.
        GeneratePlayStreamEvent = false //Set this to true if you would like this call to show up in PlayStream
    }, (ExecuteFunctionResult result) =>
    {
        if (result.FunctionResultTooLarge ?? false)
        {
            Debug.Log("This can happen if you exceed the limit that can be returned from an Azure Function, See PlayFab Limits Page for details.");
            return;
        }
        Debug.Log($"The {result.FunctionName} function took {result.ExecutionTimeMilliseconds} to complete");
        Debug.Log($"Result: {result.FunctionResult.ToString()}");
    }, (PlayFabError error) =>
    {
        Debug.Log($"Opps Something went wrong: {error.GenerateErrorReport()}");
    });
}

```

### PlayFab CloudScript Context, Variables and Server SDKs <a name="playfabfunctioncontext"></a>

One advantage of using CloudScript using Azure Functions is that the PlayStream Event and Player Profile context is automatically passed to the Azure Function. On invocation of the Cloudscript you receive the context and in what context the Function was called. For example, whether it was triggered by a PlayStream Action or called directly from the client. This includes information such as the entity profile on whose behalf the CloudScripts was invoked, and potentially the PlayStream events used to invoke the CloudScript.

There are a couple of steps that you need to do if you are coding Functions without our [PlayFab Visual Studio Code Extension](https://github.com/PlayFab/vscode-playfab-explorer). 

1. You will need to install the PlayFab SDK via Package Manager. To do this open Terminal or CMD Console in Visual Studio Code and type: `dotnet add package PlayFabAllSDK`
2. We have created some helpers that will ship with the cSharpSDK.  
3. You need to edit your .csproj file and include `<DefineConstants>NETCOREAPP2_0</DefineConstants>` in your default PropertyGroup or NETCOREAPP3_1 if you are using the latest.

   ![Define Constants](media/define_constants.jpg)

4. Execution of a script can occur through several methods (APIs, Scheduled Tasks, PlayStream Event, Segment Entering and Exit method).  The context of the execution is important to implement your CloudScript. See the [Using CloudScript context models tutorial](CloudScript-af-context.md) for details on how to use the context of the script.

A Hello World example is always nice, see the HelloWorld Sample below that you can use as your first Azure Function. To compile and run the sample, you need to include the [CS2AFHelperClasses.cs](https://github.com/PlayFab/PlayFab-Samples/blob/master/Samples/CSharp/AzureFunctions/CS2AFHelperClasses.cs) file which contains the implementation of `PlayFab.Samples` namespace.

```C#
using System.Threading.Tasks;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Extensions.Http;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;
using PlayFab.Samples;

namespace PlayFabCS2AFSample.HelloWorld
{
    public static class HelloWorld
    {
        [FunctionName("HelloWorld")]
        public static async Task<dynamic> Run(
            [HttpTrigger(AuthorizationLevel.Function, "get", "post", Route = null)] HttpRequest req,
            ILogger log)
        {
            FunctionExecutionContext<dynamic> context = JsonConvert.DeserializeObject<FunctionExecutionContext<dynamic>>(await req.ReadAsStringAsync());

            dynamic args = context.FunctionArgument;

            var message = $"Hello {context.CallerEntityProfile.Lineage.MasterPlayerAccountId}!";
            log.LogInformation(message);

            dynamic inputValue = null;
            if (args != null && args["inputValue"] != null)
            {
                inputValue = args["inputValue"];
            }

            log.LogDebug($"HelloWorld: {new { input = inputValue} }");

            return new { messageValue = message };
        }
    }
}
```

As you can see in the above example, the `CurrentPlayerId` of the caller is available like in our traditional CloudScript implementation.  Parameters you have passed in the `FunctionParameters` field will be available in the *args*. But unlike the Hello World example in [Create your first function using Visual Studio Code guide](https://docs.microsoft.com/azure/azure-functions/functions-create-first-function-vs-code), parameters are passed in the POST body instead of the query string. 

> [!NOTE]
> You will need to call this HelloWorld Azure Function via ExecuteFunction from an SDK.

## Azure Function Rules

Azure Functions can also be called by creating rules and scheduled tasks.  This works in the same way as our standard CloudScript.  To create a rule or scheduled task, go to **Automation** > **Rules**  or **Automation** > **Scheduled Tasks**. 

* Click **New Rule**
* Enter a name for your rule
* Select the event type that this rule will trigger on
* Add an action
* From the action dropdown select **Execute Azure Function**

A list of available Azure Functions that you've registered will be available in the drop-down list.

![Configure Rule for Azure Functions](media/azure_function_rules.jpg)

## Debugging your Azure Function

With Azure functions, you now have the option to debug your CloudScript locally or in the Azure portal. To learn more about portal debugging, see [Debugging CloudScript using Azure Functions with the Azure portal](debugging-with-CloudScript-AF-Azure.md). To learn how to set up local debugging, see [Local debugging for Cloudscript using Azure Functions](local-debugging-for-cloudscript-using-azure-functions.md).
