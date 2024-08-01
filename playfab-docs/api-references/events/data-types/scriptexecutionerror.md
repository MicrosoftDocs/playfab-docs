---
title: ScriptExecutionError
author: joannaleecy
description: ScriptExecutionError data type.
ms.author: joanlee
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# ScriptExecutionError

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|Error|String|Error code, such as CloudScriptNotFound, JavascriptException, CloudScriptFunctionArgumentSizeExceeded, CloudScriptAPIRequestCountExceeded, CloudScriptAPIRequestError, or CloudScriptHTTPRequestError|
|Message|String|Details about the error|
|StackTrace|String|Point during the execution of the script at which the error occurred, if any|
