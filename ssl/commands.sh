#!/usr/bin/env bash
# Inpired By: 
# https://www.digitalocean.com/community/tutorials/openssl-essentials-working-with-ssl-certificates-private-keys-and-csrs



# generate csr from existing key
# 
# An important field in the DN is the Common Name (CN), 
# which should be the exact Fully Qualified Domain Name (FQDN) 
# of the host that you intend to use the certificate with.
openssl req -key my.key -new -out domain.csr

# generate certificate from existing key
# -x509 : create self signed
# 
openssl req -key my.key -new -x509 -days 365 -out domain.crt


# view domain.csr contents, as human readable
openssl req -text -noout -verify -in domain.csr

# view certificate contents, as human readable
openssl x509 -text -noout -in domain.crt

# generate private rsa key
ssh-keygen -t rsa -b 4096 -C "name@gmail.com"

# show domain certificates chain
openssl s_client -connect www.facebook.com:443 -showcerts


