# Pokemon APP

### This is a demo application for building a REST API using [Express](https://expressjs.com/) and [EdgeDB](https://www.edgedb.com/)

## Prerequisits

- Nodejs v16.15.1 or higher
- EdgeDB v1.4

#### Clone this repo using the following command

```sh
$ git clone https://github.com/TRomesh/edgedb-pokemon.git
```

## Initialize the EdgeDB instance

You can initialize the EdgeDB instance using the following command.

```
$ edgedb project init
```

## Runing the migration files

#### Move to the project root (edgedb-pokemon) and execute the command below to run the migration file under `dbschema/migrations/<migration_number>.esdl`. This will create the necessary object types on your edgedb instance.

```
$ edgedb migrate
```

## Adding Environment variables for .env file (Optional)

#### Create a `.env` file in the project root and reffer the `.env_example` file to add the environment variables

## Installing dependencies

#### Execute the following commands to install the dependencies

```sh
$ npm install
```

## Starting the development server

#### Execute the command below to start the development server with nodemon

```sh
$ npm run dev
```

You can test the REST API using Postman or CURL
