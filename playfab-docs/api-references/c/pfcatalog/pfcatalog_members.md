---
author: jasonsandlin
title: "Services C API overview - PFCatalog.h"
description: "Services C API overview - PFCatalog.h"
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# Services C API overview - PFCatalog.h

  
## Functions  

| Function | Description |  
| --- | --- |  
| [PFCatalogCreateDraftItemAsync](functions/pfcatalogcreatedraftitemasync.md) | Creates a new item in the working catalog using provided metadata. |  
| [PFCatalogCreateDraftItemGetResult](functions/pfcatalogcreatedraftitemgetresult.md) | Gets the result of a successful PFCatalogCreateDraftItemAsync call. |  
| [PFCatalogCreateDraftItemGetResultSize](functions/pfcatalogcreatedraftitemgetresultsize.md) | Get the size in bytes needed to store the result of a CreateDraftItem call. |  
| [PFCatalogCreateUploadUrlsAsync](functions/pfcatalogcreateuploadurlsasync.md) | Creates one or more upload URLs which can be used by the client to upload raw file data. |  
| [PFCatalogCreateUploadUrlsGetResult](functions/pfcatalogcreateuploadurlsgetresult.md) | Gets the result of a successful PFCatalogCreateUploadUrlsAsync call. |  
| [PFCatalogCreateUploadUrlsGetResultSize](functions/pfcatalogcreateuploadurlsgetresultsize.md) | Get the size in bytes needed to store the result of a CreateUploadUrls call. |  
| [PFCatalogDeleteItemAsync](functions/pfcatalogdeleteitemasync.md) | Removes an item from working catalog and all published versions from the public catalog. |  
| [PFCatalogGetDraftItemAsync](functions/pfcataloggetdraftitemasync.md) | Retrieves an item from the working catalog. This item represents the current working state of the item. |  
| [PFCatalogGetDraftItemGetResult](functions/pfcataloggetdraftitemgetresult.md) | Gets the result of a successful PFCatalogGetDraftItemAsync call. |  
| [PFCatalogGetDraftItemGetResultSize](functions/pfcataloggetdraftitemgetresultsize.md) | Get the size in bytes needed to store the result of a GetDraftItem call. |  
| [PFCatalogGetDraftItemsAsync](functions/pfcataloggetdraftitemsasync.md) | Retrieves a paginated list of the items from the draft catalog. |  
| [PFCatalogGetDraftItemsGetResult](functions/pfcataloggetdraftitemsgetresult.md) | Gets the result of a successful PFCatalogGetDraftItemsAsync call. |  
| [PFCatalogGetDraftItemsGetResultSize](functions/pfcataloggetdraftitemsgetresultsize.md) | Get the size in bytes needed to store the result of a GetDraftItems call. |  
| [PFCatalogGetEntityDraftItemsAsync](functions/pfcataloggetentitydraftitemsasync.md) | Retrieves a paginated list of the items from the draft catalog created by the Entity. |  
| [PFCatalogGetEntityDraftItemsGetResult](functions/pfcataloggetentitydraftitemsgetresult.md) | Gets the result of a successful PFCatalogGetEntityDraftItemsAsync call. |  
| [PFCatalogGetEntityDraftItemsGetResultSize](functions/pfcataloggetentitydraftitemsgetresultsize.md) | Get the size in bytes needed to store the result of a GetEntityDraftItems call. |  
| [PFCatalogGetEntityItemReviewAsync](functions/pfcataloggetentityitemreviewasync.md) | Gets the submitted review for the specified item by the authenticated entity. |  
| [PFCatalogGetEntityItemReviewGetResult](functions/pfcataloggetentityitemreviewgetresult.md) | Gets the result of a successful PFCatalogGetEntityItemReviewAsync call. |  
| [PFCatalogGetEntityItemReviewGetResultSize](functions/pfcataloggetentityitemreviewgetresultsize.md) | Get the size in bytes needed to store the result of a GetEntityItemReview call. |  
| [PFCatalogGetItemAsync](functions/pfcataloggetitemasync.md) | Retrieves an item from the public catalog. |  
| [PFCatalogGetItemContainersAsync](functions/pfcataloggetitemcontainersasync.md) | Search for a given item and return a set of bundles and stores containing the item |  
| [PFCatalogGetItemContainersGetResult](functions/pfcataloggetitemcontainersgetresult.md) | Gets the result of a successful PFCatalogGetItemContainersAsync call. |  
| [PFCatalogGetItemContainersGetResultSize](functions/pfcataloggetitemcontainersgetresultsize.md) | Get the size in bytes needed to store the result of a GetItemContainers call. |  
| [PFCatalogGetItemGetResult](functions/pfcataloggetitemgetresult.md) | Gets the result of a successful PFCatalogGetItemAsync call. |  
| [PFCatalogGetItemGetResultSize](functions/pfcataloggetitemgetresultsize.md) | Get the size in bytes needed to store the result of a GetItem call. |  
| [PFCatalogGetItemPublishStatusAsync](functions/pfcataloggetitempublishstatusasync.md) | Gets the status of a publish of an item. |  
| [PFCatalogGetItemPublishStatusGetResult](functions/pfcataloggetitempublishstatusgetresult.md) | Gets the result of a successful PFCatalogGetItemPublishStatusAsync call. |  
| [PFCatalogGetItemPublishStatusGetResultSize](functions/pfcataloggetitempublishstatusgetresultsize.md) | Get the size in bytes needed to store the result of a GetItemPublishStatus call. |  
| [PFCatalogGetItemReviewsAsync](functions/pfcataloggetitemreviewsasync.md) | Get a paginated set of reviews associated with the specified item. |  
| [PFCatalogGetItemReviewsGetResult](functions/pfcataloggetitemreviewsgetresult.md) | Gets the result of a successful PFCatalogGetItemReviewsAsync call. |  
| [PFCatalogGetItemReviewsGetResultSize](functions/pfcataloggetitemreviewsgetresultsize.md) | Get the size in bytes needed to store the result of a GetItemReviews call. |  
| [PFCatalogGetItemReviewSummaryAsync](functions/pfcataloggetitemreviewsummaryasync.md) | Get a summary of all reviews associated with the specified item. |  
| [PFCatalogGetItemReviewSummaryGetResult](functions/pfcataloggetitemreviewsummarygetresult.md) | Gets the result of a successful PFCatalogGetItemReviewSummaryAsync call. |  
| [PFCatalogGetItemReviewSummaryGetResultSize](functions/pfcataloggetitemreviewsummarygetresultsize.md) | Get the size in bytes needed to store the result of a GetItemReviewSummary call. |  
| [PFCatalogGetItemsAsync](functions/pfcataloggetitemsasync.md) | Retrieves items from the public catalog. |  
| [PFCatalogGetItemsGetResult](functions/pfcataloggetitemsgetresult.md) | Gets the result of a successful PFCatalogGetItemsAsync call. |  
| [PFCatalogGetItemsGetResultSize](functions/pfcataloggetitemsgetresultsize.md) | Get the size in bytes needed to store the result of a GetItems call. |  
| [PFCatalogPublishDraftItemAsync](functions/pfcatalogpublishdraftitemasync.md) | Initiates a publish of an item from the working catalog to the public catalog. |  
| [PFCatalogReportItemAsync](functions/pfcatalogreportitemasync.md) | Submit a report for an item, indicating in what way the item is inappropriate. |  
| [PFCatalogReportItemReviewAsync](functions/pfcatalogreportitemreviewasync.md) | Submit a report for a review |  
| [PFCatalogReviewItemAsync](functions/pfcatalogreviewitemasync.md) | Creates or updates a review for the specified item. |  
| [PFCatalogSearchItemsAsync](functions/pfcatalogsearchitemsasync.md) | Executes a search against the public catalog using the provided search parameters and returns a set of paginated results. |  
| [PFCatalogSearchItemsGetResult](functions/pfcatalogsearchitemsgetresult.md) | Gets the result of a successful PFCatalogSearchItemsAsync call. |  
| [PFCatalogSearchItemsGetResultSize](functions/pfcatalogsearchitemsgetresultsize.md) | Get the size in bytes needed to store the result of a SearchItems call. |  
| [PFCatalogSubmitItemReviewVoteAsync](functions/pfcatalogsubmititemreviewvoteasync.md) | Submit a vote for a review, indicating whether the review was helpful or unhelpful. |  
| [PFCatalogUpdateDraftItemAsync](functions/pfcatalogupdatedraftitemasync.md) | Update the metadata for an item in the working catalog. |  
| [PFCatalogUpdateDraftItemGetResult](functions/pfcatalogupdatedraftitemgetresult.md) | Gets the result of a successful PFCatalogUpdateDraftItemAsync call. |  
| [PFCatalogUpdateDraftItemGetResultSize](functions/pfcatalogupdatedraftitemgetresultsize.md) | Get the size in bytes needed to store the result of a UpdateDraftItem call. |  
