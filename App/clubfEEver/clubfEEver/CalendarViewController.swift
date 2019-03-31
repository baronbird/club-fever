//
//  CalendarViewController.swift
//  clubfEEver
//
//  Created by Abby Greentree on 3/30/19.
//  Copyright © 2019 Abby Greentree. All rights reserved.
//
class event {
    var name: String
    var desc: String
    var category: String
    var points: Int
    
    init?(name: String, desc: String, category: String, points: Int){
        self.name = name
        self.desc = desc
        self.category = category
        self.points = points
        
        if(name.isEmpty){
            return nil
        }
    }
}

var CalendarScreen = CalendarViewController()
var eventList: [event] = []

import UIKit

class CalendarViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // Outlets
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var dateView: UIView!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var backButton: UIBarButtonItem!
    
    //Variables
    let calendar = Calendar.current
    // Variables
    let cellID: String = "CalendarViewCell"
    var count: Int = 0;

    @IBAction func clickBackButton(_ sender: Any) {
        performSegue(withIdentifier: "openAchievements", sender: self)

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSampleEvents()
        
        //self.navBar.layer.zPosition = 1
    
        //calendar.component(.day, from: date)
        //self.dateLabel.text=calendar.dateComponents([.day], from: Date()) as String
        self.dateLabel.text = "30"
        self.dayLabel.text = "March"
        // Do any additional setup after loading the view.
        
        tableView.delegate = CalendarScreen
        tableView.dataSource = CalendarScreen
    }
    
    func addEvent(event: event){
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
        cell.eventName.text = event.name
        cell.eventDescription.text = event.desc
        cell.eventPoints.text = String(event.points)
        //cell.achievementIcon.image = ach.icon
        
        return cell
    }
    
    func loadSampleEvents() {
        let event1 = event(name: "LGBT BBQ", desc: "Inclusive Barbaque on North Quad, all are welcome.", category: "Multicultural", points: 500)
        let event2 = event(name: "Be Fine Day", desc: "Day to encourage all students to be their finest selves.", category: "Dorm", points: 350)
        let event3 = event(name: "Muddy Sunday", desc: "Charity event playing mud volleyball", category: "Dorm", points: 400)
        eventList += [event1!, event2!, event3!]
    }

}
