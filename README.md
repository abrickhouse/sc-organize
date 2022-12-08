# Sc-Organize

This is my final project for Fall 2022 3200

Sc-organize is a project management application that uses a database to store all releveant information about project development for the club Scout Studio at Northeastern University.

The app would be used by clients (who need their project designed and built), executives (who manage all teams to ensure everythign is running smoothly), project leads (who manage a team), and team members (developers/designers in a team).

**Link to Pitch Video**: <a href="#">link</a>

## Details

- home page --> user enters the user type and specific user they want to proceed as

#### Member Pages

- memberTasks page --> shows all tasks assigned to this dev/designer
- memberEditTask --> allows the user to inspect the task and update the date it was finished and the hours that it took to complete (POST)

#### Lead Pages

- leadTeam page --> shows all members of the team that the lead runs
- leadUnassignTasks page --> shows all unassigned tasks of the project that the lead is assigned to

#### Executive Pages

- execDashboard --> shows all projects

#### Client Pages

- Project Details page --> client can see all of the revelant information about the project that the team is building
- AddTask page --> client can add a task that they want the team to complete (POST)

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
