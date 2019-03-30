from flask import Flask, abort, request
import json
from handlers import *

app = Flask(__name__)

@app.route("/user/<string:username>", methods=["GET", "POST"])
def users(username):
    if request.method == "GET":
        return get_user_data(username)
    if request.method == "POST":
        return update_user_data(request.form)

@app.route("/events", methods=["GET", "POST"])
def events():
    if request.method == "GET":
        date = request.args.get('date', '')
        return get_events(date)
    if request.method == "POST":
        return add_event(request.form)

@app.route("/suggestions/<string:username>", methods=["GET"])
def suggestions(username):
    if request.method == "GET":
        return get_suggestions(username)

app.run("0.0.0.0", 3737)
