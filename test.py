from flask import Flask

from index import main as index_routes


def configured_app():
    # web framework
    # web application
    # __main__
    _app = Flask(__name__)
    _app.register_blueprint(index_routes)

    return _app


app = configured_app()


if __name__ == '__main__':
    config = dict(
        debug=True,
        host='localhost',
        port=2000,
        threaded=True,
    )

    app.run(**config)
