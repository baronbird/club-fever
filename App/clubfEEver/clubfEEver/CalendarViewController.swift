//
//  CalendarViewController.swift
//  clubfEEver
//
//  Created by Abby Greentree on 3/30/19.
//  Copyright © 2019 Abby Greentree. All rights reserved.
//

import UIKit
import MapKit

class event {
    var name: String
    var desc: String
    var date: String
    var locName: String
    var startTime: String
    var endTime: String
    var category: String
    var points: Int
    var latitude: Double
    var longitude: Double
    
    init?(name: String, desc: String, date: String, locName: String, startTime: String, endTime: String, category: String, points: Int, latitude: Double, longitude: Double){
        self.name = name
        self.desc = desc
        self.date = date
        self.locName = locName
        self.startTime = startTime
        self.endTime = endTime
        self.category = category
        self.points = points
        self.latitude = latitude
        self.longitude = longitude
        
        if(name.isEmpty){
            return nil
        }
        
    }
}

var CalendarScreen = CalendarViewController()

class CalendarViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // Outlets
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var dateView: UIView!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var backButton: UIBarButtonItem!
    
    //Variables
    //let calendar = Calendar.current
    // Variables
    let cellID: String = "CalendarViewCell"
    var count: Int = 0;

    @IBAction func clickBackButton(_ sender: Any) {
        performSegue(withIdentifier: "openAchievements", sender: self)

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        loadSampleEvents()
        getEvents()
    
        self.dateLabel.text = "1"
        self.dayLabel.text = "April"
        // Do any additional setup after loading the view.
        
        tableView.delegate = CalendarScreen
        tableView.dataSource = CalendarScreen
    }
    
    func addEvent(event: event) {
        eventList.append(event)
    }
    
    func clearEvents(){
        eventList = []
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? CalendarViewCell else{
            fatalError("The dequeued cell is not an instance of CalendarViewCell.")
        }
        
        let event = eventList[indexPath.row]
        
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm:ss"
        let newTimeFormatter = DateFormatter()
        newTimeFormatter.dateFormat = "h:mm a"
        
        var convertedStart: String = ""
        var convertedEnd: String = ""
        
        if let startTime = timeFormatter.date(from: event.startTime) {
            convertedStart = newTimeFormatter.string(from: startTime)
        }
        if let endTime = timeFormatter.date(from: event.endTime) {
            convertedEnd = newTimeFormatter.string(from: endTime)
        }
        
        let appendString = convertedStart + " - " + convertedEnd
        
        cell.eventName.text = event.name
        cell.eventTime.text = appendString
        cell.eventDescription.text = event.desc
        cell.eventPoints.text = String(event.points) + " pts"
        cell.locName.text = event.locName
        //cell.achievementIcon.image = ach.icon
        
        return cell
    }
    
    /*
    func loadSampleEvents() {
        let event1 = event(name: "LGBT BBQ", desc: "Inclusive Barbaque on North Quad, all are welcome.", category: "Multicultural", points: 500)
        let event2 = event(name: "Be Fine Day", desc: "Day to encourage all students to be their finest selves.", category: "Dorm", points: 350)
        let event3 = event(name: "Muddy Sunday", desc: "Charity event playing mud volleyball", category: "Dorm", points: 400)
        eventList += [event1!, event2!, event3!]
    }
    */

}
