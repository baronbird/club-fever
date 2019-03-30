# hey rathin, it's your friend Sam
# this is the file where we're gonna do all the computation

import json 
import psycopg2

conn = psycopg2.connect("dbname=club_fever user=postgres password=postgres")
cur = conn.cursor()


def get_user_data(username):
    cur.execute("SELECT * from users WHERE username = '{}'".format(username))
    rows = cur.fetchall()

    print(rows[0])

# test
#get_user_data("rathination")

# creates user with given username
def create_user(username):
    cur.execute("SELECT username from users WHERE username = '{}'".format(username))
    rows = cur.fetchall()
    if len(rows) != 0:
        return {"result": "failure",
                "error": "username '{}' already taken".format(username)}

    query = "INSERT INTO users (username, points) VALUES ('{}', 0)".format(username)
    cur.execute(query)
    return {"result": "success", "username": username}

def get_events(date):
    event_template = {
    "id": 0,
    "event_name": "default", 
    "description": "default", 
    "date": "1970-01-01",
    "start_time": "default",
    "end_time": "default",
    "tags": [], 
    "point_value": 0,
    "completed": False
    }

    events_holder = []

    cur.execute("SELECT * from events WHERE date = '{}'".format(date))
    rows = cur.fetchall()

    for row in rows:
        event_template["id"] = row[0]
        event_template["event_name"] = row[1]
        event_template["description"] = row[2]
        event_template["date"] = row[3]
        event_template["start_time"] = row[4]
        event_template["end_time"] = row[5]
        event_template["tags"] = row[6]
        event_template["point_value"] = row[7]
        event_template["completed"] = row[8]

        events_holder.append(event_template)

    return {"result": "success", "events": events_holder}
    
# test
#test = get_events('2019-03-31')
#print(test)

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
