---
title: PlayFab Party port usage and firewall requirements
description: Details on PlayFab Party chat and data communication port usage and firewall configuration requirements.
author: fschober-atg
ms.author: fschober
ms.date: 09/03/2021
ms.topic: article
ms.service: azure-playfab
ROBOTS: NOINDEX,NOFOLLOW
keywords: playfab, multiplayer, networking
---

# PlayFab Party port usage, firewall and packet size requirements

This topic provides details about Azure PlayFab Party port usage, firewall and packet size requirements that are needed to enable chat and data communication.

## Communication Patterns

Azure PlayFab Party uses two communication patterns:

 1. HTTPS communication, which is initiated from the API caller to multiple cloud web services, including *playfabapi.com*.

 2. UDP socket-based secure communication with transparent cloud relay servers, and other peer devices (if supported).

If either pattern is blocked, early PlayFab Party API operations or automatic notifications such as the initial [`PartyRegionsChangedStateChange`](reference/structs/partyregionschangedstatechange.md) will report [`PartyStateChangeResult::InternetConnectivityError`](reference/enums/partystatechangeresult.md).

For web service request issues, other necessary PlayFab and platform operations outside of Party such as the user login functions would also likely fail. These failures are often caused by local firewall restrictions or proxy requirements for HTTPS connections. Most issues can be resolved by enabling direct, outbound HTTPS communication to cloud web services from the local device or network.

## HTTPS Domain Names

Microsoft Azure PlayFab Party performs UDP and HTTPS connections to multiple cloud services. To ensure correct functionality, environments that filter HTTPS traffic based on domain name need to ensure the following names or name patterns are accessible:

HTTPS connectivity:
* *\*.playfabapi.com*
* *\*.speech.microsoft.com*
* *api.cognitive.microsofttranslator.com*

This list of domain names can change without notice. Check this list regularly and expect changes.

## MTU and packet sizes

Azure PlayFab Party automatically performs fragmentation and reassembly to fit large application messages within environmental packet size limits. Some network environments can still cause communication failures despite this functionality.

PlayFab Party currently expects environments to support a Maximum Transmission Unit (MTU) size of at least 1419 bytes to avoid poor performance or potential connectivity failures. This MTU size is supported in typical environments. Virtual Private Networks (VPNs), IPv4/IPv6 tunneling, or explicit administrative configuration might reduce the MTU size in one or both directions of the network path between the Party client, service, or other clients.

If the MTU supported end-to-end in a given environment is insufficient, the [`PartyManager::ConnectToNetwork`](reference/classes/partymanager/methods/partymanager_connecttonetwork.md) operation may fail with [`PartyStateChangeResult::InternetConnectivityError`](reference/enums/partystatechangeresult.md). Alternatively, connectivity may succeed but the device may encounter unnecessary latency, packet loss, or unexpected disconnections.

Some platforms provide tools for end users, developers, or Internet Service Providers to help troubleshoot MTU configuration in their environments that should be used if possible.

## Local device UDP port usage

By default, the PlayFab Party library will bind its UDP socket to an available local port dynamically assigned by the OS for most platforms. An exception is Microsoft Game Core where PlayFab Party will default to binding to that platform’s "preferred local UDP multiplayer port".

Titles can alter this behavior to bind to a specific local port number or to an OS-selected available port other than the Microsoft Game Core "preferred local UDP multiplayer port" by setting the [`PartyOption::LocalUdpSocketBindAddress`](reference/enums/partyoption.md) option prior to calling [`PartyManager::Initialize()`](reference/classes/partymanager/methods/partymanager_initialize.md). If the requested port is already in use in your title or by another application on the device, either [`PartyManager::Initialize()`](reference/classes/partymanager/methods/partymanager_initialize.md) will report an error immediately, or the initial [`PartyRegionsChangedStateChange`](reference/structs/partyregionschangedstatechange.md) will report a [`PartyStateChangeResult::FailedToBindToLocalUdpSocket`](reference/enums/partystatechangeresult.md) error and asynchronous network creation or connection operations will fail.

Titles are recommended to use the default local port selection behavior for maximum, configuration-free compatibility unless specifically requested by the end user for an environment-specific reason. You may have additional platform-specific requirements if your title uses non-default values. You should consult each platform’s documentation for guidance on port usage.

PlayFab Party communication always requires outbound-initiated packets and their subsequent replies to be permitted from this selected local UDP port to remote destinations described in the next section. Network administrators should follow Internet standard best practices for firewalls and Network Address Translation (NAT) such as in [RFC 4787 - "Network Address Translation (NAT) Behavioral Requirements for Unicast UDP"](https://datatracker.ietf.org/doc/html/rfc4787) for maximum compatibility. This is especially important for titles that are using direct peer-to-peer connections for a Party network, since environments with only minimal support might allow connecting to the network but prevent establishing that direct communication from one device to another.

## Remote IP addresses and UDP ports

Microsoft Azure PlayFab Party provides dynamically-scaled services across multiple regions to offer the best latency to users. This means there is no permanent remote destination hostname, IP address, or port that can be referenced by network administrators interested in strict communication constraints.

Microsoft provides weekly updates of an IP address range list for Azure that is [available for download](https://www.microsoft.com/download/details.aspx?id=56519). This list can be useful if a continually-synchronized policy is feasible to restrict local network traffic. In most cases, the ongoing maintenance of this list is a challenge and prone to subtle connectivity failures. Also, for direct peer-to-peer connections within a Party network the remote client IP addresses also have to be known and enabled for connectivity. For these reasons we recommend firewalls not restrict remote IP address connectivity.

The supported remote port range that may be in use by Azure PlayFab Party can be any ports other than the Internet Assigned Numbers Authority (IANA) reserved range of 0-1023. Currently transparent cloud relays will only be assigned port numbers from 30000-65535, but Microsoft reserves the right to change this behavior in the future. As a best practice, the port range of 1024-65535 should be used. This is particularly important for titles that are using direct peer-to-peer connections for a Party network, since NAT implementations will typically assign ports from this range. Blocking remote ports other than the full recommended range may also prevent direct communication.

To enable UDP connectivity, environments that filter UDP traffic based on domain name need to ensure the following names or name patterns are accessible:

* *\*.cloudapp.azure.com*

Filtering remote IP addresses for UDP connectivity via domain name resolution is possible but strongly discouraged. Currently all connections to transparent cloud relay servers will resolve names of the form *\*.cloudapp.azure.com*, but this pattern is subject to change without notice. Restricting UDP connectivity to only IP addresses resolved by names will also prevent direct peer-to-peer connection.

## See also

[PlayFab Party and direct peer-to-peer connections](concepts-direct-peer-connectivity.md)
