from flask import Blueprint, request, jsonify, make_response
import json
from . import db as db_connection

views = Blueprint('views', __name__)

# This is a base route
# we simply return a string.


@views.route('/')
def home():
    return ('<h1>Hello from your web app!!</h1>')

# This is a sample route for the /test URI.
# as above, it just returns a simple string.


@views.route('/test')
def tester():
    return "<h1>this is a test!</h1>"


@views.route('/homemem')
def db_testingmem():
    cur = db_connection.get_db().cursor()
    cur.execute('select name, member_ID as id from MEMBER')
    row_headers = [x[0] for x in cur.description]
    json_data = []
    theData = cur.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    return jsonify(json_data)


@views.route('/homelead')
def db_testinglead():
    cur = db_connection.get_db().cursor()
    cur.execute('select name, lead_ID as id from LEADER')
    row_headers = [x[0] for x in cur.description]
    json_data = []
    theData = cur.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    return jsonify(json_data)


@views.route('/homeexec')
def db_testingexec():
    cur = db_connection.get_db().cursor()
    cur.execute('select name, exec_ID as id from EXECUTIVE')
    row_headers = [x[0] for x in cur.description]
    json_data = []
    theData = cur.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    return jsonify(json_data)


@views.route('/homecli')
def db_testingcli():
    cur = db_connection.get_db().cursor()
    cur.execute('select name, client_ID as id from CLIENTS')
    row_headers = [x[0] for x in cur.description]
    json_data = []
    theData = cur.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    return jsonify(json_data)
