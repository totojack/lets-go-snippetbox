# lets-go-snippetbox

A snippet management web application built with Go and MySQL.

## Prerequisites

- [Go](https://golang.org/doc/install) (1.21 or later)
- [Docker](https://docs.docker.com/get-docker/) (for running MySQL)
- [Task](https://taskfile.dev/installation/) (task runner)

## Getting Started

This project uses [Task](https://taskfile.dev/) to manage database and application lifecycle.

### Quick Start

Start the application (this will automatically build and start the database):

```bash
task start-app
```

The application will be available at <http://localhost:4000>

### Available Commands

#### Application Management

- **Start application (foreground)**
  ```bash
  task start-app
  ```
  Starts the Go web server on port 4000 (automatically starts database if needed)

- **Start application (background)**
  ```bash
  task start-app-bg
  ```
  Runs the application in the background, with logs in `.runtime/app.log`

- **Check application status**
  ```bash
  task status-app
  ```

- **Stop application**
  ```bash
  task stop-app
  ```

#### Database Management

- **Build database image**
  ```bash
  task build-db
  ```
  Builds a custom MySQL Docker image with the initial schema

- **Start database**
  ```bash
  task start-db
  ```
  Starts the MySQL container on port 3306

- **Check database status**
  ```bash
  task status-db
  ```

- **Test database**
  ```bash
  task test-db
  ```
  Runs tests to verify database initialization and permissions

- **Stop database**
  ```bash
  task stop-db
  ```
  Stops and removes the MySQL container

## Configuration

The application is configured with the following defaults (see `Taskfile.yml`):

- **Application Port**: 4000
- **Database Port**: 3306
- **Database Name**: snippetbox
- **Database User**: web
- **Database Password**: pass

## Manual Start (without Task)

If you prefer to run without Task:

```bash
# Make sure MySQL is running with the correct configuration
go run ./cmd/web
```
