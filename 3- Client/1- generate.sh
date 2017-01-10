
	# clef privée (confidentielle)
    openssl genrsa -out benj-key.pem 2048
	
	# demande de clef publique
	openssl req -subj '/CN=Benoist JAMIN' -new -key benj-key.pem -out benj.csr
	 
	 
	# generation par l'autorité
	openssl x509 -req -days 3650 -sha256 -in benj.csr -CA ca.pem -CAkey ca-key.pem -CAcreateserial -out benj-cert.pem
	
    
	# transformation pour Windows
	openssl pkcs12 -export -in benj-cert.pem -inkey benj-key.pem -name "Certificate for benj" -out benj.p12
