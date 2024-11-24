#!/bin/bash
 
# ======= Question 1 - OpenSSL =======
# Please provide the full commands as well as any outputs in this file, and
# submit it along with the PDF file containing the answers to other questions.

# Commands should be provided on new lines; output should be included as
# comments. You can write a comment by prefacing it with a # symbol

# Example Command:
echo 'Hello world'
# Example Output:
# Hello world

# Example Command:
openssl help
# Example Output:
# help:
#
# Standard commands
# asn1parse         ca                ciphers           cmp
# cms               crl               crl2pkcs7         dgst
# dhparam           dsa               dsaparam          ec
# ecparam           enc               engine            errstr
# [...and so on]

# If you used any resources to complete the questions, please list them at the bottom of the file, and include a [1],
# [2] etc. next to the relevant question's answer/output.
# For example, if you used https://www.example.com to answer Q1.a, you would write:
# Q1.a Output [1]
# OpenSSL 1.1.1
# and then at the bottom of the file:
# [1] https://www.example.com

# ======= Please provide your answers below: ========
# Q1.a Command:
openssl version
# Q1.a Output
#OpenSSL 3.2.3 3 Sep 2024 (Library: OpenSSL 3.2.3 3 Sep 2024)

# Q1.b Command:
openssl sha1 crypto1.zip.enc && openssl sha1 crypto2.zip.enc
# Q1.b Output [1]
#SHA1(crypto1.zip.enc)= 8ca275a98312ab337e6c0dbacb9c4675d0043b28
#SHA1(crypto2.zip.enc)= 8c28283f4357858919ae316f8bb7bfcc7e8b2f1a

# Q1.c Command:
openssl aes-256-cbc -d -in crypto1.zip.enc -out crypto1decrypted.zip -pass pass:cryptorulez -pbkdf2

# Q1.c Output [2]
# outputs file crypto1decrypted.zip

# Q1.d Command:
openssl rand -base64 -out randvalue.txt 16
# Q1.d Output [3]
# ouputs 16 bytes of random text in base64 to randvalue.txt

# Q1.e Command:
openssl pkeyutl -encrypt -inkey public-key.pem -pubin -in randvalue.txt | openssl base64
# Q1.e Output [4]
#ZWPnO9oeespKm3ha5m524cgHUPDZ/1PvrvhhASHkPiANVDqvba1t4dDbeU4eYMs6JWq+yE33UMUheNPr0qzXlygzezvFsj4B9Cl1aQuv0GFSNjC8OhSBM1dVphmF3bkM5BfnYtpFAD6604ks4hXzpUx6pO8EnYxIepMjW0e+9M7vtBDJmqRCJzDhdGqgVu2a2Xim9DLPHho/pHEIuo2jWLiEDV5GN9PbB7RxXPhuKcAH8ek5TvjLz5UxjPg7NU0qhMEJV58XQKF5yMiSP3ZcwM95BBkMV/p6Qvz+r8g6OXU0G9daMB4CVCzJEe1+t6+BzPfWS68THnZ0CmzFu8sY/w==

# Q1.f Command:
openssl ts -reply -in key_ts.tsr -text
# Q1.f Output [5]
# Using configuration from C:/Program Files/Git/mingw64/etc/ssl/openssl.cnf
#Status info:
#Status: Granted.
#Status description: unspecified
#Failure info: unspecified

#TST info:
#Version: 1
#Policy OID: 2.16.840.1.114412.7.1
#Hash Algorithm: sha256
#Message data:
#    0000 - 8a 8b 0f c7 a2 23 de c7-ee 24 57 df 1d ce 96 37   .....#...$W....7
#    0010 - f3 44 24 27 a8 58 23 9f-66 0e 28 18 25 f1 91 58   .D$'.X#.f.(.%..X
#Serial number: 0x213F5219044348D192F8982D9F5AD2B2
#Time stamp: Nov  8 11:21:36 2024 GMT
#Accuracy: unspecified
#Ordering: no
#Nonce: unspecified
#TSA: unspecified
#Extensions:


# Q1.g Answers
# When  was  the  timestamp  created?
# Nov  8 11:21:36 2024 GMT
# What  does  that  imply  about  the  key  file?
# This tells us how long the key has been in use i.e. from the 8th of november

# Q1.h Command:
openssl ts -verify -data public-key.pem -in key_ts.tsr -CAfile DigiCertAssuredIDRootCA.crt.pem
# Q1.h Output [5]
#Using configuration from C:/Program Files/Git/mingw64/etc/ssl/openssl.cnf
#Verification: OK


