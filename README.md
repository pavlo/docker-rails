# A docker container Rails apps

This is simple a Dockerfile for building a Rails app docker container based on Ruby 2.0 ruby version.

## Prerequisites

The `Dockerfile` and `.dockerignoe` should be placed in root of a Rails project. This means that your app will be built into the image along with ruby gems it depends on.

The image exposes port `3000`.

## Usage

Build the image:

    docker build -t yourid/rails_app .

Run webrick (for development):

    docker run -e RAILS_ENV=staging yourid/rails_app
    
To run migrations:
    
    docker run -e RAILS_ENV=production yourid/rails_app /bin/bash -c "rake db:migrate"

Or even simpler:

    docker run yourid/rails_app rake db:migrate
    
