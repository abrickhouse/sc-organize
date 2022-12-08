from flask import current_app, Blueprint, request, jsonify, make_response
import json
from src import db

members = Blueprint('members', __name__)


@members.route('/<id>updatingtask', methods=['GET'])
def mem_one(id):
    # post/update request to TASK and maybe also to MEMBER if they finish the task
    cursor = db.get_db().cursor()
    cursor.execute(
        'select name, description, date_assigned, date_due, member_ID from TASK where task_number = {0}'.format(id))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response


@members.route('/<id>/<mem>updatingtaskpost', methods=['POST'])
def mem_onepost(id, mem):
    # post/update request to TASK and maybe also to MEMBER if they finish the task
    current_app.logger.info(request.form)
    cursor = db.get_db().cursor()
    hours = request.form['hours']
    date = request.form['date']
    query = f'update TASK SET completion_status = true, hours = \"{hours}\",  date_finished = \"{date}\" WHERE task_number = {id}'
    query2 = f'update MEMBER SET total_hours = total_hours + \"{hours}\", tasks_in_progress = tasks_in_progress - 1 WHERE member_ID = {mem}'

    cursor.execute(query)
    cursor.execute(query2)
    db.get_db().commit()
    return "Success"


@members.route('/<member_ID>tasks', methods=['GET'])
def mem_two(member_ID):
    # get request to TASK for all unfinished tasks that have the memberID
    cursor = db.get_db().cursor()
    cursor.execute(
        'select type, date_assigned, date_due, task_number, name, TASK.member_ID from TASK where TASK.member_ID = {0} AND completion_status = false'.format(member_ID))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response
