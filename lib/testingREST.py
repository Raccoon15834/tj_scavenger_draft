#print('hello world')
import flask
from flask_restful import Resource, Api

app = flask.Flask(__name__)
api = Api(app)


class HelloWorld(Resource):
    def get(self):
        data = [
            'first',
            'API',
            'Response',
            'with',
            'random List',
            'python',
        ]

        return {
            'data': data,
        }


api.add_resource(HelloWorld, '/')

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=8080)