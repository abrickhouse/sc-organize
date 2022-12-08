# Sc-Organize

This is my final project for Fall 2022 3200

Sc-organize is a project management application that uses a database to store all releveant information about project development for the club Scout Studio at Northeastern University.

The app would be used by clients (who need their project designed and built), executives (who manage all teams to ensure everythign is running smoothly), project leads (who manage a team), and team members (developers/designers in a team).

**Link to Pitch Video**: <a href="#">link</a>

## How to setup and start the containers

**Important** - you need Docker Desktop installed

1. In a terminal or command prompt, navigate to the folder with the `docker-compose.yml` file.
1. Build the images with `docker compose build`
1. Start the containers with `docker compose up`. To run in detached mode, run `docker compose up -d`.

## For setting up a Conda Web-Dev environment:

1. `conda create -n webdev python=3.9`
1. `conda activate webdev`
1. `pip install flask flask-mysql flask-restful cryptography flask-login`

Created by Amaiya Brickhouse
