import Foundation
import UIKit

let baseURL = "http://10.13.80.191:3737/"

func getAPIEndpoint(endpoint: String, callback: @escaping (Data?, URLResponse?, Error?) -> Void) {
    let url = baseURL + endpoint
    let request = URLRequest(url: NSURL(string: url)! as URL)
    let session = URLSession.shared
    
    let task = session.dataTask(with: request as URLRequest, completionHandler: callback)
    task.resume()
}

func getAchievements() -> Int{
    var count: Int = 0
    getAPIEndpoint(endpoint: "achievements") {(data, response, error) in
        if (error != nil) {
            print(error!)
        }
        else {
            let responseJSON = try? JSONSerialization.jsonObject(with: data!, options: [])
            if let responseDict = responseJSON! as? [String: Any] {
                let result = responseDict["result"] as? String
                if (result! == "success") {
                    let achievements = responseDict["achievements"] as? Array<[String: Any]>
                    AchieveScreen.clearAchievements()
                    for ach in achievements! {
                        let ach1 = achievement(name: ach["name"] as! String, desc: ach["description"] as! String, category: ach["category"] as! String, points: ach["points"] as! Int)
                        count = AchieveScreen.addAchievement(ach: ach1!)
                    }
                }
            }
        }
    }
    return count
}

func getLeaderboard() -> Int{
    var count: Int = 0
    getAPIEndpoint(endpoint: "leaderboard") {(data, response, error) in
        if (error != nil) {
            print(error!)
        }
        else {
            let responseJSON = try? JSONSerialization.jsonObject(with: data!, options: [])
            if let responseDict = responseJSON! as? [String: Any] {
                let result = responseDict["result"] as? String
                if (result! == "success") {
                    let allusers = responseDict["users"] as? Array<[String: Any]>
                    LeaderboardScreen.clearLeaderboard()
                    for user in allusers! {
                        let user1 = friend(name: user["username"] as! String, dorm: user["dorm"] as! String, points: user["points"] as! Int)
                        count = LeaderboardScreen.addLeaderboard(user: user1!)
                    }
                }
            }
        }
    }
    return count
}

func getEvents() {
    getAPIEndpoint(endpoint: "events?date=2019-04-01") {(data, response, error) in
        if (error != nil) {
            print(error!)
        }
        else {
            let responseJSON = try? JSONSerialization.jsonObject(with: data!, options: [])
            if let responseDict = responseJSON! as? [String: Any] {
                let result = responseDict["result"] as? String
                if (result! == "success") {
                    let allevents = responseDict["events"] as? Array<[String: Any]>
//                    ViewScreen.clearEvents()
                    if(eventList.count != 0) {
                        return
                    }
                    eventList = []
                    for e in allevents! {
                        let event1 = event(name: e["event_name"] as! String,
                                           desc: e["description"] as! String,
                                           date: e["date"] as! String,
                                           locName: e["loc_name"] as! String, 
                                           startTime: e["start_time"] as! String,
                                           endTime: e["end_time"] as! String,
                                           category: e["tag"] as! String,
                                           points: e["point_value"] as! Int,
                                           latitude: e["latitude"] as! Double,
                                           longitude: e["longitude"] as! Double)
//                        ViewScreen.addEvent(event: event1!)
                        eventList += [event1!]
                    }
                }
            }
        }
    }
}


func postToAPIEndpoint(endpoint: String, params: [String: Any]) {
    let url = baseURL + endpoint
    var request = URLRequest(url: URL(string: url)!)
    let jsonData = try? JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
    request.httpMethod = "POST"
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    request.addValue("application/json", forHTTPHeaderField: "Accept")
    request.httpBody = jsonData
    
    
    let task = URLSession.shared.dataTask(with: request as URLRequest) {(data, response, error) in
        if(error != nil) {
            print(error!)
        }
        else {
            let dataString = String(data: data!, encoding: .utf8)
            print(dataString!)
        }
    }
    
    task.resume()
}
