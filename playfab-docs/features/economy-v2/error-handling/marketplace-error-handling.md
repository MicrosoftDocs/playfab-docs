---
title: Marketplace Error Handling
author: fprotti96
description: Overview of how errors are handled with marketplace redemption processes.
ms.author: fprotti
ms.date: 08/09/2024
ms.topic: article
ms.service: azure-playfab
keywords: playfab, commerce, economy, monetization, marketplace, redemption, error handling
ms.localizationpriority: medium
---

# Marketplace Redemption Error Handling

When working with marketplace redemption APIs, it's crucial to have robust error handling. This article explores best practices for handling errors, from understanding common error codes to implementing graceful error recovery strategies.

Errors are returned using the standard [PlayFab Error Wrapper](/rest/api/playfab/economy/inventory/redeem-apple-app-store-inventory-items#apierrorwrapper)

## APIErrorWrapper

The `APIErrorWrapper` is a wrapper around every failed API response.

| Name | Type | Description |
| --- | --- | --- |
| code | integer | Numerical HTTP code. |
| error | string | PlayFab error code. |
| errorCode | integer | Numerical PlayFab error code. |
| errorDetails | object | Detailed description of individual issues with the request object. |
| errorMessage | string | Description for the PlayFab errorCode. |
| status | string | String HTTP code. |

For any marketplacemrelated issues, we return a Key-Value Pair (KVP) in the `errorDetails` object.

| Name | Type | Description |
| --- | --- | --- |
| MarketplaceErrorCode | string[] | The error code returned from the marketplace if a call to the marketplace failed. The first string in the array will be the error code. The second string will be the error message if it’s available. |

> [!NOTE]
> This is a passthrough of the error code and error code message returned by the marketplace.

The error response will appear as shown below. Developers should verify that `wrapper.errorDetails['MarketplaceErrorCode']` is not null and then parse the first element to handle different marketplace error codes accordingly.

```json
"{
    "code":503,
    "errorDetails":
    {
        "MarketplaceErrorCode":["1234","sample error code"]
    },
    ...    
}"
```

## Public Failure HTTP Status Codes
This section lists the error codes returned by redeem APIs.

- **400 - Bad Request**
    - All request and input validation failures `GenericErroCodes.InvalidRequest`
    - All configuration validation failures `GenericErrorCodes.InvalidServiceConfiguration`
    - All marketplace authorization failures
        - `GenericErrorCodes.InvalidServiceConfiguration` - Related to service identity failures.
        - `GenericErrorCodes.InvalidAuthToken` - Related to player identity failures.
    - All catalog item configuration failures `GenericErrorCodes.InvalidCatalogItemConfiguration`
- **401/403 - Not Authorized/Forbidden**
    - PlayFab authorization failures `GenericErrorCodes.NotAuthorized`
- **503 - MarketplaceUnavailable**
    - `GenericErrorCodes.DownstreamServiceUnavailable`