# Versions

- [`2.0.0-0` (_Dockerfile_)](https://github.com/mageinferno/docker-magento2-setup/tree/2.0.0-0/Dockerfile)
- [`2.0.0-archive-0` (_Dockerfile_)](https://github.com/mageinferno/docker-magento2-setup/tree/2.0.0-archive-0/Dockerfile)
- [`2.0.0-archivesd-0` (_Dockerfile_)](https://github.com/mageinferno/docker-magento2-setup/tree/2.0.0-archivesd-0/Dockerfile)

# Description

This image is built from [`mageinferno/magento2-php`](https://hub.docker.com/r/mageinferno/magento2-php/) repository and installs Magento 2.

# What's in this image?

- The `2.0.0-[TAG]` image installs Magento 2 and all dependencies with Composer, then runs the CLI installer.
- The `2.0.0-archive-[TAG]` image installs Magento 2 from an archive (without sample data), then runs the CLI installer.
- The `2.0.0-archivesd-[TAG]` image installs Magento 2 from an archive (with sample data), then runs the CLI installer.

# How to use this image?

We recommend configuring your setup using [our Docker Compose config](https://github.com/mageinferno/magento2-docker-compose). This allows easy configuration and installation setup with our other Docker images.

Once your docker-compose.yml file is all setup, you can execute setup by running:

`docker-compose run --rm setup`

This will execute a one-off container that runs the setup script included in this Docker image. Note that composer setup will take around 30 minutes to complete (with sample data). A vast majority of this time is from downloading Composer dependencies.

# Docker Compose

Please see [https://github.com/mageinferno/magento2-docker-compose](https://github.com/mageinferno/magento2-docker-compose) for more detailed instructions and an example development environment using Docker Compose.
