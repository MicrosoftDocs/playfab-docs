# Getting started with Bumblelion Private Preview

## Share Location
Please download the XBox ERA and Win32/Win10 libraries at:
\\scratch2\scratch\Bumblelion\Bumblelion_1PP_Preview\ 

## Release Notes
-	*Region Restrictions.* Bumblelion’s API is documented to support selecting the lowest latency region for a new network by passing an empty/null list of CofaRegions to CreateNewNetwork. This is currently not implemented. As well, the `CofaManager::GetRegions` and `RegionsChanged` state change are not implemented. For the time being when you create a new network please just pass a hardcoded CofaRegion list.

```
CofaRegion regionList[] = {
    // Hard-coded region
    {
        "WestUS", // region name 
        0         // round trip latency
    },
};    

RETURN_IF_FAILED(CofaManager::GetSingleton().CreateNewNetwork(
    buildId,
    localUser,
    &networkConfiguration,
    _countof(regionList),
    regionList,
    _countof(userIdentifiers),
    userIdentifiers,
    asyncIdentifier,
    &newNetworkDescriptor));
    
```
    
-	*Handling LNM Audio Devices.* Prior to launching your title, you will need to have users signed in and paired to a controller and headset, otherwise audio will not flow.
-	*Shared Pool.* We are currently limited to 200 active Bumblelion networks across all Wave 1 developers. Don’t be greedy! ;)


