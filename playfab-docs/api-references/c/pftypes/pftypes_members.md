---
author: jasonsandlin
title: "Services C API overview - PFTypes.h"
description: "Services C API overview - PFTypes.h"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# Services C API overview - PFTypes.h

  
## Structures  

| Structure | Description |  
| --- | --- |  
| [PFAdCampaignAttributionModel](structs/pfadcampaignattributionmodel.md) | PFAdCampaignAttributionModel data model. |  
| [PFCharacterInventory](structs/pfcharacterinventory.md) | PFCharacterInventory data model. |  
| [PFCharacterResult](structs/pfcharacterresult.md) | PFCharacterResult data model. |  
| [PFContactEmailInfoModel](structs/pfcontactemailinfomodel.md) | PFContactEmailInfoModel data model. |  
| [PFDateTimeDictionaryEntry](structs/pfdatetimedictionaryentry.md) | Dictionary entry for an associative array with time_t values. |  
| [PFEntityKey](structs/pfentitykey-c.md) | PFEntityKey data model. Combined entity type and ID structure which uniquely identifies a single entity. |  
| [PFEntityKeyDictionaryEntry](structs/pfentitykeydictionaryentry.md) | Dictionary entry for an associative array with PFEntityKey values. |  
| [PFEntityLineage](structs/pfentitylineage.md) | PFEntityLineage data model. |  
| [PFEntityLineageDictionaryEntry](structs/pfentitylineagedictionaryentry.md) | Dictionary entry for an associative array with PFEntityLineage values. |  
| [PFGetPlayerCombinedInfoRequestParams](structs/pfgetplayercombinedinforequestparams.md) | PFGetPlayerCombinedInfoRequestParams data model. |  
| [PFGetPlayerCombinedInfoResultPayload](structs/pfgetplayercombinedinforesultpayload.md) | PFGetPlayerCombinedInfoResultPayload data model. |  
| [PFInt32DictionaryEntry](structs/pfint32dictionaryentry.md) | Dictionary entry for an associative array with int32_t values. |  
| [PFItemInstance](structs/pfiteminstance.md) | PFItemInstance data model. A unique instance of an item in a user's inventory. Note, to retrieve additional information for an item such as Tags, Description that are the same across all instances of the item, a call to GetCatalogItems is required. The ItemID of can be matched to a catalog entry, which contains the additional information. Also note that Custom Data is only set when the User's specific instance has updated the CustomData via a call to UpdateUserInventoryItemCustomData. Other fields such as UnitPrice and UnitCurrency are only set when the item was granted via a purchase. |  
| [PFJsonObject](structs/pfjsonobject.md) | String representation of a Json Object |  
| [PFLinkedPlatformAccountModel](structs/pflinkedplatformaccountmodel.md) | PFLinkedPlatformAccountModel data model. |  
| [PFLocationModel](structs/pflocationmodel.md) | PFLocationModel data model. |  
| [PFMembershipModel](structs/pfmembershipmodel.md) | PFMembershipModel data model. |  
| [PFPlayerProfileModel](structs/pfplayerprofilemodel.md) | PFPlayerProfileModel data model. |  
| [PFPlayerProfileViewConstraints](structs/pfplayerprofileviewconstraints.md) | PFPlayerProfileViewConstraints data model. |  
| [PFPushNotificationRegistrationModel](structs/pfpushnotificationregistrationmodel.md) | PFPushNotificationRegistrationModel data model. |  
| [PFStatisticModel](structs/pfstatisticmodel.md) | PFStatisticModel data model. |  
| [PFStatisticValue](structs/pfstatisticvalue.md) | PFStatisticValue data model. |  
| [PFStringDictionaryEntry](structs/pfstringdictionaryentry.md) | Dictionary entry for an associative array with string values. |  
| [PFSubscriptionModel](structs/pfsubscriptionmodel.md) | PFSubscriptionModel data model. |  
| [PFTagModel](structs/pftagmodel.md) | PFTagModel data model. |  
| [PFTreatmentAssignment](structs/pftreatmentassignment.md) | PFTreatmentAssignment data model. |  
| [PFUint32DictionaryEntry](structs/pfuint32dictionaryentry.md) | Dictionary entry for an associative array with uint32_t values. |  
| [PFUserAccountInfo](structs/pfuseraccountinfo.md) | PFUserAccountInfo data model. |  
| [PFUserAndroidDeviceInfo](structs/pfuserandroiddeviceinfo.md) | PFUserAndroidDeviceInfo data model. |  
| [PFUserAppleIdInfo](structs/pfuserappleidinfo.md) | PFUserAppleIdInfo data model. |  
| [PFUserCustomIdInfo](structs/pfusercustomidinfo.md) | PFUserCustomIdInfo data model. |  
| [PFUserDataRecord](structs/pfuserdatarecord.md) | PFUserDataRecord data model. |  
| [PFUserDataRecordDictionaryEntry](structs/pfuserdatarecorddictionaryentry.md) | Dictionary entry for an associative array with PFUserDataRecord values. |  
| [PFUserFacebookInfo](structs/pfuserfacebookinfo.md) | PFUserFacebookInfo data model. |  
| [PFUserFacebookInstantGamesIdInfo](structs/pfuserfacebookinstantgamesidinfo.md) | PFUserFacebookInstantGamesIdInfo data model. |  
| [PFUserGameCenterInfo](structs/pfusergamecenterinfo.md) | PFUserGameCenterInfo data model. |  
| [PFUserGoogleInfo](structs/pfusergoogleinfo.md) | PFUserGoogleInfo data model. |  
| [PFUserGooglePlayGamesInfo](structs/pfusergoogleplaygamesinfo.md) | PFUserGooglePlayGamesInfo data model. |  
| [PFUserIosDeviceInfo](structs/pfuseriosdeviceinfo.md) | PFUserIosDeviceInfo data model. |  
| [PFUserKongregateInfo](structs/pfuserkongregateinfo.md) | PFUserKongregateInfo data model. |  
| [PFUserNintendoSwitchAccountIdInfo](structs/pfusernintendoswitchaccountidinfo.md) | PFUserNintendoSwitchAccountIdInfo data model. |  
| [PFUserNintendoSwitchDeviceIdInfo](structs/pfusernintendoswitchdeviceidinfo.md) | PFUserNintendoSwitchDeviceIdInfo data model. |  
| [PFUserOpenIdInfo](structs/pfuseropenidinfo.md) | PFUserOpenIdInfo data model. |  
| [PFUserPrivateAccountInfo](structs/pfuserprivateaccountinfo.md) | PFUserPrivateAccountInfo data model. |  
| [PFUserPsnInfo](structs/pfuserpsninfo.md) | PFUserPsnInfo data model. |  
| [PFUserServerCustomIdInfo](structs/pfuserservercustomidinfo.md) | PFUserServerCustomIdInfo data model. |  
| [PFUserSteamInfo](structs/pfusersteaminfo.md) | PFUserSteamInfo data model. |  
| [PFUserTitleInfo](structs/pfusertitleinfo.md) | PFUserTitleInfo data model. |  
| [PFUserTwitchInfo](structs/pfusertwitchinfo.md) | PFUserTwitchInfo data model. |  
| [PFUserXboxInfo](structs/pfuserxboxinfo.md) | PFUserXboxInfo data model. |  
| [PFValueToDateModel](structs/pfvaluetodatemodel.md) | PFValueToDateModel data model. |  
| [PFVariable](structs/pfvariable.md) | PFVariable data model. |  
| [PFVirtualCurrencyRechargeTime](structs/pfvirtualcurrencyrechargetime.md) | PFVirtualCurrencyRechargeTime data model. |  
| [PFVirtualCurrencyRechargeTimeDictionaryEntry](structs/pfvirtualcurrencyrechargetimedictionaryentry.md) | Dictionary entry for an associative array with PFVirtualCurrencyRechargeTime values. |  
  
