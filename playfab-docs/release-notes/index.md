# PlayFab Release Notes 2018

## 181105

Date: 2018-11-05

**API Changes:**

* PlayFab now supports login and account-linking with OpenID
* Additional XboxLive ID support, and enabling Xbox login via server

In preparation for wider release of the service, we are rolling out PlayFab Multiplayer Servers 2.0 APIs. See http://aka.ms/PlayFabMultiplayer for more information

## 181001

Date: 2018-10-01

**API Changes:**

* A variety of deprecations have taken effect, and those elements have been removed from SDKs and documentation
    * Some Admin API methods related to unreleased features have been hidden
    * server.DeleteUsers deprecation has taken effect
    * A field deprecation for "ServerHostname", spread across a variety of matchmaking related calls in admin, client, matchmaker, and server APIs has taken effect. "ServerIPV4Address" is the replacement.

**UnitySdk Changes:**

* Minor fixes/improvements to ScreenTime analytics

**All SDKs:**

* The automated-build branch structure for GitHub repos is changing
    * The normal customer facing branches, "versioned" and "master" will be unchanged

## 180924

Date: 2018-09-24

**API Changes:**

* Adding Metadata to the [DeleteMasterPlayerAccountRequest](https://api.playfab.com/documentation/Admin/datatype/PlayFab.Admin.Models/PlayFab.Admin.Models.DeleteMasterPlayerAccountRequest) Model
* Bug fixes in the Unreal Marketplace Plugin to expand supported versions

## 180917  

Date: 2018-09-17

**API Changes:**

* [Server API](https://api.playfab.com/documentation/server): Method [DeleteUsers](https://api.playfab.com/documentation/server/method/DeleteUsers) is deprecated and replaced with [DeletePlayer](https://api.playfab.com/documentation/server/method/DeletePlayer)
* Unreal Marketplace Plugin:
    * Updated Marketplace Plugin to include our Blueprint interface
    * [New Marketplace Getting Started Guide](https://api.playfab.com/docs/getting-started/unreal-mkpl-getting-started)
    * [View in Unreal Marketplace](https://www.unrealengine.com/marketplace/playfab-sdk)
    * [Upgrade Guide](https://api.playfab.com/docs/getting-started/unreal-mkpl-getting-started/mkpl-upgrade)

## 180906  

Date: 2018-09-06

**New API:**

* [Localization](https://api.playfab.com/documentation/Localization)

**New PlayStream Event Documentation:**

* [client_focus_change](https://api.playfab.com/playstream/events/client_focus_change)
* [client_session_start](https://api.playfab.com/playstream/events/client_session_start)
* [player_device_info](https://api.playfab.com/playstream/events/player_device_info)

## 180829  

Date: 2018-08-29

**API Changes:**

* renaming Entity.TypeString to Entity.Type
* renaming EmptyResult to [EmptyResponse](https://api.playfab.com/documentation/groups/datatype/PlayFab.groups.Models/PlayFab.groups.Models.EmptyResponse)
* Renamed most Authentication function calls like GameServer* to MutliplayerServer*
* [Admin.GetUserAccountInfo](https://api.playfab.com/documentation/admin/method/GetUserAccountInfo) has more detailed platform information

**Objective C Specific Changes:**

* various bug fixes and refactors
* Changing AttributeInstallRequest to be api specific

**Unreal Engine Specific Changes:**

* adding in UE marketplace plugin to SDK generator

## 180809  

Date: 2018-08-09

**API Group Changes:**

* We have separated the Entity API Group into multiple new Api Groups
* This is a big SDK Breaking change for anybody using the former Entity Api
* See our [Blog!](https://api.playfab.com/blog/entity-api-group-restructure)
* See our [Upgrade Guide!](https://api.playfab.com/docs/entityapi-upgrade)
* (Please note, the links for blog and upgrade guide may not work yet, they're almost done)

**API Changes:**

* **New Api Methods :**
  * The following APIs are released and visible in SDKs, but the accompanying documentation isn't ready yet:
    * client.[LoginWithNintendoSwitchDeviceId](https://api.playfab.com/documentation/client/method/LoginWithNintendoSwitchDeviceId)
    * client.[UnlinkNintendoSwitchDeviceId](https://api.playfab.com/documentation/client/method/UnlinkNintendoSwitchDeviceId)
    * server.[GetPlayFabIDsFromNintendoSwitchDeviceIds](https://api.playfab.com/documentation/server/method/GetPlayFabIDsFromNintendoSwitchDeviceIds)
    * client.[LoginWithFacebookInstantGamesId](https://api.playfab.com/documentation/client/method/LoginWithFacebookInstantGamesId) (not ready to use yet)
    * client.[UnlinkFacebookInstantGamesId](https://api.playfab.com/documentation/client/method/UnlinkFacebookInstantGamesId) (not ready to use yet)
    * server.[GetPlayFabIDsFromFacebookInstantGamesIds](https://api.playfab.com/documentation/server/method/GetPlayFabIDsFromFacebookInstantGamesIds) (not ready to use yet)
* **New PlayStream Events**
  * title_hopper_config_updated event renamed to [title_queue_config_updated](https://api.playfab.com/playstream/events/title_queue_config_updated)
* **General changes**
  * The parameter "ServerAddress" in many models has been deprecated in favor of the new "ServerIPV4Address"

**Unreal (multiple SDKs) Specific Changes:**

* Minor updates to both SDKs/plugins leading to a final merge to the Marketplace plugin (Coming soon!)

**[PythonSdk!](https://github.com/PlayFab/PythonSdk) Specific Changes:**

* Bugfixes and improvements

**[UnitySdk](https://github.com/PlayFab/UnitySDK) and [CSharpSDK](https://github.com/PlayFab/CSharpSDK) Specific Changes:**

* Added a new structure called Plugin Manager. For now, this is just a foundation for future changes. Some old function signatures have been marked as obsolete, and should be updated. (No breaking changes though)
* Found and resolved multiple issues with HTTPS.Put, which makes Entity Files more accessible on more platforms.
* Bugfixes in the ScreenTime feature

## 180716  

Date: 2018-07-16

**[UnitySdk](https://github.com/PlayFab/UnitySDK) Changes:**

* Fixed minor issues with ScreenTime under some rare circumstances

**[CSharpSDK](https://github.com/PlayFab/CSharpSDK) Changes:**

* Added [Plugin Manager API](https://github.com/PlayFab/CSharpSDK/blob/master/PluginManager.md) to C# SDK to support optional custom implementations of JSON Serializer and HTTP client

**[UnrealCppSdk](https://github.com/PlayFab/UnrealCppSdk):**

* Unreal 4 C++ SDK is also published on [Unreal Marketplace!](https://www.unrealengine.com/marketplace/playfab-sdk)

## 180710  

Date: 2018-07-10

**Unity Hotfix Release:**

* Further refinements and optimizations to the Screen-Time events

## 180709  

Date: 2018-07-09

**Hotfix Release:**

* Fixing some minor issues with last week's deployments
* Everything in last week's release notes should now actually work as promised

## 180706

Date: 2018-07-06

**API Changes:**

* **New API Method:**
 * entity.[WriteEvents](https://api.playfab.com/documentation/Events/method/WriteEvents)

**[UnitySdk](https://github.com/PlayFab/UnitySDK) Specific Changes:**

* Screen-time tracking, described in the previous release is no longer Beta-only

## 180705  

Date: 2018-07-05

**API Changes:**

* EntityAPI.[ExecuteEntityCloudScript](https://api.playfab.com/documentation/cloudscript/method/ExecuteEntityCloudScript)
* PlayStreamEventModel.[title_hopper_config_updated](https://api.playfab.com/playstream/events/title_hopper_config_updated)

**New [PythonSdk!](https://github.com/PlayFab/PythonSdk)**

* tested with 2.7

**[UnitySdk](https://github.com/PlayFab/UnitySDK) Changes:**

* Wrapped some utilities in a namespace to avoid 3rd party conflicts
* Editor Extensions should misbehave less, and display fewer warnings
* New Feature - read [the blog](https://api.playfab.com/blog/sessions-preview-is-live)

**[JavaScriptSDK](https://github.com/PlayFab/JavaScriptSDK) Changes:**

* customData relay parameter should now work for Login functions

**[XPlatCppSdk](https://github.com/PlayFab/XPlatCppSdk) Specific Changes:**

* Large results will now be parsed correctly

## 180618  

Date: 2018-06-18

**API Changes:**

* Added new error codes in a variety of API methods
* Multiple entity-related PlayStream events now describe their [EntityLineage](https://api.playfab.com/playstream/events/datatype/EntityLineage)

## 180528  

Date: 2018-05-28

**API Changes:**

* **New API Methods:**
 * Admin.[GetPlayedTitleList](https://api.playfab.com/documentation/admin/method/GetPlayedTitleList)
 * Admin.[DeleteMasterPlayerAccount](https://api.playfab.com/documentation/admin/method/DeleteMasterPlayerAccount)
 * Admin.[ExportMasterPlayerData](https://api.playfab.com/documentation/admin/method/ExportMasterPlayerData)
 * This is a part of the new GDPR launch. See our blog [here](https://blog.playfab.com/blog/gdpr)
* Updated Error codes in a variety of API methods
* New PlayStream Event:
 * [player_data_exported](https://api.playfab.com/playstream/events/player_data_exported)

## 180514  

Date: 2018-05-14

**[XPlatCppSdk](https://github.com/PlayFab/XPlatCppSdk) Specific Changes:**

* Fixes in JSON serialization

## 180507  

Date: 2018-05-07

**API Changes:**

* **New API Method:**
  * entity.[GetProfiles](https://api.playfab.com/documentation/Profiles/method/GetProfiles)
* **New PlayStream Events:**
  * [entity_executed_cloud_script](https://api.playfab.com/playstream/events/entity_executed_cloud_script)
* **Updated API Method:**
  * client.[RegisterPlayFabUser](https://api.playfab.com/documentation/client/method/RegisterPlayFabUser) now returns [result](https://api.playfab.com/documentation/client/datatype/PlayFab.client.Models/PlayFab.client.Models.RegisterPlayFabUserResult).[EntityToken](https://api.playfab.com/documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.EntityTokenResponse)

**[UnitySdk](https://github.com/PlayFab/UnitySDK) Specific Changes:**

* HttpWebRequest certificate validation security has been improved
 * No longer default to ignoring all certificates
 * Customers are expected to implement their own certificate validation, or call PlayFab.Internal.PlayFabWebRequest.SkipCertificateValidation()

**[WindowsSdk](https://github.com/PlayFab/WindowsSDK) Specific Changes:**

* Fixed hundreds of Level 4 warnings
* The version number published in PlayFabSettings.cpp has been corrected
 * Most previous versions will have all had the wrong version number embedded in-code, and in call headers

**[XPlatCppSdk](https://github.com/PlayFab/XPlatCppSdk) has been created:**

* Currently in beta
 * Built using WindowsSdk as a template
 * May become a replacement to WindowsSdk (At least several months away)
 * Upgrade should require almost no breaking changes
  * Some cpprestsdk strings should be converted to std::string
  * some web::json::value types have been converted to json::value
 * timestamps are not fully tested in Linux
* NuGet package
* Uses lighter weight dependencies
 * Specifically jsoncpp and curl, rather than cpprestsdk
 * uses std::string everywhere, rather than a mix of 2 string types
* Adds Linux Support

## 180414  

Date: 2018-04-14

**[UnrealCppSdk](https://github.com/PlayFab/UnrealCppSdk) HotFix:**

* Issues were discovered in the Entity API release for [UnrealCppSdk](https://github.com/PlayFab/UnrealCppSdk). These are hotfixed, and the Entity API should now work as expected.

## 180409  

Date: 2018-04-09

**API Changes:**

* **HotFix:**
  * Only the date was updated, not the major/minor version numbers
* **Guilds:**
  * client.[GetAccountInfo](https://api.playfab.com/documentation/client/method/GetAccountInfo).[UserInfo](https://api.playfab.com/documentation/client/datatype/PlayFab.Server.Models/PlayFab.Client.Models.UserAccountInfo).[TitleInfo](https://api.playfab.com/documentation/client/datatype/PlayFab.Server.Models/PlayFab.Client.Models.UserTitleInfo).[TitlePlayerAccount](https://api.playfab.com/documentation/client/datatype/PlayFab.Server.Models/PlayFab.Client.Models.EntityKey) now contains the required information to identify other players and add them to your guild/group
  * The same information can also be found with admin.[GetUserAccountInfo](https://api.playfab.com/documentation/admin/method/GetUserAccountInfo) and server.[GetUserAccountInfo](https://api.playfab.com/documentation/server/method/GetUserAccountInfo)

**[UnitySdk](https://github.com/PlayFab/UnitySDK) Specific Changes:**

* Performance improvement for default HTTP settings (UnityWWW), for long-running processes

## 180403  

Date: 2018-04-03

**Unreal SDKs Updated to support v4.17 thru 4.19:**

* Removing support for UE 4.14 thru 4.16 (Please update!)

## 180329  

Date: 2018-03-29

**Unreal SDKs Updated to support Entity APIs:**

* Sorry for the delay!
* This release still targets UE 4.17, and not 4.18 or 4.19. We are in-progress working on updating versions

## 180316  

Date: 2018-03-16

**API Changes:**

* Entities! [Blog](https://api.playfab.com/blog/introducing-entities-objects-and-files)! [Guide](https://api.playfab.com/docs/tutorials/entities/getting-started-entities)!
 * All Client login methods return Entity credentials if request.LoginTitlePlayerAccountEntity is set to true
* Guilds! [Blog](https://api.playfab.com/blog/announcing-groups-for-guilds-friends-clans-and-more)! [Guide](https://api.playfab.com/docs/tutorials/entities/entity-groups)!
* Error Codes for many API methods updated for accuracy (Dozens!)

**New API Methods:**

* admin.[RevokeInventoryItems](https://api.playfab.com/documentation/admin/method/RevokeInventoryItems) and server.[RevokeInventoryItems](https://api.playfab.com/documentation/server/method/RevokeInventoryItems)
* A whole new [Entity API](https://api.playfab.com/documentation/entity)
* Many new [Entity PlayStream Events](https://api.playfab.com/playstream/events) (search for "entity" on linked page)

**Most SDKs Updated to support Entity APIs:**

* **Full Support:**
 * [UnitySdk](https://github.com/PlayFab/UnitySDK)
 * [JavaScriptSDK](https://github.com/PlayFab/JavaScriptSDK)
 * [ActionScriptSDK](https://github.com/PlayFab/ActionScriptSDK)
 * [CSharpSDK](https://github.com/PlayFab/CSharpSDK)
 * [NodeSDK](https://github.com/PlayFab/NodeSDK)
 * [PostmanCollection](https://github.com/PlayFab/PostmanCollection)
 * [WindowsSDK](https://github.com/PlayFab/WindowsSDK)
 * [Cocos2d-xSDK](https://github.com/PlayFab/Cocos2d-xSDK)
 * [JavaSDK](https://github.com/PlayFab/JavaSDK)
 * [LuaSdk](https://github.com/PlayFab/LuaSDK) (Including Corona and Defold)
 * [PhpSdk](https://github.com/PlayFab/PhpSdk)
 * Cloud Script
* **Will Support Soon:** Unreal Bp and Cpp (Sorry, delayed due to technical difficulties!)

## 180213  

Date: 2018-02-13

**API Changes:**

* SendAccountRecoveryEmail now supports custom account recovery email templates when a custom account recovery email template ID is passed in with the request parameters.
* All Client Login Mechanisms can now optionally return Entity API credentials
(This is part of a coming-soon feature)

**[UnitySdk](https://github.com/PlayFab/UnitySDK) Specific Changes:**

* We are dropping support for older Unity versions, see our [blog post](https://blog.playfab.com/blog/unity-version-support)
* Build files are now published using Unity version 2017.3.0f3

## 180131  

Date: 2018-01-31

**[JavaSDK](https://github.com/PlayFab/JavaSDK) Changes:**

* Java is now published to Maven

## 180129  

Date: 2018-01-29

**[UnitySdk](https://github.com/PlayFab/UnitySDK) Specific Changes:**

* Fixing issues with compression
* It should be safe to re-enable compression for all versions and all platforms

## 180123  

Date: 2018-01-23

**[UnitySdk](https://github.com/PlayFab/UnitySDK) Hotfix:**

* PlayFab UnitySDK had an issue with Unity version 2017.1
* See the [forum post](https://community.playfab.com/questions/16734/error-cs1061-no-definition-for-sendwebrequesterror.html) for details
* This has been resolved, PlayFab UnitySDK should work for all versions again

## 180122  

Date: 2018-01-22

**API Documentation Update:**

* Error codes updated on many API methods

**[CSharpSDK](https://github.com/PlayFab/CSharpSDK) and UnitySDK Specific Changes:**

* Adding a PlayFabException class, so that it's easier to catch PlayFab specific exceptions.

**[NodeSDK](https://github.com/PlayFab/NodeSDK) Specific Changes:**

* SDK Breaking Change: Require syntax for NodeSDK NPM package changed
* Major upgrade focused on NPM package
* Formerly require statements did not follow the NPM convention, requiring multiple nonstandard require statements
* Now it requires a single require statement, and follows NPM conventions
* Major version number changed, this release is now 2.0
* 1.x to 2.x [Upgrade Guide](https://github.com/PlayFab/NodeSDK/blob/master/upgrade.md)

**Cloud Script Example:**

* Added TypeScript definitions for the API Error exceptions

## 180103

Date: 2018-01-03

**[LuaSdk](https://github.com/PlayFab/LuaSDK)/Defold/Corona Specific Updates:**

* Bugfix update
* Some platforms were producing a malformed URL which could not be resolved

## 180102  

Date: 2018-01-02

**[UnitySdk](https://github.com/PlayFab/UnitySDK) Specific Updates:**

* Bugfix update
* In order to avoid an issue with response headers, compression should be disabled for all device builds. This update makes that possible
* Alternately, switching to Web Request will also avoid the issue
* A new HTTP option has been added for Unity versions > 2017
