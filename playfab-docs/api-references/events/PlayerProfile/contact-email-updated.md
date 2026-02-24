---
title: contact_email_updated
author: ronnyparedes
description: contact_email_updated event.
ms.author: ronnyparedes
ms.date: 02/12/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# contact_email_updated

This event is triggered when the contact email addresses of a profile have been updated.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|ContactEmails|[ContactEmailDetails](../data-types/contactemaildetails.md)[]|The new contact email addresses for the profile.|
|Operation|[OperationTypes](../data-types/operationtypes.md)|The type of operation that was performed on the contact emails.|
|PreviousContactEmails|[ContactEmailDetails](../data-types/contactemaildetails.md)[]|The previous contact email addresses for the profile.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv2.md)]