## State changes  
  
| State change | Description |  
| --- | --- |  
  
## Enumerations  

| Enumeration | Description |  
| --- | --- |  
| [PFContinentCode](enums/pfcontinentcode.md) | ContinentCode enum.|  
| [PFCountryCode](enums/pfcountrycode.md) | CountryCode enum.|  
| [PFCurrency](enums/pfcurrency.md) | Currency enum.|  
| [PFEmailVerificationStatus](enums/pfemailverificationstatus.md) | EmailVerificationStatus enum.|  
| [PFLoginIdentityProvider](enums/pfloginidentityprovider.md) | LoginIdentityProvider enum.|  
| [PFOperationTypes](enums/pfoperationtypes.md) | OperationTypes enum.|  
| [PFPushNotificationPlatform](enums/pfpushnotificationplatform.md) | PushNotificationPlatform enum.|  
| [PFSubscriptionProviderStatus](enums/pfsubscriptionproviderstatus.md) | SubscriptionProviderStatus enum.|  
| [PFTitleActivationStatus](enums/pftitleactivationstatus.md) | TitleActivationStatus enum.|  
| [PFUserDataPermission](enums/pfuserdatapermission.md) | UserDataPermission enum.|  
| [PFUserOrigination](enums/pfuserorigination.md) | UserOrigination enum.|  