# Q1.i Commands:
openssl x509 -in cert1.pem -text
openssl x509 -in cert2.pem -text
openssl x509 -in cert3.pem -text
# Q1.i Output [6]
#Certificate:
#   Data:
#        Version: 3 (0x2)
#        Serial Number:
#            4a:e7:95:49:fa:9a:be:3f:10:0f:17:a4:78:e1:69:09
#        Signature Algorithm: sha256WithRSAEncryption
#        Issuer: C=GB, ST=Greater Manchester, L=Salford, O=COMODO CA Limited, CN=COMODO RSA Domain Validation Secure Server CA
#        Validity
#            Not Before: Apr  9 00:00:00 2015 GMT
#            Not After : Apr 12 23:59:59 2015 GMT
#        Subject: OU=Domain Control Validated, OU=PositiveSSL Wildcard, CN=*.badssl.com
#        Subject Public Key Info:
#            Public Key Algorithm: rsaEncryption
#                Public-Key: (2048 bit)
#                Modulus:
#                    00:c2:04:ec:f8:8c:ee:04:c2:b3:d8:50:d5:70:58:
#                    cc:93:18:eb:5c:a8:68:49:b0:22:b5:f9:95:9e:b1:
#                    2b:2c:76:3e:6c:c0:4b:60:4c:4c:ea:b2:b4:c0:0f:
#                    80:b6:b0:f9:72:c9:86:02:f9:5c:41:5d:13:2b:7f:
#                    71:c4:4b:bc:e9:94:2e:50:37:a6:67:1c:61:8c:f6:
#                    41:42:c5:46:d3:16:87:27:9f:74:eb:0a:9d:11:52:
#                    26:21:73:6c:84:4c:79:55:e4:d1:6b:e8:06:3d:48:
#                    15:52:ad:b3:28:db:aa:ff:6e:ff:60:95:4a:77:6b:
#                    39:f1:24:d1:31:b6:dd:4d:c0:c4:fc:53:b9:6d:42:
#                    ad:b5:7c:fe:ae:f5:15:d2:33:48:e7:22:71:c7:c2:
#                    14:7a:6c:28:ea:37:4a:df:ea:6c:b5:72:b4:7e:5a:
#                    a2:16:dc:69:b1:57:44:db:0a:12:ab:de:c3:0f:47:
#                    74:5c:41:22:e1:9a:f9:1b:93:e6:ad:22:06:29:2e:
#                    b1:ba:49:1c:0c:27:9e:a3:fb:8b:f7:40:72:00:ac:
#                    92:08:d9:8c:57:84:53:81:05:cb:e6:fe:6b:54:98:
#                    40:27:85:c7:10:bb:73:70:ef:69:18:41:07:45:55:
#                    7c:f9:64:3f:3d:2c:c3:a9:7c:eb:93:1a:4c:86:d1:
#                    ca:85
#                Exponent: 65537 (0x10001)
#        X509v3 extensions:
#            X509v3 Authority Key Identifier:
#                90:AF:6A:3A:94:5A:0B:D8:90:EA:12:56:73:DF:43:B4:3A:28:DA:E7
#            X509v3 Subject Key Identifier:
#                9D:EE:C1:7B:81:0B:3A:47:69:71:18:7D:11:37:93:BC:A5:1B:3F:FB
#            X509v3 Key Usage: critical
#                Digital Signature, Key Encipherment
#            X509v3 Basic Constraints: critical
#               CA:FALSE
#            X509v3 Extended Key Usage:
#                TLS Web Server Authentication, TLS Web Client Authentication
#            X509v3 Certificate Policies:
#                Policy: 1.3.6.1.4.1.6449.1.2.2.7
#                  CPS: https://secure.comodo.com/CPS
#                Policy: 2.23.140.1.2.1
#            X509v3 CRL Distribution Points:
#                Full Name:
#                  URI:http://crl.comodoca.com/COMODORSADomainValidationSecureServerCA.crl
#            Authority Information Access:
#                CA Issuers - URI:http://crt.comodoca.com/COMODORSADomainValidationSecureServerCA.crt
#                OCSP - URI:http://ocsp.comodoca.com
#            X509v3 Subject Alternative Name:
#                DNS:*.badssl.com, DNS:badssl.com
#    Signature Algorithm: sha256WithRSAEncryption
#    Signature Value:
#        6a:7a:f1:da:ff:03:07:72:78:c5:66:a1:4f:46:43:0e:5f:14:
#        21:8c:75:1a:eb:36:e0:1f:a4:10:15:ec:da:33:25:7c:3b:b5:
#        0a:c7:01:38:3d:27:fd:58:d9:cc:ea:2d:69:39:7c:be:97:ef:
#        0b:d6:0b:58:e7:8c:7f:bf:b3:4c:1d:f3:b7:90:80:a6:36:7c:
#        14:5b:ec:07:2d:02:3e:1b:5b:63:5b:15:ab:00:fa:1f:3b:19:
#        2d:df:e2:23:10:11:07:7e:72:7f:e2:bf:b7:00:1b:98:2f:2c:
#        3f:ce:85:9a:27:8c:10:22:08:41:2b:8a:3e:82:4e:fc:dd:21:
#        c6:56:74:70:a4:34:f2:b1:40:9e:2b:58:a2:59:0f:1d:48:ef:
#        eb:11:3e:c1:4a:9e:bc:65:55:6d:c6:a3:ef:d5:d4:96:cd:f1:
#        ae:27:f7:a4:57:14:3c:94:41:05:7a:8b:a1:37:47:d7:f5:7d:
#        dc:fa:ce:6f:31:a2:b0:8c:ea:cc:12:9b:22:f1:34:70:cf:7d:
#        75:4a:8b:68:29:0c:1e:e9:96:a8:cf:b0:12:1f:5c:2a:ee:67:
#        2f:7f:bd:73:f3:5a:01:22:0c:70:fa:cd:45:ef:78:5c:ce:0d:
#        fa:4e:e1:ef:ce:65:9f:47:0c:4f:bb:36:44:68:56:5c:56:59:
#        ad:aa:8a:bc
#-----BEGIN CERTIFICATE-----
#MIIFSzCCBDOgAwIBAgIQSueVSfqavj8QDxekeOFpCTANBgkqhkiG9w0BAQsFADCB
#kDELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4G
#A1UEBxMHU2FsZm9yZDEaMBgGA1UEChMRQ09NT0RPIENBIExpbWl0ZWQxNjA0BgNV
#BAMTLUNPTU9ETyBSU0EgRG9tYWluIFZhbGlkYXRpb24gU2VjdXJlIFNlcnZlciBD
#QTAeFw0xNTA0MDkwMDAwMDBaFw0xNTA0MTIyMzU5NTlaMFkxITAfBgNVBAsTGERv
#bWFpbiBDb250cm9sIFZhbGlkYXRlZDEdMBsGA1UECxMUUG9zaXRpdmVTU0wgV2ls
#ZGNhcmQxFTATBgNVBAMUDCouYmFkc3NsLmNvbTCCASIwDQYJKoZIhvcNAQEBBQAD
#ggEPADCCAQoCggEBAMIE7PiM7gTCs9hQ1XBYzJMY61yoaEmwIrX5lZ6xKyx2PmzA
#S2BMTOqytMAPgLaw+XLJhgL5XEFdEyt/ccRLvOmULlA3pmccYYz2QULFRtMWhyef
#dOsKnRFSJiFzbIRMeVXk0WvoBj1IFVKtsyjbqv9u/2CVSndrOfEk0TG23U3AxPxT
#uW1CrbV8/q71FdIzSOciccfCFHpsKOo3St/qbLVytH5aohbcabFXRNsKEqveww9H
#dFxBIuGa+RuT5q0iBikusbpJHAwnnqP7i/dAcgCskgjZjFeEU4EFy+b+a1SYQCeF
#xxC7c3DvaRhBB0VVfPlkPz0sw6l865MaTIbRyoUCAwEAAaOCAdUwggHRMB8GA1Ud
#IwQYMBaAFJCvajqUWgvYkOoSVnPfQ7Q6KNrnMB0GA1UdDgQWBBSd7sF7gQs6R2lx
#GH0RN5O8pRs/+zAOBgNVHQ8BAf8EBAMCBaAwDAYDVR0TAQH/BAIwADAdBgNVHSUE
#FjAUBggrBgEFBQcDAQYIKwYBBQUHAwIwTwYDVR0gBEgwRjA6BgsrBgEEAbIxAQIC
#BzArMCkGCCsGAQUFBwIBFh1odHRwczovL3NlY3VyZS5jb21vZG8uY29tL0NQUzAI
#BgZngQwBAgEwVAYDVR0fBE0wSzBJoEegRYZDaHR0cDovL2NybC5jb21vZG9jYS5j
#b20vQ09NT0RPUlNBRG9tYWluVmFsaWRhdGlvblNlY3VyZVNlcnZlckNBLmNybDCB
#hQYIKwYBBQUHAQEEeTB3ME8GCCsGAQUFBzAChkNodHRwOi8vY3J0LmNvbW9kb2Nh
#LmNvbS9DT01PRE9SU0FEb21haW5WYWxpZGF0aW9uU2VjdXJlU2VydmVyQ0EuY3J0
#MCQGCCsGAQUFBzABhhhodHRwOi8vb2NzcC5jb21vZG9jYS5jb20wIwYDVR0RBBww
#GoIMKi5iYWRzc2wuY29tggpiYWRzc2wuY29tMA0GCSqGSIb3DQEBCwUAA4IBAQBq
#evHa/wMHcnjFZqFPRkMOXxQhjHUa6zbgH6QQFezaMyV8O7UKxwE4PSf9WNnM6i1p
#OXy+l+8L1gtY54x/v7NMHfO3kICmNnwUW+wHLQI+G1tjWxWrAPofOxkt3+IjEBEH
#fnJ/4r+3ABuYLyw/zoWaJ4wQIghBK4o+gk783SHGVnRwpDTysUCeK1iiWQ8dSO/r
#ET7BSp68ZVVtxqPv1dSWzfGuJ/ekVxQ8lEEFeouhN0fX9X3c+s5vMaKwjOrMEpsi
#8TRwz311SotoKQwe6Zaoz7ASH1wq7mcvf71z81oBIgxw+s1F73hczg36TuHvzmWf
#RwxPuzZEaFZcVlmtqoq8
#-----END CERTIFICATE-----
#
#Certificate:
#    Data:
#        Version: 3 (0x2)
#        Serial Number:
#            04:cb:2e:dc:a6:bf:6d:9a:50:79:ac:4a:10:d6:c1:59:7c:06
#        Signature Algorithm: sha256WithRSAEncryption
#        Issuer: C=US, O=Let's Encrypt, CN=R11
#        Validity
#            Not Before: Nov  6 16:37:15 2024 GMT
#            Not After : Feb  4 16:37:14 2025 GMT
#        Subject: CN=*.badssl.com
#        Subject Public Key Info:
#            Public Key Algorithm: rsaEncryption
#               Public-Key: (2048 bit)
#                Modulus:
#                    00:a3:45:49:ee:e1:91:5d:18:8d:90:00:e4:91:89:
#                    00:b8:b8:0e:6c:d5:4a:c2:44:f1:ab:7e:94:33:6a:
#                    12:ff:ef:e5:7c:bb:e7:c2:50:90:1d:21:ea:7f:76:
#                    6f:c2:da:40:3c:34:0d:02:6d:d6:0a:fd:70:b3:0b:
#                    7c:33:c4:27:31:6b:38:9a:eb:d2:a2:d1:37:f0:c8:
#                  07:c4:61:54:2f:57:9f:8d:c1:a8:41:17:fd:ef:b5:
#                    ea:33:7d:70:ac:c6:9f:5d:98:7d:50:b8:66:3a:67:
#                    30:04:73:b1:87:4b:5a:c7:23:48:f0:6e:5f:e1:f4:
#                    d2:c1:5a:b3:3d:4a:36:76:52:3a:70:8b:58:21:5b:
#                    a7:e0:15:cb:4d:8f:81:eb:34:17:11:8e:ac:32:28:
#                    ca:da:39:6d:f3:22:32:e6:ab:de:ab:4c:d4:9c:96:
#                    a2:40:17:e3:e3:b7:e9:f1:4f:18:28:02:ef:60:fb:
#                    16:b0:23:cf:e4:a6:51:be:bb:53:8e:5b:fb:45:da:
#                    b2:47:49:96:82:60:ce:9e:02:c8:2a:18:b8:e6:8b:
#                    9f:77:49:8b:cd:16:29:ef:b0:84:fc:f8:0c:7f:9e:
#                    bb:c0:5d:61:19:f3:07:b6:a9:18:76:24:70:01:d4:
#                    6a:e6:3a:7b:43:62:62:c6:19:c7:5a:53:93:18:39:
#                    88:81
#                Exponent: 65537 (0x10001)
#        X509v3 extensions:
#            X509v3 Key Usage: critical
#                Digital Signature, Key Encipherment
#            X509v3 Extended Key Usage:
#                TLS Web Server Authentication, TLS Web Client Authentication
#            X509v3 Basic Constraints: critical
#                CA:FALSE
#            X509v3 Subject Key Identifier:
#                C1:CF:C8:88:3F:5C:50:AB:C2:BF:AB:44:29:67:B3:CC:63:E6:AF:10
#            X509v3 Authority Key Identifier:
#                C5:CF:46:A4:EA:F4:C3:C0:7A:6C:95:C4:2D:B0:5E:92:2F:26:E3:B9
#            Authority Information Access:
#                OCSP - URI:http://r11.o.lencr.org
#                CA Issuers - URI:http://r11.i.lencr.org/
#            X509v3 Subject Alternative Name:
#                DNS:*.badssl.com, DNS:badssl.com
#            X509v3 Certificate Policies:
#                Policy: 2.23.140.1.2.1
#            CT Precertificate SCTs:
#                Signed Certificate Timestamp:
#                    Version   : v1 (0x0)
#                    Log ID    : A2:E3:0A:E4:45:EF:BD:AD:9B:7E:38:ED:47:67:77:53:
#                                D7:82:5B:84:94:D7:2B:5E:1B:2C:C4:B9:50:A4:47:E7
#                    Timestamp : Nov  6 17:35:45.739 2024 GMT
#                    Extensions: none
#                    Signature : ecdsa-with-SHA256
#                                30:44:02:20:52:73:CF:DA:2B:EE:DA:51:CF:86:93:CA:
#                                5F:8D:52:B8:5F:3C:4F:F7:24:34:44:FE:3A:00:CB:F2:
#                                28:89:1D:76:02:20:2B:28:3B:48:A5:5E:22:F4:C9:91:
#                                C0:49:44:DF:07:04:A1:41:66:59:1D:22:14:9B:8A:EB:
#                                E5:29:E4:25:B7:46
#                Signed Certificate Timestamp:
#                    Version   : v1 (0x0)
#                    Log ID    : E6:D2:31:63:40:77:8C:C1:10:41:06:D7:71:B9:CE:C1:
#                                D2:40:F6:96:84:86:FB:BA:87:32:1D:FD:1E:37:8E:50
#                    Timestamp : Nov  6 17:35:45.747 2024 GMT
#                    Extensions: none
#                    Signature : ecdsa-with-SHA256
#                                30:45:02:21:00:97:C5:0F:6D:DA:D8:1E:A4:31:21:97:
#                                30:9F:95:A3:4B:A5:FE:E2:F2:24:36:60:57:8A:79:EB:
#                                60:8E:5F:50:A3:02:20:1C:DC:F9:34:90:0A:20:4D:3E:
#                                A8:46:F9:A9:3D:67:67:BE:54:DC:77:4A:B2:1A:68:CD:
#                                93:8F:2A:7C:D8:11:F5
#    Signature Algorithm: sha256WithRSAEncryption
#    Signature Value:
#        3f:c1:25:05:f4:be:38:b8:5a:ae:41:d4:56:eb:04:f5:4a:45:
#        72:4d:35:d3:d2:b7:71:d1:65:16:bc:f3:65:3e:c7:4d:2f:8c:
#        86:89:bc:76:77:49:5a:24:57:58:22:fb:94:46:44:5f:94:0d:
#        22:1f:8c:08:2b:fb:6e:9d:c3:28:01:7e:fa:86:d7:66:77:d7:
#        56:56:33:38:3f:c5:95:f0:cd:30:c6:c9:f9:2d:9d:24:1d:05:
#        92:19:6a:ba:66:3f:32:e1:24:85:e3:ab:4b:1a:b6:15:b6:45:
#        fb:dd:b1:a2:66:b0:01:9d:50:5b:ff:d0:10:df:aa:94:55:29:
#        61:c7:d8:b7:1f:b9:72:10:66:8e:a4:88:da:dc:3e:cc:68:ec:
#        f2:66:f9:84:62:81:d6:86:46:3f:a3:98:4b:36:d2:4e:c3:a7:
#        88:af:b3:15:66:9b:ab:60:ab:4e:be:4a:1d:ee:d5:19:ec:16:
#        a5:1f:90:6f:20:1c:34:cf:ba:e3:9a:fe:0e:0c:9e:10:55:9e:
#        b7:4b:f9:70:82:eb:7f:1a:b3:f9:0a:86:5f:97:08:cc:40:ea:
#        74:01:9e:cc:de:7b:19:01:d1:cf:44:e5:fd:b3:ca:2a:16:ee:
#        6c:98:fc:7c:d8:91:2d:91:4c:03:e1:d4:d1:f6:d7:b2:b6:8f:
#        35:7c:90:dd
#-----BEGIN CERTIFICATE-----
#MIIE8zCCA9ugAwIBAgISBMsu3Ka/bZpQeaxKENbBWXwGMA0GCSqGSIb3DQEBCwUA
#MDMxCzAJBgNVBAYTAlVTMRYwFAYDVQQKEw1MZXQncyBFbmNyeXB0MQwwCgYDVQQD
#EwNSMTEwHhcNMjQxMTA2MTYzNzE1WhcNMjUwMjA0MTYzNzE0WjAXMRUwEwYDVQQD
#DAwqLmJhZHNzbC5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCj
#RUnu4ZFdGI2QAOSRiQC4uA5s1UrCRPGrfpQzahL/7+V8u+fCUJAdIep/dm/C2kA8
#NA0CbdYK/XCzC3wzxCcxazia69Ki0TfwyAfEYVQvV5+NwahBF/3vteozfXCsxp9d
#mH1QuGY6ZzAEc7GHS1rHI0jwbl/h9NLBWrM9SjZ2Ujpwi1ghW6fgFctNj4HrNBcR
#jqwyKMraOW3zIjLmq96rTNSclqJAF+Pjt+nxTxgoAu9g+xawI8/kplG+u1OOW/tF
#2rJHSZaCYM6eAsgqGLjmi593SYvNFinvsIT8+Ax/nrvAXWEZ8we2qRh2JHAB1Grm
#OntDYmLGGcdaU5MYOYiBAgMBAAGjggIbMIICFzAOBgNVHQ8BAf8EBAMCBaAwHQYD
#VR0lBBYwFAYIKwYBBQUHAwEGCCsGAQUFBwMCMAwGA1UdEwEB/wQCMAAwHQYDVR0O
#BBYEFMHPyIg/XFCrwr+rRClns8xj5q8QMB8GA1UdIwQYMBaAFMXPRqTq9MPAemyV
#xC2wXpIvJuO5MFcGCCsGAQUFBwEBBEswSTAiBggrBgEFBQcwAYYWaHR0cDovL3Ix
#MS5vLmxlbmNyLm9yZzAjBggrBgEFBQcwAoYXaHR0cDovL3IxMS5pLmxlbmNyLm9y
#Zy8wIwYDVR0RBBwwGoIMKi5iYWRzc2wuY29tggpiYWRzc2wuY29tMBMGA1UdIAQM
#MAowCAYGZ4EMAQIBMIIBAwYKKwYBBAHWeQIEAgSB9ASB8QDvAHUAouMK5EXvva2b
#fjjtR2d3U9eCW4SU1yteGyzEuVCkR+cAAAGTAovwSwAABAMARjBEAiBSc8/aK+7a
#Uc+Gk8pfjVK4XzxP9yQ0RP46AMvyKIkddgIgKyg7SKVeIvTJkcBJRN8HBKFBZlkd
#IhSbiuvlKeQlt0YAdgDm0jFjQHeMwRBBBtdxuc7B0kD2loSG+7qHMh39HjeOUAAA
#AZMCi/BTAAAEAwBHMEUCIQCXxQ9t2tgepDEhlzCflaNLpf7i8iQ2YFeKeetgjl9Q
#owIgHNz5NJAKIE0+qEb5qT1nZ75U3HdKshpozZOPKnzYEfUwDQYJKoZIhvcNAQEL
#BQADggEBAD/BJQX0vji4Wq5B1FbrBPVKRXJNNdPSt3HRZRa882U+x00vjIaJvHZ3
#SVokV1gi+5RGRF+UDSIfjAgr+26dwygBfvqG12Z311ZWMzg/xZXwzTDGyfktnSQd
#BZIZarpmPzLhJIXjq0sathW2RfvdsaJmsAGdUFv/0BDfqpRVKWHH2LcfuXIQZo6k
#iNrcPsxo7PJm+YRigdaGRj+jmEs20k7Dp4ivsxVmm6tgq06+Sh3u1RnsFqUfkG8g
#HDTPuuOa/g4MnhBVnrdL+XCC638as/kKhl+XCMxA6nQBnszeexkB0c9E5f2zyioW
#7myY/HzYkS2RTAPh1NH217K2jzV8kN0=
#-----END CERTIFICATE-----
#
#Certificate:
#    Data:
#        Version: 3 (0x2)
#        Serial Number:
#            e7:05:5a:1b:03:93:8c:b1
#        Signature Algorithm: sha256WithRSAEncryption
#        Issuer: C=US, ST=California, L=San Francisco, O=BadSSL, CN=*.badssl.com
#        Validity
#            Not Before: Nov  7 19:29:42 2024 GMT
#            Not After : Nov  7 19:29:42 2026 GMT
#        Subject: C=US, ST=California, L=San Francisco, O=BadSSL, CN=*.badssl.com
#        Subject Public Key Info:
#            Public Key Algorithm: rsaEncryption
#                Public-Key: (2048 bit)
#                Modulus:
#                    00:c2:04:ec:f8:8c:ee:04:c2:b3:d8:50:d5:70:58:
#                    cc:93:18:eb:5c:a8:68:49:b0:22:b5:f9:95:9e:b1:
#                    2b:2c:76:3e:6c:c0:4b:60:4c:4c:ea:b2:b4:c0:0f:
#                    80:b6:b0:f9:72:c9:86:02:f9:5c:41:5d:13:2b:7f:
#                    71:c4:4b:bc:e9:94:2e:50:37:a6:67:1c:61:8c:f6:
#                    41:42:c5:46:d3:16:87:27:9f:74:eb:0a:9d:11:52:
#                    26:21:73:6c:84:4c:79:55:e4:d1:6b:e8:06:3d:48:
#                    15:52:ad:b3:28:db:aa:ff:6e:ff:60:95:4a:77:6b:
#                    39:f1:24:d1:31:b6:dd:4d:c0:c4:fc:53:b9:6d:42:
#                    ad:b5:7c:fe:ae:f5:15:d2:33:48:e7:22:71:c7:c2:
#                    14:7a:6c:28:ea:37:4a:df:ea:6c:b5:72:b4:7e:5a:
#                    a2:16:dc:69:b1:57:44:db:0a:12:ab:de:c3:0f:47:
#                    74:5c:41:22:e1:9a:f9:1b:93:e6:ad:22:06:29:2e:
#                    b1:ba:49:1c:0c:27:9e:a3:fb:8b:f7:40:72:00:ac:
#                    92:08:d9:8c:57:84:53:81:05:cb:e6:fe:6b:54:98:
#                    40:27:85:c7:10:bb:73:70:ef:69:18:41:07:45:55:
#                    7c:f9:64:3f:3d:2c:c3:a9:7c:eb:93:1a:4c:86:d1:
#                    ca:85
#                Exponent: 65537 (0x10001)
#        X509v3 extensions:
#            X509v3 Basic Constraints:
#                CA:FALSE
#            X509v3 Subject Alternative Name:
#                DNS:*.badssl.com, DNS:badssl.com
#    Signature Algorithm: sha256WithRSAEncryption
#    Signature Value:
#        ae:2c:cf:97:a9:3b:d8:13:eb:d5:bf:4e:31:9b:84:59:55:8e:
#        98:27:36:1d:cd:9d:56:1a:24:fd:12:c3:d0:4c:32:34:02:cc:
#        40:fa:c0:88:69:c9:dc:2c:80:23:d4:03:c7:21:54:7e:88:6d:
#        1c:cd:b1:28:32:ab:8c:26:4e:8f:9d:38:d1:36:13:eb:a0:0f:
#        49:31:3f:fb:11:aa:65:9a:86:9a:bf:6e:91:ab:62:58:6b:27:
#        c2:c8:ce:ed:9a:5e:80:6f:7b:5f:d4:29:90:87:c3:d5:0a:24:
#        5b:35:dc:0b:50:48:29:43:13:3d:85:4b:23:eb:c6:03:d3:2c:
#        ad:f3:6c:2a:a3:73:13:b7:45:44:8a:da:73:56:83:11:3e:79:
#        a0:b3:b4:30:b9:7a:55:3a:47:0f:dc:5c:89:3f:35:c2:d2:e1:
#        ff:85:84:87:66:49:3a:29:45:bc:cf:5d:2a:b6:fb:6e:4f:e0:
#        8b:2f:d5:4b:1f:a4:4c:5d:9f:9d:43:a5:a6:04:3a:25:67:5d:
#        3f:65:c8:7f:b1:55:0b:c6:2c:14:4b:a4:a1:3a:5d:62:6b:1b:
#        1c:c5:ee:64:63:56:f9:75:3a:5d:5e:9c:5d:7b:f1:b8:52:6e:
#        00:41:69:a0:41:55:5c:f9:25:d3:1f:77:60:70:35:a8:b1:86:
#        44:51:d1:ca
#-----BEGIN CERTIFICATE-----
#MIIDeTCCAmGgAwIBAgIJAOcFWhsDk4yxMA0GCSqGSIb3DQEBCwUAMGIxCzAJBgNV
#BAYTAlVTMRMwEQYDVQQIDApDYWxpZm9ybmlhMRYwFAYDVQQHDA1TYW4gRnJhbmNp
#c2NvMQ8wDQYDVQQKDAZCYWRTU0wxFTATBgNVBAMMDCouYmFkc3NsLmNvbTAeFw0y
#NDExMDcxOTI5NDJaFw0yNjExMDcxOTI5NDJaMGIxCzAJBgNVBAYTAlVTMRMwEQYD
#VQQIDApDYWxpZm9ybmlhMRYwFAYDVQQHDA1TYW4gRnJhbmNpc2NvMQ8wDQYDVQQK
#DAZCYWRTU0wxFTATBgNVBAMMDCouYmFkc3NsLmNvbTCCASIwDQYJKoZIhvcNAQEB
#BQADggEPADCCAQoCggEBAMIE7PiM7gTCs9hQ1XBYzJMY61yoaEmwIrX5lZ6xKyx2
#PmzAS2BMTOqytMAPgLaw+XLJhgL5XEFdEyt/ccRLvOmULlA3pmccYYz2QULFRtMW
#hyefdOsKnRFSJiFzbIRMeVXk0WvoBj1IFVKtsyjbqv9u/2CVSndrOfEk0TG23U3A
#xPxTuW1CrbV8/q71FdIzSOciccfCFHpsKOo3St/qbLVytH5aohbcabFXRNsKEqve
#ww9HdFxBIuGa+RuT5q0iBikusbpJHAwnnqP7i/dAcgCskgjZjFeEU4EFy+b+a1SY
#QCeFxxC7c3DvaRhBB0VVfPlkPz0sw6l865MaTIbRyoUCAwEAAaMyMDAwCQYDVR0T
#BAIwADAjBgNVHREEHDAaggwqLmJhZHNzbC5jb22CCmJhZHNzbC5jb20wDQYJKoZI
#hvcNAQELBQADggEBAK4sz5epO9gT69W/TjGbhFlVjpgnNh3NnVYaJP0Sw9BMMjQC
#zED6wIhpydwsgCPUA8chVH6IbRzNsSgyq4wmTo+dONE2E+ugD0kxP/sRqmWahpq/
#bpGrYlhrJ8LIzu2aXoBve1/UKZCHw9UKJFs13AtQSClDEz2FSyPrxgPTLK3zbCqj
#cxO3RUSK2nNWgxE+eaCztDC5elU6Rw/cXIk/NcLS4f+FhIdmSTopRbzPXSq2+25P
#4Isv1UsfpExdn51DpaYEOiVnXT9lyH+xVQvGLBRLpKE6XWJrGxzF7mRjVvl1Ol1e
#nF178bhSbgBBaaBBVVz5JdMfd2BwNaixhkRR0co=
#-----END CERTIFICATE-----
#
# Cert 1 - Valid/Invalid
# Invalid -  certificate valid from 9-12 april 2015 not valid for assumed date 
# Cert 2 - Valid/Invalid
# Valid 
# Cert 3 - Valid/Invalid
# Invalid - issuer .badssl.com is a untrusted CA

# Sources:
# [1] https://www.unixfu.ch/calculate-checksums-using-openssl/
# [2] https://opuslearning.co.uk/decrypt-files-with-openssl-mastering-aes-256-cbc-decryption/
# [3] https://docs.openssl.org/1.1.1/man1/rand/
# [4] https://docs.openssl.org/master/man1/openssl-pkeyutl/#notes
# [5] https://docs.openssl.org/3.4/man1/openssl-ts/#timestamp
# [6] https://docs.openssl.org/1.1.1/man1/x509/