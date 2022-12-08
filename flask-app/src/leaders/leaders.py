from flask import Blueprint, request, jsonify, make_response
import json
from src import db

leaders = Blueprint('leaders', __name__)


@leaders.route('/<id>team')  # need the lead_ID
def lead_two(id):
    # get all th emembers that match this lead_ID
    # separately get the number of unfinished tasks
    # and maybe delete the hours worked section
    # only need name, role, and num of unfinished tasks
    cursor = db.get_db().cursor()
    query = '''
        SELECT name, role, tasks_in_progress, total_hours, lead_ID
        FROM MEMBER
        WHERE {0} = lead_ID;
    '''.format(id)
    cursor.execute(query)
    column_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))

    return jsonify(json_data)


@leaders.route('/<id>unassignedtasks')
def lead_three(id):
    # get from TASK to get all unassigned tasks on the
    # project that the lead is assigned to
    # select tasks where date assigned is null
    cursor = db.get_db().cursor()
    query = '''
        SELECT name, type, date_assigned, date_due, task_number, lead_ID
        FROM TASK
        WHERE date_assigned IS NULL AND {0} = lead_ID;
    '''.format(id)
    cursor.execute(query)
    column_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))

    return jsonify(json_data)


@leaders.route('/assigningtaskdevs')
def lead_five():
    cursor = db.get_db().cursor()
    # select devs on this tea,
    query = '''
        SELECT name FROM MEMBER WHERE lead_ID = id AND role = 'Developer';
    '''
    cursor.execute(query)
    column_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))

    return jsonify(json_data)


@leaders.route('/assigningtaskdes')
def lead_six():
    cursor = db.get_db().cursor()
    # select designers
    query = '''
        SELECT name FROM MEMBER WHERE lead_ID = id AND role = 'Designer';
    '''
    cursor.execute(query)
    column_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))

    return jsonify(json_data)
