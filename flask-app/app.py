###
# Main application interface
###

# import the create app function
# that lives in src/__init__.py
from src import create_app
from src.leaders.leaders import leaders
from src.execs.execs import execs
from src.members.members import members
from src.scclients.scclients import scclients
from flask import Flask, jsonify
from flaskext.mysql import MySQL

# create the app object
# app = create_app()

app = Flask(__name__)

app.config['MYSQL_DATABASE_HOST'] = 'db'
app.config['MYSQL_DATABASE_PORT'] = 3306
app.config['MYSQL_DATABASE_USER'] = 'word'
app.config['MYSQL_DATABASE_PASSWORD'] = 'abc123'
app.config['MYSQL_DATABASE_DB'] = 'sc_app'

db_connection = MySQL()
db_connection.init_app(app)

app.register_blueprint(leaders, url_prefix='/lead')
app.register_blueprint(execs, url_prefix='/ex')
app.register_blueprint(members, url_prefix='/mem')
app.register_blueprint(scclients, url_prefix='/cli')


@app.route('/')
def db_testing():
    # what should home page be???
    cur = db_connection.get_db().cursor()
    cur.execute('select * from PROJECT')
    row_headers = [x[0] for x in cur.description]
    json_data = []
    theData = cur.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    return jsonify(json_data)


if __name__ == '__main__':
    # we want to run in debug mode (for hot reloading)
    # this app will be bound to port 4000.
    # Take a look at the docker-compose.yml to see
    # what port this might be mapped to...
    app.run(debug=True, host='0.0.0.0', port=4000)
