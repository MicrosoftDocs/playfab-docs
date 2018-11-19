---
title: Using CloudScript
author: v-thopra
description: Describes uploading and managing your CloudScript files in the PlayFab Game Manager.
ms.author: v-thopra
ms.date: 06/11/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, automation, game manager, cloudscript
ms.localizationpriority: medium
---

# Using CloudScript Quickstart

CloudScript offers a fast, secure and scalable alternative to dedicated servers. Your custom JavaScript lives and executes directly on PlayFab machines. From here, your code can be called directly by your game clients or indirectly via PlayStream actions. Additionally, CloudScript methods have full access to PlayFab's [Server](https://api.playfab.com/Documentation/Server) API set.

This tutorial covers uploading and managing your CloudScript files in the PlayFab Game Manager. The [Writing custom CloudScript](writing-custom-cloudscript.md) tutorial covers writing the CloudScript code itself.

Please note the following when reading this tutorial:

- You should be familiar with the basics of PlayFab.
- C# Samples shown in this tutorial correspond to using the PlayFab Unity SDK.
- JavaScript samples correspond to using PlayFab's CloudScript service

## Your first CloudScript revision

After creating a title, PlayFab automatically includes an example script as your first revision. This revision includes a number of methods that you can use for learning and testing CloudScript. To see these functions, open [Game Manager](https://developer.playfab.com/), select your title, and click **Automation** on the left side bar.

You should see a number of CloudScript methods, such as helloWorld, which logs the message Hello PLAYERID, where PLAYERID is the current player's PlayFab ID.

![Game Manager - Automation - CloudScript](media/tutorials/game-manager-cloudscript.png)  

## Uploading your own revisions

You can upload your own custom methods via the Game Manager. Each file you upload will create a new revision. During the upload, the PlayFab service runs a simple LINT check over your CloudScript for syntax errors. If it finds an error, an error message will be displayed. Fix the error, and click SUBMIT again. By default, new uploads must deployed by clicking the "DEPLOY REVISION # TO LIVE" link. This enables you to update or roll back to/from multiple versions of CloudScript.

The first time you press the "UPLOAD NEW REVISION" button (orange), you will see a file selector where you can upload a file from your local machine:

![Game Manager - Upload CloudScript file](media/tutorials/game-manager-upload-cloudscript.png)  

After you have added several revisions, you can select which submitted revision is live with the dropdown:

![Game Manager - Upload CloudScript - select revision](media/tutorials/game-manager-cloudscript-select-revision.png)  

## GitHub integration

You may also use GitHub to manage your CloudScript revisions. You must have a GitHub account, and you must be logged in.

- Click the "USE GITHUB" button (the grey button in the previous screenshot).
- The next window will have an "AUTHORIZE GITHUB ACCOUNT" button (orange).
- Create a new, empty repository in GitHub.
- Return to the GitHub page in the PlayFab Game Manager (refresh tab).
- At this point, you should be able to select your GitHub repository and bind it to your title:

![Game Manager - Addons - GitHub](media/tutorials/game-manager-addons-github.png)  

Once bound to GitHub, the manual upload option is removed, and new CloudScript revisions are automatically made for each GitHub commit to **"master"** branch. If you commit multiple files, they will be concatenated together into a single PlayFab CloudScript revision. Live-revision selection remains the same: new commits to GitHub must be set to live in Game Manager as described above.

## Conclusion

CloudScript allows you to upload files to PlayFab, and execute your code on our server. You can manage your CloudScript files from the **Automation** option in the left side bar.  You can upload files manually from your own computer, or bind your title to a GitHub account.

This tutorial covers managing your code files and uploading them to PlayFab. If you have more questions, the [Writing custom CloudScript](writing-custom-cloudscript.md) tutorial will tell you more about how to write your CloudScript code files.