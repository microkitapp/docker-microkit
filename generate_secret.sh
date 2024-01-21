#!/bin/bash -v

 
cp .env.example .env

sed -i '' "s|CRYPTO_INTERNAL_KEY.*|CRYPTO_INTERNAL_KEY=$(openssl rand -base64 48)|" .env
sed -i '' "s|JWT_SECRET.*|JWT_SECRET=$(openssl rand -base64 48)|" .env
sed -i '' "s|CRYPTO_AES_KEY.*|CRYPTO_AES_KEY=$(openssl rand -base64 32)|" .env

