//
//  LeaderboardViewController.swift
//  clubfEEver
//
//  Created by Abby Greentree on 3/30/19.
//  Copyright © 2019 Abby Greentree. All rights reserved.
//

import UIKit

class friend {
    var name: String
    var dorm: String
    var points: Int
    
    init?(name: String, dorm: String, points: Int){
        self.name = name
        self.dorm = dorm
        self.points = points
        
        if(name.isEmpty){
            return nil
        }
    }
}

var LeaderboardScreen = LeaderboardViewController()
var userList: [friend] = []
var count: Int = 0

class LeaderboardViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var backButton: UIBarButtonItem!
    
    //Variables
    let cellID: String = "LeaderboardViewCell"
    
    
    override func viewDidLoad() {
        count = getLeaderboard()
        
        super.viewDidLoad()

        tableView.delegate = LeaderboardScreen
        tableView.dataSource = LeaderboardScreen

        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userList.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? LeaderboardViewCell else{
            fatalError("The dequeued cell is not an instance of LeaderboardViewCell.")
        }
        
        
        let user = userList[indexPath.row]
        cell.userName.text = user.name
        cell.userDorm.text = user.dorm
        cell.userPoints.text = String(user.points) + " pts"
        
        return cell
    }
    
    func loadsampleUsers(){
        userList = []
        
        let user1 = friend(name: "Rathin Kacham", dorm: "Keenan", points: 1250)
        let user2 = friend(name: "Sam Berning", dorm: "Keenan", points: 750)
        let user3 = friend(name: "Abby Greentree", dorm: "Farley", points: 500)
        userList += [user1!, user2!, user3!]
    }
    
    @IBAction func clickBack(_ sender: Any) {
         performSegue(withIdentifier: "backLeaderboard", sender: self)
    }
    

    public func addLeaderboard(user: friend) -> Int{
        userList += [user]
        return userList.count
    }
    
    public func clearLeaderboard() {
        userList = []
    }
  
}
