---
author: jasonsandlin
title: "Services C API overview - PFCatalogTypes.h"
description: "Services C API overview - PFCatalogTypes.h"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# Services C API overview - PFCatalogTypes.h

  
## Structures  

| Structure | Description |  
| --- | --- |  
| [PFCatalogCatalogAlternateId](structs/pfcatalogcatalogalternateid.md) | PFCatalogCatalogAlternateId data model. |  
| [PFCatalogCatalogConfig](structs/pfcatalogcatalogconfig.md) | PFCatalogCatalogConfig data model. |  
| [PFCatalogCatalogItem](structs/pfcatalogcatalogitem.md) | PFCatalogCatalogItem data model. |  
| [PFCatalogCatalogItemReference](structs/pfcatalogcatalogitemreference.md) | PFCatalogCatalogItemReference data model. |  
| [PFCatalogCatalogPrice](structs/pfcatalogcatalogprice.md) | PFCatalogCatalogPrice data model. |  
| [PFCatalogCatalogPriceAmount](structs/pfcatalogcatalogpriceamount.md) | PFCatalogCatalogPriceAmount data model. |  
| [PFCatalogCatalogPriceAmountOverride](structs/pfcatalogcatalogpriceamountoverride.md) | PFCatalogCatalogPriceAmountOverride data model. |  
| [PFCatalogCatalogPriceOptions](structs/pfcatalogcatalogpriceoptions.md) | PFCatalogCatalogPriceOptions data model. |  
| [PFCatalogCatalogPriceOptionsOverride](structs/pfcatalogcatalogpriceoptionsoverride.md) | PFCatalogCatalogPriceOptionsOverride data model. |  
| [PFCatalogCatalogPriceOverride](structs/pfcatalogcatalogpriceoverride.md) | PFCatalogCatalogPriceOverride data model. |  
| [PFCatalogCatalogSpecificConfig](structs/pfcatalogcatalogspecificconfig.md) | PFCatalogCatalogSpecificConfig data model. |  
| [PFCatalogContent](structs/pfcatalogcontent.md) | PFCatalogContent data model. |  
| [PFCatalogCreateDraftItemRequest](structs/pfcatalogcreatedraftitemrequest.md) | PFCatalogCreateDraftItemRequest data model. The item will not be published to the public catalog until the PublishItem API is called for the item. |  
| [PFCatalogCreateDraftItemResponse](structs/pfcatalogcreatedraftitemresponse.md) | PFCatalogCreateDraftItemResponse data model. |  
| [PFCatalogCreateUploadUrlsRequest](structs/pfcatalogcreateuploadurlsrequest.md) | PFCatalogCreateUploadUrlsRequest data model. Upload URLs point to Azure Blobs; clients must follow the Microsoft Azure Storage Blob Service REST API pattern for uploading content. The response contains upload URLs and IDs for each file. The IDs and URLs returned must be added to the item metadata and committed using the CreateDraftItem or UpdateDraftItem Item APIs. |  
| [PFCatalogCreateUploadUrlsResponse](structs/pfcatalogcreateuploadurlsresponse.md) | PFCatalogCreateUploadUrlsResponse data model. |  
| [PFCatalogDeepLink](structs/pfcatalogdeeplink.md) | PFCatalogDeepLink data model. |  
| [PFCatalogDeepLinkFormat](structs/pfcatalogdeeplinkformat.md) | PFCatalogDeepLinkFormat data model. |  
| [PFCatalogDeleteItemRequest](structs/pfcatalogdeleteitemrequest.md) | PFCatalogDeleteItemRequest data model. |  
| [PFCatalogDisplayPropertyIndexInfo](structs/pfcatalogdisplaypropertyindexinfo.md) | PFCatalogDisplayPropertyIndexInfo data model. |  
| [PFCatalogFileConfig](structs/pfcatalogfileconfig.md) | PFCatalogFileConfig data model. |  
| [PFCatalogFilterOptions](structs/pfcatalogfilteroptions.md) | PFCatalogFilterOptions data model. |  
| [PFCatalogGetDraftItemRequest](structs/pfcataloggetdraftitemrequest.md) | PFCatalogGetDraftItemRequest data model. |  
| [PFCatalogGetDraftItemResponse](structs/pfcataloggetdraftitemresponse.md) | PFCatalogGetDraftItemResponse data model. |  
| [PFCatalogGetDraftItemsRequest](structs/pfcataloggetdraftitemsrequest.md) | PFCatalogGetDraftItemsRequest data model. |  
| [PFCatalogGetDraftItemsResponse](structs/pfcataloggetdraftitemsresponse.md) | PFCatalogGetDraftItemsResponse data model. |  
| [PFCatalogGetEntityDraftItemsRequest](structs/pfcataloggetentitydraftitemsrequest.md) | PFCatalogGetEntityDraftItemsRequest data model. |  
| [PFCatalogGetEntityDraftItemsResponse](structs/pfcataloggetentitydraftitemsresponse.md) | PFCatalogGetEntityDraftItemsResponse data model. |  
| [PFCatalogGetEntityItemReviewRequest](structs/pfcataloggetentityitemreviewrequest.md) | PFCatalogGetEntityItemReviewRequest data model. |  
| [PFCatalogGetEntityItemReviewResponse](structs/pfcataloggetentityitemreviewresponse.md) | PFCatalogGetEntityItemReviewResponse data model. |  
| [PFCatalogGetItemContainersRequest](structs/pfcataloggetitemcontainersrequest.md) | PFCatalogGetItemContainersRequest data model. Given an item, return a set of bundles and stores containing the item. |  
| [PFCatalogGetItemContainersResponse](structs/pfcataloggetitemcontainersresponse.md) | PFCatalogGetItemContainersResponse data model. |  
| [PFCatalogGetItemPublishStatusRequest](structs/pfcataloggetitempublishstatusrequest.md) | PFCatalogGetItemPublishStatusRequest data model. |  
| [PFCatalogGetItemPublishStatusResponse](structs/pfcataloggetitempublishstatusresponse.md) | PFCatalogGetItemPublishStatusResponse data model. |  
| [PFCatalogGetItemRequest](structs/pfcataloggetitemrequest.md) | PFCatalogGetItemRequest data model. |  
| [PFCatalogGetItemResponse](structs/pfcataloggetitemresponse.md) | PFCatalogGetItemResponse data model. Get item result. |  
| [PFCatalogGetItemReviewsRequest](structs/pfcataloggetitemreviewsrequest.md) | PFCatalogGetItemReviewsRequest data model. |  
| [PFCatalogGetItemReviewsResponse](structs/pfcataloggetitemreviewsresponse.md) | PFCatalogGetItemReviewsResponse data model. |  
| [PFCatalogGetItemReviewSummaryRequest](structs/pfcataloggetitemreviewsummaryrequest.md) | PFCatalogGetItemReviewSummaryRequest data model. |  
| [PFCatalogGetItemReviewSummaryResponse](structs/pfcataloggetitemreviewsummaryresponse.md) | PFCatalogGetItemReviewSummaryResponse data model. |  
| [PFCatalogGetItemsRequest](structs/pfcataloggetitemsrequest.md) | PFCatalogGetItemsRequest data model. |  
| [PFCatalogGetItemsResponse](structs/pfcataloggetitemsresponse.md) | PFCatalogGetItemsResponse data model. |  
| [PFCatalogImage](structs/pfcatalogimage.md) | PFCatalogImage data model. |  
| [PFCatalogImageConfig](structs/pfcatalogimageconfig.md) | PFCatalogImageConfig data model. |  
| [PFCatalogKeywordSet](structs/pfcatalogkeywordset.md) | PFCatalogKeywordSet data model. |  
| [PFCatalogKeywordSetDictionaryEntry](structs/pfcatalogkeywordsetdictionaryentry.md) | Dictionary entry for an associative array with PFCatalogKeywordSet values. |  
| [PFCatalogModerationState](structs/pfcatalogmoderationstate.md) | PFCatalogModerationState data model. |  
| [PFCatalogPublishDraftItemRequest](structs/pfcatalogpublishdraftitemrequest.md) | PFCatalogPublishDraftItemRequest data model. The call kicks off a workflow to publish the item to the public catalog. The Publish Status API should be used to monitor the publish job. |  
| [PFCatalogRating](structs/pfcatalograting.md) | PFCatalogRating data model. |  
| [PFCatalogReportItemRequest](structs/pfcatalogreportitemrequest.md) | PFCatalogReportItemRequest data model. |  
| [PFCatalogReportItemReviewRequest](structs/pfcatalogreportitemreviewrequest.md) | PFCatalogReportItemReviewRequest data model. Submit a report for an inappropriate review, allowing the submitting user to specify their concern. |  
| [PFCatalogReview](structs/pfcatalogreview.md) | PFCatalogReview data model. |  
| [PFCatalogReviewItemRequest](structs/pfcatalogreviewitemrequest.md) | PFCatalogReviewItemRequest data model. |  
| [PFCatalogReviewTakedown](structs/pfcatalogreviewtakedown.md) | PFCatalogReviewTakedown data model. |  
| [PFCatalogSearchItemsRequest](structs/pfcatalogsearchitemsrequest.md) | PFCatalogSearchItemsRequest data model. |  
| [PFCatalogSearchItemsResponse](structs/pfcatalogsearchitemsresponse.md) | PFCatalogSearchItemsResponse data model. |  
| [PFCatalogStoreDetails](structs/pfcatalogstoredetails.md) | PFCatalogStoreDetails data model. |  
| [PFCatalogStoreReference](structs/pfcatalogstorereference.md) | PFCatalogStoreReference data model. |  
| [PFCatalogSubmitItemReviewVoteRequest](structs/pfcatalogsubmititemreviewvoterequest.md) | PFCatalogSubmitItemReviewVoteRequest data model. |  
| [PFCatalogUpdateDraftItemRequest](structs/pfcatalogupdatedraftitemrequest.md) | PFCatalogUpdateDraftItemRequest data model. |  
| [PFCatalogUpdateDraftItemResponse](structs/pfcatalogupdatedraftitemresponse.md) | PFCatalogUpdateDraftItemResponse data model. |  
| [PFCatalogUploadInfo](structs/pfcataloguploadinfo.md) | PFCatalogUploadInfo data model. |  
| [PFCatalogUploadUrlMetadata](structs/pfcataloguploadurlmetadata.md) | PFCatalogUploadUrlMetadata data model. |  
| [PFCatalogUserGeneratedContentSpecificConfig](structs/pfcatalogusergeneratedcontentspecificconfig.md) | PFCatalogUserGeneratedContentSpecificConfig data model. |  
  
## State changes  
  
| State change | Description |  
| --- | --- |  
  
## Enumerations  

| Enumeration | Description |  
| --- | --- |  
| [PFCatalogConcernCategory](enums/pfcatalogconcerncategory.md) | ConcernCategory enum.|  
| [PFCatalogDisplayPropertyType](enums/pfcatalogdisplaypropertytype.md) | DisplayPropertyType enum.|  
| [PFCatalogHelpfulnessVote](enums/pfcataloghelpfulnessvote.md) | HelpfulnessVote enum.|  
| [PFCatalogModerationStatus](enums/pfcatalogmoderationstatus.md) | ModerationStatus enum.|  
| [PFCatalogPublishResult](enums/pfcatalogpublishresult.md) | PublishResult enum.|  
