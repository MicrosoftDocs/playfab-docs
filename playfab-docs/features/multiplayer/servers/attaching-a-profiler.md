---
title: Attaching a profiler
author: raakisad
description: How to attach a profiler and gather logs.
ms.author: raakisad
ms.date: 10/18/2021
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer servers, profiler, attach a profiler, debugging, game manager 
ms.localizationpriority: medium
---

# Attaching a Profiler

This article goes over attaching a profiler and how you can get the output files. A profiler is used to help debug issues around graphics and performance of your game servers. To use tools such as dotnet trace or PIX you'll need to first upload your profiler of choice. Then you'll associate it to a build, and the output files will be put into your logs folder. 

It isn't recommended to attach a profiler to production builds as it can affect performance.
Set up for attaching a profiler will need to be done at build creation. We currently don't support attaching a profiler through Game Manager so you'll need to create a build using our APIs. For more information, see [Walkthrough: Deploy builds using PowerShell/API](deploy-using-powershell-api.md).

When creating a build, there's a field for asset reference under the monitoring configuration. Include the asset reference in the monitoring configuration. Ensure your asset is uploaded in Game Manager. To learn more, see [Manage assets in Build Overview](build-overview.md).


For a Linux server, below is a sample of an execution script for the profiler.
```Bash Script
sighdl()
{
    #This is the folder the monitoring output should be written to.
    monitoring_folder_path = "${PF_MONITORING_LOG_FOLDER}"

    #Code to end monitoring and copy the output 

    exit 0
}

#set up the trap function to catch the signals and exit gracefully
trap sighdl SIGKILL SIGINT SIGTERM
sleep 3600
```

For a windows server below is a sample of an execution script for the profiler.
```PowerShell
#Sample function that checks for the sentinel file's existence in order to end.
function Check_Sentinel_File()
{
    $fullPath = $Env:PF_SENTINEL_FILE
    while(!(Test-Path $fullPath)) { Start-Sleep 10}

    #PF_MONITORING_LOG_FOLDER contains the log folder where the monitoring output should be saved
    
    $outputPath = "{0}/{1}" -f $Env:PF_MONITORING_LOG_FOLDER, "output.txt"
    "I've died!" | Out-File $outputPath 
}

Check_Sentinel_File
```
* Make sure you save your output inside the folder set on the **PF_MONITORING_LOG_FOLDER** environment variable as it will ensure your output is saved. 
* Once the server has been archived, you can download the logs and inside you'll find a folder called **PlayfabProfilingOutput**. This will have what you have written in your execution script along with any standard outputs and errors. 