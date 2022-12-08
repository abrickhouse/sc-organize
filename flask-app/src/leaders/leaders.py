from flask import Blueprint, request, jsonify, make_response
import json
from src import db


leaders = Blueprint('leaders', __name__)

# Get all the products from the database


@leaders.route('/', methods=['GET'])
def lead_one():
    # get a cursor object from the database
    cursor = db.get_db().cursor()

    # use cursor to query the database for a list of products
    cursor.execute(
        'select productCode, productName, productVendor from products')

    # grab the column headers from the returned data
    column_headers = [x[0] for x in cursor.description]

    # create an empty dictionary object to use in
    # putting column headers together with data
    json_data = []

    # fetch all the data from the cursor
    theData = cursor.fetchall()

    # for each of the rows, zip the data elements together with
    # the column headers.
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))

    return jsonify(json_data)

# get the top 5 products from the database


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


@leaders.route('/assigningtaskdetail')
def lead_four():
    cursor = db.get_db().cursor()
    # update request to TASK to add the memberID of person assigned
    # this will have to deal with POST as well
    # the get should get the name, type, date_assigned = today, and description
    query = '''
        SELECT p.productCode, productName, sum(quantityOrdered) as totalOrders
        FROM products p JOIN orderdetails od on p.productCode = od.productCode
        GROUP BY p.productCode, productName
        ORDER BY totalOrders DESC
        LIMIT 5;
    '''
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
