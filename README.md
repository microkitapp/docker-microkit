# MicroKit Docker-Compose Installation Guide

Welcome to the MicroKit Docker-Compose installation guide. This document will guide you through setting up the MicroKit environment using Docker-Compose. We assume that you are familiar with Docker and Docker-Compose.

## Prerequisites

- Docker and Docker-Compose installed on your machine.
- Basic understanding of Docker and environment variables.

## Files Overview

Before we proceed with the installation, let's take a quick look at the essential files:

1. **.env.example**: This file contains the template environment variables needed for the setup.
2. **docker-compose.yml**: The Docker-Compose configuration file defining services, networks, and volumes for your MicroKit setup.
3. **generate_secrets.sh**: A script to generate secure keys for your environment.

## Steps for Installation

### Step 1: Clone the Repository

Clone the repository containing the necessary files to your local machine:

```bash
git clone https://github.com/microkitapp/docker-microkit.git
cd docker-microkit
```

Replace `[repository-url]` and `[repository-name]` with the actual URL and name of your repository.

### Step 2: Generate Secret Keys

Run the `generate_secrets.sh` script to generate secure keys:

```bash
chmod +x generate_secrets.sh
./generate_secrets.sh
```

This script will create a `.env` file with generated secret keys.

### Step 3: Review and Update `.env` File

Open the `.env` file generated from `.env.example` and fill in or update the necessary variables.

- **Ensure sensitive fields are populated**: Fields like `CRYPTO_INTERNAL_KEY`, `JWT_SECRET`, and `CRYPTO_AES_KEY` should already be filled.
- **Configure Database Credentials**: Ensure `POSTGRES_PASSWORD`, `POSTGRES_USERNAME`, etc., are set according to your setup.
- **Set Service URLs**: Update `USERS_URL`, `BILLING_URL`, etc., with appropriate URLs.
- **Other Variables**: Review and update other variables as necessary.

### Step 4: Launch Docker-Compose

Run the following command to start all services defined in your `docker-compose.yml`:

```bash
docker-compose up -d
```

This will start the services in detached mode.

### Step 5: Verify Installation

After running Docker-Compose, you should verify that all services are up and running:

```bash
docker-compose ps
```

You should see all services listed as 'Up'.

## Important Notes

- **Volumes**: The `pg_data` volume is used for PostgreSQL data persistence. Make sure you have enough space where Docker stores volumes.
- **Ports**: Ensure that the ports specified in the `docker-compose.yml` file are available on your machine.
- **Environment Variables**: These are crucial for the security and proper functioning of your services. Never expose sensitive keys publicly.

## Troubleshooting

- If a service fails to start, use `docker-compose logs [service-name]` to check for errors.
- Ensure all required environment variables are correctly set in the `.env` file.
- Verify that the Docker daemon is running and you have sufficient permissions.

## Conclusion

You now have a basic MicroKit environment set up using Docker-Compose. This setup is ideal for development and testing purposes. For production environments, further configuration and security measures are recommended.

For more detailed information or support, please refer to the official MicroKit documentation or contact the support team.