from flask import Blueprint, request, jsonify, make_response
import json
from src import db

execs = Blueprint('execs', __name__)


@execs.route('/<id>dashboard')
def exec_two(id):
    # get a cursor object from the database
    # access PROJECT details
    cursor = db.get_db().cursor()
    cursor.execute(
        'select title, description, frontLang, backLang, semester from PROJECT where exec_ID = {0}'.format(id))

    column_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))

    return jsonify(json_data)


@execs.route('/assigningclient')
def exec_one():
    # post/update request to TEAM (i think)
    # i want to delete this one maybe
    cursor = db.get_db().cursor()
    query = '''
        SELECT title, description
        FROM PROJECT
        WHERE exec_ID = NULL
        LIMIT 1;
    '''
    cursor.execute(query)
    column_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))

    return jsonify(json_data)


@execs.route('/assigningclientcli')
def exec_oneother():
    cursor = db.get_db().cursor()
    query = '''
        SELECT date_applied, name
        FROM CLIENTS
        WHERE exec_ID = NULL
        LIMIT 1;
    '''
    cursor.execute(query)
    # grab the column headers from the returned data
    column_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))

    return jsonify(json_data)


@execs.route('/assigningtaskdevs')
def execs_five():
    cursor = db.get_db().cursor()
    # select devs on this tea,
    query = '''
        SELECT name, member_ID as id 
        FROM MEMBER 
        WHERE role = 'Developer';
    '''
    cursor.execute(query)
    column_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))

    return jsonify(json_data)


@execs.route('/assigningtaskdes')
def execs_six():
    cursor = db.get_db().cursor()
    # select designers
    query = '''
        SELECT name, member_ID as id
        FROM MEMBER 
        WHERE role = 'Designer';
    '''
    cursor.execute(query)
    column_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))

    return jsonify(json_data)
