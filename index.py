from flask import Blueprint, jsonify

main = Blueprint('index', __name__)


@main.route("/")
def index():
    res = dict(code=0, msg='ok')
    return jsonify(res)


@main.route("/test", methods=['GET', 'POST'])
def test():
    res = dict(code=0, msg='test ok!')
    return jsonify(res)
