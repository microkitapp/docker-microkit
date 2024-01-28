#!/bin/bash -v


if [ -f .env ]; then
    echo "File .env exist, by delete it you will lose all your data. Are you sure? [y/n]"
    read answer
    if [ "$answer" != "${answer#[Yy]}" ] ;then
        echo "Overriding .env file"
    else
        exit 0
    fi
fi

cp .env.example .env

sed -i '' "s|CRYPTO_INTERNAL_KEY.*|CRYPTO_INTERNAL_KEY=$(openssl rand -base64 48)|" .env
sed -i '' "s|JWT_SECRET.*|JWT_SECRET=$(openssl rand -base64 48)|" .env
sed -i '' "s|CRYPTO_AES_KEY.*|CRYPTO_AES_KEY=$(openssl rand -base64 32)|" .env

