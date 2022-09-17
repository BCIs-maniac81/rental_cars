from flask_restful import Resource
from flask import Flask, jsonify
import config
import pandas as pd
from flask import Blueprint, render_template, g


# The prefix is defined on registration in facebook/__init__.py.
rental_bp = Blueprint('rental', __name__)


class Rental(Resource):
    @rental_bp.route('/rental/all', methods=['GET'])
    def getAll():
        data = pd.read_csv(config.vehicles_path)  # index_col='vehicleId'
        data = data.astype("string").T.to_dict()
        new_data = [j for i, j in data.items()]
        return {'data': new_data, 'message': 'Hello World'}, 200

    @rental_bp.route('/rental/preview', methods=['GET'])
    def getPreview():
        data = pd.read_csv(config.vehicles_path)  # index_col='vehicleId'
        data = data[['vehicleId', 'name', 'brand']]
        data = data.astype("string").T.to_dict()
        new_data = [j for i, j in data.items()]
        return {'data': new_data, 'message': 'Hello World'}, 200

    @rental_bp.route('/rental/<string:carid>', methods=['GET'])
    def getOneById(carid):
        data = pd.read_csv(config.vehicles_path)  # , index_col='vehicleId')
        if int(carid) in (data['vehicleId'].to_list()):
            n_data = (data[data['vehicleId'] == int(carid)]).T.to_dict()
            return {'data': list(n_data.values())[0], 'message': 'Hello World'}, 200
        else:
            return {'data': None, 'message': f"'{carid}' does not exist"}, 404
