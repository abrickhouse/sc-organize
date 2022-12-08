from flask import Blueprint, request, jsonify, make_response
import json
from src import db


members = Blueprint('members', __name__)

# Get all customers from the DB


@members.route('/<id>updatingtask', methods=['GET'])
def mem_one(id):
    # post/update request to TASK and maybe also to MEMBER if they finish the task
    cursor = db.get_db().cursor()
    cursor.execute(
        'select name, description, date_assigned, date_due from TASK where task_number = {0}'.format(id))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response


@members.route('/updatingtaskpost', methods=['GET'])
def mem_onepost():
    # post/update request to TASK and maybe also to MEMBER if they finish the task
    cursor = db.get_db().cursor()
    cursor.execute('select customerNumber, customerName,\
        creditLimit from customers')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response


@members.route('/<member_ID>tasks', methods=['GET'])
def mem_two(member_ID):
    # get request to TASK for all unfinished tasks that have the memberID
    cursor = db.get_db().cursor()
    cursor.execute(
        'select type, date_assigned, date_due, task_number, name from TASK where TASK.member_ID = {0}'.format(member_ID))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response
