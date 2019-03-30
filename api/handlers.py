# hey rathin, it's your friend Sam
# this is the file where we're gonna do all the computation

import json 
import psycopg2

conn = psycopg2.connect("dbname=club-fever user=postgres password=rathin")
conn_user = psycopg2.connect("dbname=club-fever user=postgres password=rathin")

cur = conn.cursor()



def get_user_data(username):
    #cur.execute("SELECT * FROM users WHERE username = " + "'username'")
    
    cur.execute("SELECT * from users WHERE username = '" + username + "'")
    rows = cur.fetchall()

    print(rows[0])


get_user_data("rathination")

def update_user_data(form):
        query = "UPDATE users SET username = %s, tags = %s, points = %i, badges_unlocked = %s WHERE username = '" + form["username"] + "'"
        cur.execute(query, 
        (
        form["tags"],
        form["points"],
        form["badges_unlocked"]
        ))

    return "success"

def get_events():
    event_template = {
    "id": 0,
    "event_name": "default", 
    "description": "default", 
    "start_time" : "default",
    "end_time" : "default",
    "tags": [], 
    "point_value": 0,
    "completed": False
    }

    events_holder = []

    cur.execute("SELECT * from events")
    rows = cur.fetchall()

    for row in rows:
        event_template["id"] = row[0]
        event_template["event_name"] = row[1]
        event_template["description"] = row[2]
        event_template["start_time"] = row[3]
        event_template["end_time"] = row[4]
        event_template["tags"] = row[5].split(",")
        event_template["point_value"] = row[6]
        event_template["completed"] = 0
        events_holder.append(events_holder)

    return events_holder
    
test = get_events()

def add_event(form):
    insert_query = "INSERT INTO events(event_name, description, start_time, end_time, tags, point_value, completed) VALUES (%s,%s,%s,%s,%s,%i,%i)"

    cur.execute(insert_query,(
        form["id"],
        form["event_name"],
        form["description"],
        form["start_time"],
        form["end_time"],
        form["tags"],
        form["point_value"],
        form["completed"]
    ))

    return "success"

def get_suggestions(tags):

    all_events = get_events()

    suggested_events = []

    for tag in tags:  
        for event in all_events:
            if tag in event["tags"]:
                suggested_events.append(event)



    return suggested_events
