from flask import Flask, jsonify
from flask_restful import Resource, Api, reqparse
from typing_extensions import Required
import pandas as pd
import config
from rental import rental_bp
from flask_cors import CORS


def application():
    app = Flask(__name__)
    #app.config['SECRET_KEY'] = '1981'
    #app.config['CORS_HEADERS'] = 'Content-Type'

    cors = CORS(app, resources={r"/*": {"origins": "http://localhost:4200"}})
    api = Api(app)
    app.register_blueprint(rental_bp)
    return app


if __name__ == '__main__':
    application().run(debug=True)
