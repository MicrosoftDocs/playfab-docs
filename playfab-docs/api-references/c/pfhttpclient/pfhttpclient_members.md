---
author: jasonsandlin
title: "Services C API overview - PFHttpClient.h"
description: "Services C API overview - PFHttpClient.h"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# Services C API overview - PFHttpClient.h

  
## Functions  

| Function | Description |  
| --- | --- |  
| [PFHCGetLibVersion](functions/pfhcgetlibversion.md) | Returns the version of the library. |  
| [PFHCGetWebSocketConnectResult](functions/pfhcgetwebsocketconnectresult.md) | Gets the result for PFHCGetWebSocketConnectResult. |  
| [PFHCGetWebSocketSendMessageResult](functions/pfhcgetwebsocketsendmessageresult.md) | Gets the result from PFHCWebSocketSendMessage. |  
| [PFHCHttpCallCloseHandle](functions/pfhchttpcallclosehandle.md) | Decrements the reference count on the call object. |  
| [PFHCHttpCallCreate](functions/pfhchttpcallcreate.md) | Creates an HTTP call handle. |  
| [PFHCHttpCallGetRequestUrl](functions/pfhchttpcallgetrequesturl.md) | Gets the request url for the HTTP call. |  
| [PFHCHttpCallPerformAsync](functions/pfhchttpcallperformasync.md) | Perform HTTP call using the PFHCCallHandle. |  
| [PFHCHttpCallRequestEnableGzipCompression](functions/pfhchttpcallrequestenablegzipcompression.md) | Enable GZIP compression on the provided body payload. |  
| [PFHCHttpCallRequestSetHeader](functions/pfhchttpcallrequestsetheader.md) | Set a request header for the HTTP call. |  
| [PFHCHttpCallRequestSetRequestBodyBytes](functions/pfhchttpcallrequestsetrequestbodybytes.md) | Set the request body bytes of the HTTP call. This API operation is mutually exclusive with PFHCHttpCallRequestSetRequestBodyReadFunction and will result in any custom read callbacks that were previously set on this call handle to be ignored. |  
| [PFHCHttpCallRequestSetRequestBodyReadFunction](functions/pfhchttpcallrequestsetrequestbodyreadfunction.md) | Sets a custom callback function that will be used to read the request body when the HTTP call is performed. If a custom read callback is used, any request body data previously set by PFHCHttpCallRequestSetRequestBodyBytes or PFHCHttpCallRequestSetRequestBodyString is ignored making these API operations mutually exclusive. |  
| [PFHCHttpCallRequestSetRequestBodyString](functions/pfhchttpcallrequestsetrequestbodystring.md) | Set the request body string of the HTTP call. This API operation is mutually exclusive with PFHCHttpCallRequestSetRequestBodyReadFunction and will result in any custom read callbacks that were previously set on this call handle to be ignored. |  
| [PFHCHttpCallRequestSetRetryAllowed](functions/pfhchttpcallrequestsetretryallowed.md) | Sets if retry is allowed for this HTTP call. |  
| [PFHCHttpCallRequestSetRetryCacheId](functions/pfhchttpcallrequestsetretrycacheid.md) | ID number of this REST endpoint used to cache the Retry-After header for fast fail. |  
| [PFHCHttpCallRequestSetRetryDelay](functions/pfhchttpcallrequestsetretrydelay.md) | Sets the HTTP retry delay in seconds. The default and minimum delay is 2 seconds. |  
| [PFHCHttpCallRequestSetSSLValidation](functions/pfhchttpcallrequestsetsslvalidation.md) | Enables or disables SSL server certificate validation for this specific HTTP call. |  
| [PFHCHttpCallRequestSetTimeout](functions/pfhchttpcallrequestsettimeout.md) | Sets the timeout for this HTTP call. |  
| [PFHCHttpCallRequestSetTimeoutWindow](functions/pfhchttpcallrequestsettimeoutwindow.md) | Sets the HTTP timeout window in seconds. |  
| [PFHCHttpCallRequestSetUrl](functions/pfhchttpcallrequestseturl.md) | Sets the url and method for the HTTP call. |  
| [PFHCHttpCallResponseGetHeader](functions/pfhchttpcallresponsegetheader.md) | Get a response header for the HTTP call for a given header name. |  
| [PFHCHttpCallResponseGetHeaderAtIndex](functions/pfhchttpcallresponsegetheaderatindex.md) | Gets the response headers at specific zero based index in the HTTP call. |  
| [PFHCHttpCallResponseGetNetworkErrorCode](functions/pfhchttpcallresponsegetnetworkerrorcode.md) | Get the network error code of the HTTP call. |  
| [PFHCHttpCallResponseGetNumHeaders](functions/pfhchttpcallresponsegetnumheaders.md) | Gets the number of response headers in the HTTP call. |  
| [PFHCHttpCallResponseGetPlatformNetworkErrorMessage](functions/pfhchttpcallresponsegetplatformnetworkerrormessage.md) | Get the platform network error message of the HTTP call. |  
| [PFHCHttpCallResponseGetResponseBodyBytes](functions/pfhchttpcallresponsegetresponsebodybytes.md) | Get the response body buffer of the HTTP call. This API operation will fail if a custom write callback was set on this call handle using PFHCHttpCallResponseSetResponseBodyWriteFunction. |  
| [PFHCHttpCallResponseGetResponseBodyBytesSize](functions/pfhchttpcallresponsegetresponsebodybytessize.md) | Get the response body buffer size of the HTTP call. This API operation will fail if a custom write callback was set on this call handle using PFHCHttpCallResponseSetResponseBodyWriteFunction. |  
| [PFHCHttpCallResponseGetResponseString](functions/pfhchttpcallresponsegetresponsestring.md) | Get the response body string of the HTTP call. This API operation will fail if a custom write callback was set on this call handle using PFHCHttpCallResponseSetResponseBodyWriteFunction. |  
| [PFHCHttpCallResponseGetStatusCode](functions/pfhchttpcallresponsegetstatuscode.md) | Get the HTTP status code of the HTTP call response. |  
| [PFHCHttpCallResponseSetResponseBodyWriteFunction](functions/pfhchttpcallresponsesetresponsebodywritefunction.md) | Sets a custom callback function that will be used to write the response body when the HTTP call is performed. Using a custom write callback will cause subsequent calls to PFHCHttpCallResponseGetResponseBodyBytesSize, PFHCHttpCallResponseGetResponseBodyBytes, and PFHCHttpCallGetResponseBodyString to fail as these are mutually exclusive. |  
| [PFHCHttpCallSetTracing](functions/pfhchttpcallsettracing.md) | Enables or disables tracing for this specific HTTP call. |  
| [PFHCHttpDisableAssertsForSSLValidationInDevSandboxes](functions/pfhchttpdisableassertsforsslvalidationindevsandboxes.md) | Disables asserts for SSL validation in console dev sandboxes. |  
| [PFHCIsInitialized](functions/pfhcisinitialized.md) | Returns true if library has been initialized by PFHCInitialize |  
| [PFHCMemGetFunctions](functions/pfhcmemgetfunctions.md) | Gets the memory hook functions to allow callers to control route memory allocations to their own memory manager. |  
| [PFHCMemSetFunctions](functions/pfhcmemsetfunctions.md) | Optionally sets the memory hook functions to allow callers to control route memory allocations to their own memory manager. |  
| [PFHCRemoveCallRoutedHandler](functions/pfhcremovecallroutedhandler.md) | Removes a previously added PFHCCallRoutedHandler. |  
| [PFHCRemoveWebSocketRoutedHandler](functions/pfhcremovewebsocketroutedhandler.md) | Removes a previously added PFHCWebSocketRoutedHandler. |  
| [PFHCSetGlobalProxy](functions/pfhcsetglobalproxy.md) | Manually sets an explicit proxy address. |  
| [PFHCWebSocketCloseHandle](functions/pfhcwebsocketclosehandle.md) | Decrements the reference count on the WebSocket object. |  
| [PFHCWebSocketConnectAsync](functions/pfhcwebsocketconnectasync.md) | Connects to the WebSocket. |  
| [PFHCWebSocketCreate](functions/pfhcwebsocketcreate.md) | Creates an WebSocket handle. |  
| [PFHCWebSocketDisconnect](functions/pfhcwebsocketdisconnect.md) | Disconnects / closes the WebSocket. |  
| [PFHCWebSocketGetBinaryMessageFragmentEventFunction](functions/pfhcwebsocketgetbinarymessagefragmenteventfunction.md) | Gets the WebSocket binary message fragment handler. |  
| [PFHCWebSocketGetEventFunctions](functions/pfhcwebsocketgeteventfunctions.md) | Gets the WebSocket functions to allow callers to respond to incoming messages and WebSocket close events. |  
| [PFHCWebSocketSendBinaryMessageAsync](functions/pfhcwebsocketsendbinarymessageasync.md) | Send binary message to the WebSocket. |  
| [PFHCWebSocketSendMessageAsync](functions/pfhcwebsocketsendmessageasync.md) | Send message the WebSocket |  
| [PFHCWebSocketSetBinaryMessageFragmentEventFunction](functions/pfhcwebsocketsetbinarymessagefragmenteventfunction.md) | Set the binary message fragment handler. The client functionContext passed to PFHCWebSocketCreate will also be passed to this handler. |  
| [PFHCWebSocketSetHeader](functions/pfhcwebsocketsetheader.md) | Set a header for the WebSocket. |  
| [PFHCWebSocketSetMaxReceiveBufferSize](functions/pfhcwebsocketsetmaxreceivebuffersize.md) | Configures how large the WebSocket receive buffer is allowed to grow before passing messages to clients. If a single message exceeds the maximum buffer size, the message will be broken down and passed to clients via multiple calls to the PFHCWebSocketMessageFunction. The default value is 20kb. |  
| [PFHCWebSocketSetProxyDecryptsHttps](functions/pfhcwebsocketsetproxydecryptshttps.md) | Allows proxy server to decrypt and inspect traffic; should be used only for debugging purposes This must be called after calling PFHCWebSocketSetProxyUri. Only applies to Win32 non-GDK builds |  
| [PFHCWebSocketSetProxyUri](functions/pfhcwebsocketsetproxyuri.md) | Set the proxy URI for the WebSocket. |  
  
## Structures  

| Structure | Description |  
| --- | --- |  
| [PFHCInitArgs](structs/pfhcinitargs.md) | Deprecated. Not needed. |  
| [PFWebSocketCompletionResult](structs/pfwebsocketcompletionresult.md) | Used by PFHCWebSocketConnectAsync() and PFHCWebSocketSendMessageAsync(). |  
  
## State changes  
  
| State change | Description |  
| --- | --- |  
  
## Enumerations  

| Enumeration | Description |  
| --- | --- |  
| [PFHCCompressionLevel](enums/pfhccompressionlevel.md) | Defines the compression level that will be used on the compression algorithm. Lower levels perform less compression but have the highest speed in the compression and higher levels perform better compression but have the slowest speed in the compression.|  
| [PFHCConfigSetting](enums/pfhcconfigsetting.md) | Defines the config settings value that is passed to the below API's.|  
