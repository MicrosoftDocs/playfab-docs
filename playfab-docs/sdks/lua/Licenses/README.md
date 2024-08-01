---
title: Luasec license read me
author: joannaleecy
description: The luasec license readme file.
ms.author: joanlee
ms.date: 02/20/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, lua sdk, lua, luasec
ms.localizationpriority: medium
---

# PlayFab LuaSdk external licenses

This is a description of all the software included in, and referenced by the PlayFab LuaSdk


## Distributed with PlayFab LuaSdk

Json.lua 0.1.0 is included with the PlayFab LuaSdk

* [https://github.com/rxi/json.lua](https://github.com/rxi/json.lua)
* [https://github.com/rxi/json.lua/blob/master/LICENSE](https://github.com/rxi/json.lua/blob/master/LICENSE)


## Not Distributed with PlayFab LuaSdk

LuaSec 0.4 is automatically included in LuaDist (LuaSec not required). LuaSec is not suggested for actual game development, as the HTTPS calls block the program while executing (this is not ideal)

* https://github.com/brunoos/luasec
* https://github.com/brunoos/luasec/blob/master/LICENSE

LuaDist is the base environment PlayFab LuaSdk was initially built with (LuaDist not required)

* http://luadist.org/
* https://github.com/LuaDist
* (No explicit license is provided on the main page, or part of a download)