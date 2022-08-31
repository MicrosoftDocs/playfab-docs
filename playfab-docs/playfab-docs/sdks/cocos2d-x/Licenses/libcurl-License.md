---
title: libcurl License
author: joannaleecy
description: License for libcurl
ms.author: joanlee
ms.date: 02/19/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, libcurl, sdk, cocos
ms.localizationpriority: medium
---

# License Mixing with apps, libcurl, and Third Party Libraries

libcurl can be built to use a fair amount of various third party libraries, libraries that are written and provided by other parties that are distributed
using their own licenses. Even libcurl itself contains code that may cause problems to some. This document attempts to describe what licenses libcurl and
the other libraries use and what possible dilemmas linking and mixing them all can lead to for end users.

I am not a lawyer and this is not legal advice!

One common dilemma is that GPL[1]-licensed code is not allowed to be linked with code licensed under the Original BSD license (with the announcement clause). You may still build your own copies that use them all, but distributing them as binaries would be to violate the GPL license - unless you accompany your license with an exception[2]. This particular problem was
addressed when the Modified BSD license was created, which does not have the announcement clause that collides with GPL.

[libcurl](https://curl.haxx.se/docs/copyright.html)

   Uses an MIT (or Modified BSD)-style license that is as liberal as possible.

[OpenSSL](https://www.openssl.org/source/license.html)

   (May be used for SSL/TLS support) Uses an Original BSD-style license with an announcement clause that makes it "incompatible" with GPL. You are not allowed to ship binaries that link with OpenSSL that includes GPL code (unless that specific GPL code includes an exception for OpenSSL - a habit that is growing more and more common). If OpenSSL's licensing is a problem for you, consider using another TLS library.

[GnuTLS](https://www.gnutls.org/)

   (May be used for SSL/TLS support) Uses the LGPL[3] license. If this is a problem for you, consider using another TLS library. Also note that GnuTLS itself depends on and uses other libs (libgcrypt and libgpg-error) and they too are LGPL- or GPL-licensed.

[WolfSSL](https://www.wolfssl.com/)

   (May be used for SSL/TLS support) Uses the GPL[1] license or a proprietary license. If this is a problem for you, consider using another TLS library.

[NSS](https://developer.mozilla.org/docs/Mozilla/Projects/NSS)

   (May be used for SSL/TLS support) Is covered by the MPL[4] license, the GPL[1] license and the LGPL[3] license. You may choose to license the code under MPL terms, GPL terms, or LGPL terms. These licenses grant you different permissions and impose different obligations. You should select the license that best meets your needs.

[axTLS](http://axtls.sourceforge.net/)

   (May be used for SSL/TLS support) Uses a Modified BSD-style license.

[mbedTLS](https://tls.mbed.org/)

   (May be used for SSL/TLS support) Uses the GPL[1] license or a proprietary license. If this is a problem for you, consider using another TLS library.

[BoringSSL](https://boringssl.googlesource.com/)

   (May be used for SSL/TLS support) As an OpenSSL fork, it has the same license as that.

[libressl](https://www.libressl.org/)

   (May be used for SSL/TLS support) As an OpenSSL fork, it has the same license as that.

<!--[c-ares](https://daniel.haxx.se/projects/c-ares/license.html)

   (Used for asynchronous name resolves) Uses an MIT license that is very liberal and imposes no restrictions on any other library or part you may link with.-->

[zlib](https://www.zlib.net/zlib_license.html)

   (Used for compressed Transfer-Encoding support) Uses an MIT-style license that shouldn't collide with any other library.

[MIT Kerberos](https://web.mit.edu/kerberos/www/dist/)

   (May be used for GSS support) MIT licensed, that shouldn't collide with any other parts.

[Heimdal](https://heimdalsecurity.com)

   (May be used for GSS support) Heimdal is Original BSD licensed with the announcement clause.

[GNU GSS](https://www.gnu.org/software/gss/)

   (May be used for GSS support) GNU GSS is GPL licensed. Note that you may not distribute binary curl packages that uses this if you build curl to also link and use any Original BSD licensed libraries!

[libidn](https://josefsson.org/libidn/)

   (Used for IDNA support) Uses the GNU Lesser General Public License [3]. LGPL is a variation of GPL with slightly less aggressive "copyleft". This license requires more requirements to be met when distributing binaries, see the license for details. Also note that if you distribute a binary that includes this library, you must also include the full LGPL license text. Please properly point out what parts of the distributed package that the license addresses.

[OpenLDAP](https://www.openldap.org/software/release/license.html)

   (Used for LDAP support) Uses a Modified BSD-style license. Since libcurl uses OpenLDAP as a shared library only, I have not heard of anyone that ships OpenLDAP linked with libcurl in an app.

[libssh2](https://www.libssh2.org/)

   (Used for scp and sftp support) libssh2 uses a Modified BSD-style license.

[1] = GPL - GNU General Public License: https://www.gnu.org/licenses/gpl.html   
[2] = https://www.gnu.org/licenses/gpl-faq.html#GPLIncompatibleLibs details on writing an exception to the GPL.   
[3] = LGPL - GNU Lesser General Public License: https://www.gnu.org/licenses/lgpl.html   
[4] = MPL - Mozilla Public License: https://www.mozilla.org/MPL/
