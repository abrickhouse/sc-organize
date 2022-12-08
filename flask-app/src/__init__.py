# Some set up for the application

from flask import Flask
from flaskext.mysql import MySQL

# create a MySQL object that we will use in other parts of the API
db = MySQL()


def create_app():
    app = Flask(__name__)

    # secret key that will be used for securely signing the session
    # cookie and can be used for any other security related needs by
    # extensions or your application
    app.config['SECRET_KEY'] = 'someCrazyS3cR3T!Key.!'

    # these are for the DB object to be able to connect to MySQL.
    app.config['MYSQL_DATABASE_USER'] = 'word'
    app.config['MYSQL_DATABASE_PASSWORD'] = 'abc123'
    app.config['MYSQL_DATABASE_HOST'] = 'db'
    app.config['MYSQL_DATABASE_PORT'] = 3306
    # Change this to your DB name
    app.config['MYSQL_DATABASE_DB'] = 'sc_app'

    # Initialize the database object with the settings above.
    db.init_app(app)

    # Import the various routes
    from src.views import views
    # from src.customers.customers import customers
    # from src.products.products import products
    from src.leaders.leaders import leaders
    # from src.execs.execs import execs
    from src.execs.execs import execs
    from src.members.members import members
    from src.scclients.scclients import scclients

    # Register the routes that we just imported so they can be properly handled
    app.register_blueprint(views)
    # app.register_blueprint(customers,   url_prefix='/classic')
    # app.register_blueprint(products,    url_prefix='/classic')

    app.register_blueprint(leaders, url_prefix='/lead')
    app.register_blueprint(execs, url_prefix='/ex')
    app.register_blueprint(members, url_prefix='/mem')
    app.register_blueprint(scclients, url_prefix='/cli')

    return app
