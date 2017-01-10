
	# clef privée (confidentielle)
    openssl genrsa -out server-key.pem 2048
	 
	# demande de clef publique
	openssl req -subj "/CN=bigdata4" -sha256 -new -key server-key.pem -out server.csr


	
	# generation par l'autorité
	openssl x509 -req -days 3650 -sha256 -in server.csr -CA ca.pem -CAkey ca-key.pem -CAcreateserial -out server-cert.pem
