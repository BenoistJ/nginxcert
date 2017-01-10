#!/bin/sh

echo [genere la clef privee confidentielle]
openssl genrsa -out certs/server-key.pem 2048
echo

echo [genere la demande de clef publique]
openssl req -subj "/CN=bigdata4" -sha256 -new -key certs/server-key.pem -out certs/server.csr
echo

echo [genere la clef publique du cote de l\'autorite]
openssl x509 -req -days 3650 -sha256 -in certs/server.csr -CA certs/ca.pem -CAkey certs/ca-key.pem -CAcreateserial -out certs/server-cert.pem
echo
