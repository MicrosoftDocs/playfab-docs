---
author: jasonsandlin
title: "Services C API overview - PFCatalog.h"
description: "Services C API overview - PFCatalog.h"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# Services C API overview - PFCatalog.h

  
## Functions  

| Function | Description |  
| --- | --- |  
| [PFCatalogCreateDraftItemAsync](functions/pfcatalogcreatedraftitemasync.md) | Creates a new item in the working catalog using provided metadata. |  
| [PFCatalogCreateDraftItemGetResult](functions/pfcatalogcreatedraftitemgetresult.md) | Gets the result of a successful PFCatalogCreateDraftItemAsync call. |  
| [PFCatalogCreateDraftItemGetResultSize](functions/pfcatalogcreatedraftitemgetresultsize.md) | Get the size in bytes needed to store the result of a CreateDraftItem call. |  
| [PFCatalogCreateUploadUrlsAsync](functions/pfcatalogcreateuploadurlsasync.md) | Creates one or more upload URLs which can be used by the client to upload raw file data. Content URls and uploaded content will be garbage collected after 24 hours if not attached to a draft or published item. Detailed pricing info around uploading content can be found here: https://learn.microsoft.com/gaming/playfab/features/pricing/meters/catalog-meters |  
| [PFCatalogCreateUploadUrlsGetResult](functions/pfcatalogcreateuploadurlsgetresult.md) | Gets the result of a successful PFCatalogCreateUploadUrlsAsync call. |  
| [PFCatalogCreateUploadUrlsGetResultSize](functions/pfcatalogcreateuploadurlsgetresultsize.md) | Get the size in bytes needed to store the result of a CreateUploadUrls call. |  
| [PFCatalogDeleteItemAsync](functions/pfcatalogdeleteitemasync.md) | Removes an item from working catalog and all published versions from the public catalog. |  
| [PFCatalogGetDraftItemAsync](functions/pfcataloggetdraftitemasync.md) | Retrieves an item from the working catalog. This item represents the current working state of the item. GetDraftItem does not work off a cache of the Catalog and should be used when trying to get recent item updates. However, please note that item references data is cached and may take a few moments for changes to propagate. |  
| [PFCatalogGetDraftItemGetResult](functions/pfcataloggetdraftitemgetresult.md) | Gets the result of a successful PFCatalogGetDraftItemAsync call. |  
| [PFCatalogGetDraftItemGetResultSize](functions/pfcataloggetdraftitemgetresultsize.md) | Get the size in bytes needed to store the result of a GetDraftItem call. |  
| [PFCatalogGetDraftItemsAsync](functions/pfcataloggetdraftitemsasync.md) | Retrieves a paginated list of the items from the draft catalog. Up to 50 IDs can be retrieved in a single request. GetDraftItems does not work off a cache of the Catalog and should be used when trying to get recent item updates. |  
| [PFCatalogGetDraftItemsGetResult](functions/pfcataloggetdraftitemsgetresult.md) | Gets the result of a successful PFCatalogGetDraftItemsAsync call. |  
| [PFCatalogGetDraftItemsGetResultSize](functions/pfcataloggetdraftitemsgetresultsize.md) | Get the size in bytes needed to store the result of a GetDraftItems call. |  
| [PFCatalogGetEntityDraftItemsAsync](functions/pfcataloggetentitydraftitemsasync.md) | Retrieves a paginated list of the items from the draft catalog created by the Entity. Up to 50 items can be returned at once. You can use continuation tokens to paginate through results that return greater than the limit. GetEntityDraftItems does not work off a cache of the Catalog and should be used when trying to get recent item updates. |  
| [PFCatalogGetEntityDraftItemsGetResult](functions/pfcataloggetentitydraftitemsgetresult.md) | Gets the result of a successful PFCatalogGetEntityDraftItemsAsync call. |  
| [PFCatalogGetEntityDraftItemsGetResultSize](functions/pfcataloggetentitydraftitemsgetresultsize.md) | Get the size in bytes needed to store the result of a GetEntityDraftItems call. |  
| [PFCatalogGetEntityItemReviewAsync](functions/pfcataloggetentityitemreviewasync.md) | Gets the submitted review for the specified item by the authenticated entity. Individual ratings and reviews data update in near real time with delays within a few seconds. |  
| [PFCatalogGetEntityItemReviewGetResult](functions/pfcataloggetentityitemreviewgetresult.md) | Gets the result of a successful PFCatalogGetEntityItemReviewAsync call. |  
| [PFCatalogGetEntityItemReviewGetResultSize](functions/pfcataloggetentityitemreviewgetresultsize.md) | Get the size in bytes needed to store the result of a GetEntityItemReview call. |  
| [PFCatalogGetItemAsync](functions/pfcataloggetitemasync.md) | Retrieves an item from the public catalog. GetItem does not work off a cache of the Catalog and should be used when trying to get recent item updates. However, please note that item references data is cached and may take a few moments for changes to propagate. |  
| [PFCatalogGetItemContainersAsync](functions/pfcataloggetitemcontainersasync.md) | Search for a given item and return a set of bundles and stores containing the item. Up to 50 items can be returned at once. You can use continuation tokens to paginate through results that return greater than the limit. This API is intended for tooling/automation scenarios and has a reduced RPS with Player Entities limited to 30 requests in 300 seconds and Title Entities limited to 100 requests in 10 seconds. |  
| [PFCatalogGetItemContainersGetResult](functions/pfcataloggetitemcontainersgetresult.md) | Gets the result of a successful PFCatalogGetItemContainersAsync call. |  
| [PFCatalogGetItemContainersGetResultSize](functions/pfcataloggetitemcontainersgetresultsize.md) | Get the size in bytes needed to store the result of a GetItemContainers call. |  
| [PFCatalogGetItemGetResult](functions/pfcataloggetitemgetresult.md) | Gets the result of a successful PFCatalogGetItemAsync call. |  
| [PFCatalogGetItemGetResultSize](functions/pfcataloggetitemgetresultsize.md) | Get the size in bytes needed to store the result of a GetItem call. |  
| [PFCatalogGetItemPublishStatusAsync](functions/pfcataloggetitempublishstatusasync.md) | Gets the status of a publish of an item. |  
| [PFCatalogGetItemPublishStatusGetResult](functions/pfcataloggetitempublishstatusgetresult.md) | Gets the result of a successful PFCatalogGetItemPublishStatusAsync call. |  
| [PFCatalogGetItemPublishStatusGetResultSize](functions/pfcataloggetitempublishstatusgetresultsize.md) | Get the size in bytes needed to store the result of a GetItemPublishStatus call. |  
| [PFCatalogGetItemReviewsAsync](functions/pfcataloggetitemreviewsasync.md) | Get a paginated set of reviews associated with the specified item. Individual ratings and reviews data update in near real time with delays within a few seconds. |  
| [PFCatalogGetItemReviewsGetResult](functions/pfcataloggetitemreviewsgetresult.md) | Gets the result of a successful PFCatalogGetItemReviewsAsync call. |  
| [PFCatalogGetItemReviewsGetResultSize](functions/pfcataloggetitemreviewsgetresultsize.md) | Get the size in bytes needed to store the result of a GetItemReviews call. |  
| [PFCatalogGetItemReviewSummaryAsync](functions/pfcataloggetitemreviewsummaryasync.md) | Get a summary of all ratings and reviews associated with the specified item. Summary ratings data is cached with update data coming within 15 minutes. |  
| [PFCatalogGetItemReviewSummaryGetResult](functions/pfcataloggetitemreviewsummarygetresult.md) | Gets the result of a successful PFCatalogGetItemReviewSummaryAsync call. |  
| [PFCatalogGetItemReviewSummaryGetResultSize](functions/pfcataloggetitemreviewsummarygetresultsize.md) | Get the size in bytes needed to store the result of a GetItemReviewSummary call. |  
| [PFCatalogGetItemsAsync](functions/pfcataloggetitemsasync.md) | Retrieves items from the public catalog. Up to 50 items can be returned at once. GetItems does not work off a cache of the Catalog and should be used when trying to get recent item updates. However, please note that item references data is cached and may take a few moments for changes to propagate. |  
| [PFCatalogGetItemsGetResult](functions/pfcataloggetitemsgetresult.md) | Gets the result of a successful PFCatalogGetItemsAsync call. |  
| [PFCatalogGetItemsGetResultSize](functions/pfcataloggetitemsgetresultsize.md) | Get the size in bytes needed to store the result of a GetItems call. |  
| [PFCatalogPublishDraftItemAsync](functions/pfcatalogpublishdraftitemasync.md) | Initiates a publish of an item from the working catalog to the public catalog. You can use the GetItemPublishStatus API to track the state of the item publish. |  
| [PFCatalogReportItemAsync](functions/pfcatalogreportitemasync.md) | Submit a report for an item, indicating in what way the item is inappropriate. |  
| [PFCatalogReportItemReviewAsync](functions/pfcatalogreportitemreviewasync.md) | Submit a report for a review |  
| [PFCatalogReviewItemAsync](functions/pfcatalogreviewitemasync.md) | Creates or updates a review for the specified item. More information around the caching surrounding item ratings and reviews can be found here: https://learn.microsoft.com/gaming/playfab/features/economy-v2/catalog/ratings#ratings-design-and-caching |  
| [PFCatalogSearchItemsAsync](functions/pfcatalogsearchitemsasync.md) | Executes a search against the public catalog using the provided search parameters and returns a set of paginated results. SearchItems uses a cache of the catalog with item updates taking up to a few minutes to propagate. You should use the GetItem API for when trying to immediately get recent item updates. More information about the Search API can be found here: https://learn.microsoft.com/gaming/playfab/features/economy-v2/catalog/search |  
| [PFCatalogSearchItemsGetResult](functions/pfcatalogsearchitemsgetresult.md) | Gets the result of a successful PFCatalogSearchItemsAsync call. |  
| [PFCatalogSearchItemsGetResultSize](functions/pfcatalogsearchitemsgetresultsize.md) | Get the size in bytes needed to store the result of a SearchItems call. |  
| [PFCatalogSubmitItemReviewVoteAsync](functions/pfcatalogsubmititemreviewvoteasync.md) | Submit a vote for a review, indicating whether the review was helpful or unhelpful. |  
| [PFCatalogUpdateDraftItemAsync](functions/pfcatalogupdatedraftitemasync.md) | Update the metadata for an item in the working catalog. |  
| [PFCatalogUpdateDraftItemGetResult](functions/pfcatalogupdatedraftitemgetresult.md) | Gets the result of a successful PFCatalogUpdateDraftItemAsync call. |  
| [PFCatalogUpdateDraftItemGetResultSize](functions/pfcatalogupdatedraftitemgetresultsize.md) | Get the size in bytes needed to store the result of a UpdateDraftItem call. |  
