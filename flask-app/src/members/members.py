from flask import Blueprint, request, jsonify, make_response
import json
from src import db


members = Blueprint('members', __name__)

# Get all customers from the DB


@members.route('/updatingtask', methods=['GET'])
def get_customers():
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

# Get customer detail for customer with particular userID


@members.route('/<member_ID>tasks', methods=['GET'])
def get_customer(userID):
    # get request to TASK for all unfinished tasks that have the memberID
    cursor = db.get_db().cursor()
    cursor.execute(
        'select * from customers where customerNumber = {0}'.format(userID))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response
