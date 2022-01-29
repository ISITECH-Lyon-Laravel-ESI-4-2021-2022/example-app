## Laravel default projet with sail

### First time setup

#### Copy .env file from example
```shell
cp .env.example .env
```

#### Installing Composer Dependencies For Existing Applications

If you are developing an application with a team, you may not be the one that initially creates the Laravel application. Therefore, none of the application's Composer dependencies, including Sail, will be installed after you clone the application's repository to your local computer.

You may install the application's dependencies by navigating to the application's directory and executing the following command. This command uses a small Docker container containing PHP and Composer to install the application's dependencies:
```shell
docker run --rm \
    -u "$(id -u):$(id -g)" \
    -v $(pwd):/var/www/html \
    -w /var/www/html \
    laravelsail/php81-composer:latest \
    composer install --ignore-platform-reqs
```

When using the `laravelsail/phpXX-composer` image, you should use the same version of PHP that you plan to use for your application (`74`, `80`, or `81`).

#### Configuring A Bash Alias

By default, Sail commands are invoked using the vendor/bin/sail script that is included with all new Laravel applications:

```shell
./vendor/bin/sail up
```

However, instead of repeatedly typing `vendor/bin/sail` to execute Sail commands, you may wish to configure a Bash alias that allows you to execute Sail's commands more easily:
```shell
alias sail='[ -f sail ] && bash sail || bash vendor/bin/sail'
```

Once the Bash alias has been configured, you may execute Sail commands by simply typing `sail`. The remainder of this documentation's examples will assume that you have configured this alias:

```shell
sail up
```

### Some commands

```shell
# Start docker-compose projet through sail
sail up
# Start docker-compose projet through sail in detached mode
sail up -d
# Stop application
sail down
# Set the application key
sail artisan key:generate
# Composer dependencies
sail composer install --ignore-platform-reqs
# Node dependencies
sail npm ci
# First time migrate
sail artisan migrate
# Drop all tables and re-run all migrations
sail artisan migrate:fresh
# Check docker container status
sail ps
```

### Documentation

You can find the [Laravel documentation](https://laravel.com/docs/8.x/installation)
