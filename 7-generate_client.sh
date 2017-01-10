#!/bin/sh

echo [genere la clef privee confidentielle]
openssl genrsa -out certs/client-key.pem 2048
echo

echo [genere la demande de clef publique]
openssl req -subj '/CN=Benoist JAMIN' -sha256 -new -key certs/client-key.pem -out certs/client.csr
echo

echo [genere la clef publique par l\'autorite]
openssl x509 -req -days 3650 -sha256 -in certs/client.csr -CA certs/ca.pem -CAkey certs/ca-key.pem -CAcreateserial -out certs/client-cert.pem
echo

echo [transformation de la clef publique au format requis par Windows]
openssl pkcs12 -export -in certs/client-cert.pem -inkey certs/client-key.pem -name "Certificate for demo" -out certs/client.p12
echo
