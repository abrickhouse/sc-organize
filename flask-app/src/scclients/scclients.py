from flask import Blueprint, request, jsonify, make_response
import json
from src import db


scclients = Blueprint('scclients', __name__)

# Get all the products from the database


@scclients.route('/<tit>/<led>/<cli>addtask', methods=['POST'])
def get_products(tit, led, cli):
    # get a cursor object from the database
    # post request
    # to update TASK
    cursor = db.get_db().cursor()

    # use cursor to query the database for a list of products
    cursor.execute(
        'select name from PROJECT')

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
