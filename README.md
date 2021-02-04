# mysql-no-code-migrations
Code-less Framework for doing POS (Plain-Old-SQL) MySQL database schema deployments. 

## Purpose

At Intelletive Consulting, we help organizations automate software builds and deployments. Unfortunately, we have discovered that it is very common for teams to be manually deploying their database schemas which makes it very difficult to fully automate their deployments. 

This script is meant to make it easy to setup and implement migrations in minutes for any legacy project that uses MySQL. You can fork/copy these files into your own code repository and whatever CICD tool you use and in minutes have database migrations setup using nothing but plain-old-SQL. 

## Concepts

1. Migration Scripts: A list of SQL scripts to be run and applied to the database (in order). 
2. Deployment Script: A bash script that, when run, runs all of your migrations against a database. 
3. Migrations Table: A SQL Table that is used to track which migration scripts have run in order to prevent the same script from being run twice. 

## Usage

In a build pipeline (using whatever CICD tools you use) with the mysql client cli installed, simply run the following command, plugging in the credentials as needed: 

    export MYSQL_USER=username
    export MYSQL_PASS=password
    export MYSQL_HOST=hostname
    export MYSQL_PORT=3306
    ./run-migrations.sh

