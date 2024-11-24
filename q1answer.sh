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
openssl sha1 crypto1.zip.enc
openssl sha1 crypto2.zip.enc
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
# Q1.f Output
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
#

# Q1.h Command:

# Q1.h Output
#

# Q1.i Commands:

# Q1.i Output
#
#
# Cert 1 - Valid/Invalid
#
# Cert 2 - Valid/Invalid
#
# Cert 3 - Valid/Invalid
#

# Sources:
# [1] https://www.unixfu.ch/calculate-checksums-using-openssl/
# [2] https://opuslearning.co.uk/decrypt-files-with-openssl-mastering-aes-256-cbc-decryption/
# [3] https://docs.openssl.org/1.1.1/man1/rand/
# [4] https://docs.openssl.org/master/man1/openssl-pkeyutl/#notes
# [5] https://docs.openssl.org/3.4/man1/openssl-ts/#timestamp-request-generation