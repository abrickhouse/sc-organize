from flask import current_app, Blueprint, request, jsonify, make_response
import json
from src import db

scclients = Blueprint('scclients', __name__)


@scclients.route('/<id>projectdetails')
def get_project(id):
    # get requets
    # for PROJECT INFO and the adjoining TEAM
    cursor = db.get_db().cursor()
    query = '''
        SELECT title, description, frontLang, backLang, client_ID, lead_ID
        FROM PROJECT JOIN CLIENTS on title = proj_title JOIN TEAM ON TEAM.proj_title = PROJECT.title
        WHERE client_ID = {0}
    '''.format(id)
    cursor.execute(query)
    column_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))

    return jsonify(json_data)


@scclients.route('/<id>teamdetails')
def get_leadteam(id):
    # get requets
    # for PROJECT INFO and the adjoining TEAM
    cursor = db.get_db().cursor()
    query = '''
        SELECT name FROM LEADER NATURAL JOIN (SELECT lead_ID FROM TEAM JOIN (SELECT title
        FROM PROJECT JOIN CLIENTS on title = proj_title 
        WHERE client_ID = {0}) as NEW ON proj_title = title) as NEWTWO
    '''.format(id)
    cursor.execute(query)
    column_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))

    return jsonify(json_data)


@scclients.route('/<id>seetask', methods=['GET'])
def cli_getid(id):
    # get information about the client/project
    cursor = db.get_db().cursor()
    cursor.execute(
        'select TEAM.proj_title, client_ID, lead_ID from TEAM JOIN CLIENTS ON TEAM.proj_title = CLIENTS.proj_title where TEAM.proj_title = \"{0}\"'.format(id))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response


@scclients.route('/<led>/<cli>/<title>addtask', methods=['POST'])
def cli_addtaskt(led, cli, title):
    # post/update request to TASK and maybe also to MEMBER if they finish the task
    current_app.logger.info(request.form)
    cursor = db.get_db().cursor()
    name = request.form['name']
    type = request.form['type']
    desc = request.form['desc']

    # INSERT INTO TASK (name, proj_title, client_ID, type, lead_ID, completion_status, description)
    # VALUES (\"{name}\", \"{title}\", {cli}, \"{type}\", \"{led}\",  false, \"{desc}\");

    query = f'INSERT INTO TASK(name, proj_title, client_ID, type, lead_ID, task_number, completion_status, description) VALUES (\"{name}\", \"{title}\", {cli}, \"{type}\", {led}, (SELECT MAX(task_number)+1 FROM TASK as t), false, \"{desc}\")'

    cursor.execute(query)
    db.get_db().commit()
    return "Success"
