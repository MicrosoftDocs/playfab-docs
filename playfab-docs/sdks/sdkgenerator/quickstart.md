---
title: SDK Generator quickstart
author: joannaleecy
description: This guide shows you how to quickly get started with the PlayFab SDK Generator.
ms.author: joanlee
ms.date: 01/22/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, sdks, playfab sdk, code generator, sdk generator, playfab sdk generator
ms.localizationpriority: medium
---

# SDK Generator quickstart

The SDK Generator is a node.js-based program that takes a JSON description of the PlayFab API, and uses it to generate out all the different SDKs that must be kept up to date. The SDK Generator project also contains the sources for all PlayFab SDKs on all platforms. If you want to make a change in an SDK, this is where the change has to go.

Before you can call any PlayFab API, you must have a [PlayFab developer account](https://developer.playfab.com/en-us/sign-up). 

## Prerequisites

1. Any recent MS-Windows Operating System.
2. You must have Node.js installed: <https://nodejs.org/>
   - The location of node.exe must be in your PATH environment variable. Default: C:\Program Files (x86)\nodejs\
   - It is highly suggested that you install Node.js tools for Visual Studio: <https://beta.visualstudio.com/vs/node-js/>.
3. `SdkGenerator` requires several PlayFab repositories, cloned to your local machine, as sibling folders to `SdkGenerator`.
   - `<parent-folder>/SdkGenerator = <https://github.com/PlayFab/SDKGenerator>` (you're looking at it)
   - `<parent-folder>/sdks/<targetSDK>` - For every SDK you want to generate, you should git-clone the PlayFab repository for that target into the "sdks" sub-folder first. In many cases, there are required files in the repo which are not generated.
4. `SdkGenerator` can be configured to read from other PlayFab repositories, cloned to your local machine, as sibling folders to SdkGenerator.
   - `<parent-folder>/API_Specs = <https://github.com/PlayFab/api_specs>`

## Usage instructions

If you have installed Node.js tools, then you can build any existing SDK from the Visual Studio solution: [https://github.com/PlayFab/SDKGenerator/blob/master/SDKGenerator.sln](https://github.com/PlayFab/SDKGenerator/blob/master/SDKGenerator.sln)

- Open the solution.
- Set the Project Configuration to match the SDK you wish to build.
- **Build** -> **Build Solution**.

There are many prebuilt scripts which can build each SDK automatically: [https://github.com/PlayFab/SDKGenerator/tree/master/SDKBuildScripts](https://github.com/PlayFab/SDKGenerator/tree/master/SDKBuildScripts)

- Find the script that matches the SDK you wish to build (EX unity_build.bat).
- Double-click that file.

If you want to build a new SDK, you may need to build a new .bat file using the instructions in the next section.

Finally, you must supply a list of targets to generate, and the directory to generate them to.

To manually invoke the generator, open a command line at the root of the project and type in a target.  Each target takes the form:

`<targetName>=<targetOutputLocation>`

Where `<targetName>` is one of the supported SDK targets, and `<targetOutputLocation>` is a path to a directory in which to generate the SDK.

> [!NOTE]
> Make sure there are no spaces between the arguments and the equals sign.

### API-Spec location

- You may optionally define exactly one location to read API-Spec information.
  - `-apiSpecPath []`
    - If the `-apiSpecPath` switch is defined without a path, this defaults to `../API_Specs` (relative path, sibling to SdkGenerator repo location).
  - `-apiSpecGitUrl []`
    - If the `-apiSpecGitUrl` switch is defined without a URL, this defaults to `<https://raw.githubusercontent.com/PlayFab/API_Specs/master/>`
    - Reads API_Specs directly from a GitHub repository.
  - `-apiSpecPfUrl []`
    - If the `-apiSpecPfUrl` switch is defined without a URL, this defaults to `<https://www.playfabapi.com/apispec/>`
    - Reads API_Specs directly from the PlayFab API Server.

Flags are optional, and can be used to generate console APIs.

## Building a new SDK

Setting up a new target in the `SdkGenerator` is fairly simple. This example has been added to the `SdkGenerator` for reference: [https://github.com/PlayFab/SDKGenerator/tree/master/targets/newTarget](https://github.com/PlayFab/SDKGenerator/tree/master/targets/newTarget).

- Add a new sub-folder in [SdkGenerator/Targets](https://github.com/PlayFab/SDKGenerator/tree/master/targets).
- Add a "make.js" file to your new target.
  - Implement `makeClientAPI2`, `makeServerAPI`, and/or `makeCombinedAPI` in the file, as shown in the [NewTarget Example](https://github.com/PlayFab/SDKGenerator/blob/master/targets/newTarget/make.js).
  - Optionally, you may use template files and source files, as described in the NewTarget example.
- Add a new bat-file to generate your sdk in [SdkGenerator/SDKBuildScripts](https://github.com/PlayFab/SDKGenerator/tree/master/SDKBuildScripts).

PlayFab sometimes accepts submissions for new SDKs. This process is extensive, and it has to be integrated with our automated build and testing system. For more information contact us on the forums.

## Troubleshooting

For a complete list of available APIs, check out the [API References](../../api-references/index.md).

### Contact us

We love to hear from our developer community! Do you have ideas on how we can make our products and services better?

Our Developer Success Team can assist with answering any questions as well as process any feedback you have about PlayFab services.

[Forums, Support and Knowledge Base](https://community.playfab.com/)
