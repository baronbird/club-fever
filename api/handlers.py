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
    events_holder = []

    cur.execute("SELECT * from events WHERE date = '{}'".format(date))
    rows = cur.fetchall()

    for row in rows:
        event_template = {}
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

def fetch_achievements_from_db():
    ach_holder = []

    cur.execute("SELECT * from achievements")
    rows = cur.fetchall()

    for row in rows:
        ach_template = {}
        ach_template["id"] = row[0]
        ach_template["name"] = row[1]
        ach_template["description"] = row[2]
        ach_template["category"] = row[3]
        ach_template["points"] = row[4]
        ach_template["threshold"] = row[5]

        ach_holder.append(ach_template)

    return ach_holder


def get_achievements():
    ach_holder = fetch_achievements_from_db()

    return {"result": "success", "achievements": ach_holder}

def check_achievement_progress(user):
    ach_holder = fetch_achievements_from_db()

    achieved = []

    cur.execute("SELECT badges_unlocked from users WHERE username='{}'".format(user))
    badges_unlocked = cur.fetchall()[0][0]

    for ach in ach_holder:
        if ach["id"] in badges_unlocked:
            continue

        cat = ach["category"]
        if cat == "General":
            continue
        cur.execute("SELECT {} from user_stats WHERE username='{}'".format(cat, user))
        rows = cur.fetchall()

        if len(rows) < 1:
            return {"result": "failure", "error": "user '{}' does not exist".format(user)}
        if rows[0][0] >= ach["threshold"] and ach["threshold"] is not None:
            print("achieved "+str(ach["id"]))
            achieved.append(ach["id"])

    i = len(badges_unlocked) + 1
    for ach_id in achieved:
        query = "UPDATE users SET badges_unlocked[{}]={} WHERE username='{}'".format(i, ach_id, user)
        cur.execute(query)
        conn.commit()
        i += 1
    return {"result": "success", "achieved": achieved}

#test
#check_achievement_progress("rathination")
