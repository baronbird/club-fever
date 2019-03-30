from flask import Flask, abort, request
import json
from handlers import *

app = Flask(__name__)

@app.route("/user/<string:username>", methods=["GET", "POST"])
def handle_users(username):
    if request.method == "GET":
        return get_user_data(username)
    if request.method == "POST":
        return create_user(username)

@app.route("/user/<string:username>/achievements", methods=["GET", "POST"])
def handle_user_achievements(username):
    if request.method == "GET":
        return get_user_achievements(username)
    if request.method == "POST":
        return add_user_achievements(username, request.get_json())

@app.route("/user/<string:username>/achievements/progress", methods=["GET"])
def handle_achievement_progress(username):
    return check_achievement_progress(username)

@app.route("/user/<string:username>/tags", methods=["GET", "POST"])
def handle_user_tags(username):
    if request.method == "GET":
        return get_user_tags(username)
    if request.method == "POST":
        return add_user_tags(username, request.get_json())

@app.route("/events", methods=["GET", "POST"])
def handle_events():
    if request.method == "GET":
        date = request.args.get('date', '')
        return get_events(date)
    if request.method == "POST":
        return add_event(request.get_json())

@app.route("/achievements", methods=["GET", "POST"])
def handle_achievements():
    if request.method == "GET":
        return json.dumps(get_achievements())
        """return json.dumps(
                {"result": "success",
                "achievements": [
                    {"name": "Jack of All Trades",
                     "description": "Attended events in 5 different categories"},
                    {"name": "Superfan", "description":
                     "Attended 20 games or events for one sports team"}
                    ]
                })"""
    if request.method == "POST":
        return add_achievement(request.get_json())

app.run("0.0.0.0", 3737)
