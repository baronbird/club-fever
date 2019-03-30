# hey rathin, it's your friend Sam
# this is the file where we're gonna do all the computation

import json

def get_user_data(username):
    return {"username": username}

def update_user_data(form):
    return "success"

def get_events(date):
    return [{"name": "P-Fresh practice", "start_time": "7:00P", "end_time": "8:00P",
             "category": "Performing Arts", "skill": "intermediate"},
            {"name": "Juggling club", "start_time": "5:00P", "end_time": "6:00P",
             "category": "Hobby", "skill": "beginner"}]

def add_event(form):
    return "success"

def get_suggestions(username):
    return [{"name": "P-Fresh practice", "start_time": "7:00P", "end_time": "8:00P",
             "category": "Performing Arts", "skill": "intermediate"}]
