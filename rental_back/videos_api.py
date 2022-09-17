from flask import Flask
from flask_restful import Api, Resource


app = Flask(__name__)
api = Api(app)


class MyClass(Resource):
    def get(self):
        return {'result': 'OK'}, 200


if __name__ == '__main__':
    app.run(debug=True)
