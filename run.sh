#!/bin/bash

export YOUR_OKTA_DOMAIN="okta.example.com"

echo "Converting Chain..."
awk 'NF {sub(/\r/, ""); printf "%s\\n",$0;}' /etc/letsencrypt/live/$YOUR_OKTA_DOMAIN/chain.pem > chain-tmp && \
head -c -2 chain-tmp > chain-okta.pem && \
rm -rf chain-tmp

echo "Converting Cert..."
awk 'NF {sub(/\r/, ""); printf "%s\\n",$0;}' /etc/letsencrypt/live/$YOUR_OKTA_DOMAIN/cert.pem > cert-tmp && \
head -c -2 cert-tmp > cert-okta.pem && \
rm -rf cert-tmp

echo "Converting Privkey..."
awk 'NF {sub(/\r/, ""); printf "%s\\n",$0;}' /etc/letsencrypt/live/$YOUR_OKTA_DOMAIN/privkey.pem > privkey-tmp && \
head -c -2 privkey-tmp > privkey-okta.pem && \
rm -rf privkey-tmp

echo "Setting variables..."
export PRIVKEY=$(cat privkey-okta.pem) && \
export CERT=$(cat cert-okta.pem) && \
export CHAIN=$(cat chain-okta.pem) && \
echo "Generating final upload script..." && \
envsubst < tmp > final && \
chmod +x final && \
echo "Running final script..." && \
./final && \
echo "Success!!!"
