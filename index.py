from flask import Blueprint, jsonify

main = Blueprint('index', __name__)


@main.route("/")
def index():
    res = dict(code=0, msg='ok')
    return jsonify(res)
