---
title: SDK Generator quickstart
author: v-thopra
description: This guide shows you how to quickly get started with the PlayFab SDK Generator.
ms.author: v-thopra
ms.date: 01/22/2019
ms.topic: article
ms.prod: playfab
keywords: playfab, sdks, playfab sdk, code generator, sdk generator, playfab sdk generator
ms.localizationpriority: medium
---

# SDK Generator quickstart

This is a node.js based program that takes a json description of the PlayFab API and uses it to generate out all the different SDKs that must be kept up to date. This project also contains the sources for all PlayFab SDKs on all platforms. If you want to make a change in an SDK, this is where the change has to go.

## Prerequisites

1. Any recent MS-Windows Operating System
1. You must have Node.js installed: <https://nodejs.org/>
   - The location of node.exe must be in your PATH environment variable. Default: C:\Program Files (x86)\nodejs\
   - Highly suggested that you install Node.js tools for Visual Studio: <https://beta.visualstudio.com/vs/node-js/>
1. SdkGenerator requires several PlayFab repositories, cloned to your local machine, as sibling folders to SdkGenerator.
   - `<parent-folder>/SdkGenerator = <https://github.com/PlayFab/SDKGenerator>` (you're looking at it)
   - `<parent-folder>/sdks/<targetSDK>` - For every sdk you want to generate, you should git-clone the PlayFab repository for that target into the "sdks" subfolder first. In many cases, there are required files in the repo which are not generated.
1. SdkGenerator can be configured to read from other PlayFab repositories, cloned to your local machine, as sibling folders to SdkGenerator.

   - `<parent-folder>/API_Specs = <https://github.com/PlayFab/api_specs>`

## Usage instructions

If you have installed Node.js tools, then you can build any existing SDK from the Visual Studio solution: [https://github.com/PlayFab/SDKGenerator/blob/master/SDKGenerator.sln](https://github.com/PlayFab/SDKGenerator/blob/master/SDKGenerator.sln)

- Open the solution
- Set the Project Configuration to match the sdk you wish to build
- Build -> Build Solution

There are many prebuilt scripts which can build each SDK automatically: [https://github.com/PlayFab/SDKGenerator/tree/master/SDKBuildScripts](https://github.com/PlayFab/SDKGenerator/tree/master/SDKBuildScripts)

- Find the script that matches the SDK you wish to build (EX unity_build.bat)
- Double-click that file

If you wish to build an new sdk, you may need to build a new .bat file using the instructions in the next section.

Finally, to manually invoke the generator, open a command line at the root of the project and type:

You must supply a list of targets to generate, and the directory to generate them to. Each target takes the form:

`<targetName>=<targetOutputLocation>`

Where `<targetName>` is one of the supported SDK targets, and `<targetOutputLocation>` is a path to a directory to generate the SDK in. 

> [!NOTE]
> Make sure there are no spaces between the arguments and the equals sign.

### API-Spec Location:

- You may optionally define exactly one location to read Api-Spec information
  - -apiSpecPath []
    - If the `-apiSpecPath` switch is defined without a path, this defaults to `../API_Specs` (relative path, sibling to SdkGenerator repo location)
  - -apiSpecGitUrl []
    - If the `-apiSpecGitUrl` switch is defined without a URL, this defaults to `<https://raw.githubusercontent.com/PlayFab/API_Specs/master/>`
    - Reads API_Specs directly from a GitHub repository
  - -apiSpecPfUrl []
    - If the `-apiSpecPfUrl` switch is defined without a URL, this defaults to `<https://www.playfabapi.com/apispec/>`
    - Reads API_Specs directly from the PlayFab API-Server

Flags are optional, and can be used to generate console apis.

## Building a new SDK

Setting up a new target in the SdkGenerator is fairly simple. This example has been added to the SdkGenerator for reference: [https://github.com/PlayFab/SDKGenerator/tree/master/targets/newTarget](https://github.com/PlayFab/SDKGenerator/tree/master/targets/newTarget)

- Add a new subfolder in [SdkGenerator/Targets](https://github.com/PlayFab/SDKGenerator/tree/master/targets)
- Add a "make.js" file to your new target
  - Implement makeClientAPI2, makeServerAPI, and/or makeCombinedAPI in the file, as shown in the [NewTarget Example](https://github.com/PlayFab/SDKGenerator/blob/master/targets/newTarget/make.js)
  - Optionally, you may use template files and source files, as described in the NewTarget example.
- Add a new bat-file to generate your sdk in [SdkGenerator/SDKBuildScripts](https://github.com/PlayFab/SDKGenerator/tree/master/SDKBuildScripts)

PlayFab sometimes accepts submissions for new SDKs. This process is extensive, and it has to be integrated with our automated build and testing system. For more information contact us on the forums.

## Troubleshooting

For a complete list of available APIs, check out the [API References](../../api-references/index.md).

### Contact Us

We love to hear from our developer community! Do you have ideas on how we can make our products and services better?

Our Developer Success Team can assist with answering any questions as well as process any feedback you have about PlayFab services.

[Forums, Support and Knowledge Base](https://community.playfab.com/)