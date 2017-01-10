#!/bin/sh
clear

echo [genere la clef privee]
openssl genrsa -aes256 -out certs/ca-key.pem 4096
echo

echo [genere la clef publique]
openssl req -new -x509 -days 3650 -key certs/ca-key.pem -sha256 -out certs/ca.pem
echo
