from flask import Blueprint, request, jsonify, make_response
import json
from src import db


execs = Blueprint('execs', __name__)

# Get all the products from the database


@execs.route('/dashboard', methods=['GET'])
def get_products():
    # get a cursor object from the database
    # get request to PROJECT for like evrything I guess,
    # also TASKS to get finished/total
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


@execs.route('/assigningclient')
def get_most_pop_products():
    # post/update request to TEAM (i think)
    cursor = db.get_db().cursor()
    query = '''
        SELECT p.productCode, productName, sum(quantityOrdered) as totalOrders
        FROM products p JOIN orderdetails od on p.productCode = od.productCode
        GROUP BY p.productCode, productName
        ORDER BY totalOrders DESC
        LIMIT 5;
    '''
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