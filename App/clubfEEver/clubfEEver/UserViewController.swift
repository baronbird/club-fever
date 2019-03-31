//
//  UserViewController.swift
//  clubfEEver
//
//  Created by Abby Greentree on 3/30/19.
//  Copyright © 2019 Abby Greentree. All rights reserved.
//

import UIKit

class userItem {
    var title: String
    var points: Int
    
    init?(title: String, points: Int){
        self.title = title
        self.points = points
        
        if(title.isEmpty){
            return nil
        }
    }
    
}

var UserScreen = UserViewController()
var userItemList: [userItem] = []

class UserViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    //Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userIcon: UIImageView!
    @IBOutlet weak var backButton: UIBarButtonItem!
    
    @IBAction func clickBackButton(_ sender: Any) {
        performSegue(withIdentifier: "backUser", sender: self)
    }
    
    //Variables
    let cellID: String = "UserViewCell"
    var count: Int = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSamples()
        
        tableView.delegate = UserScreen
        tableView.dataSource = UserScreen

        // Do any additional setup after loading the view.
        
        let photo1 = UIImage(named: "rathination.png")
        self.userIcon.image = photo1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? UserViewCell else{
            fatalError("The dequeued cell is not an instance of UserViewCell.")
        }
        
        
        let userItem1 = userItemList[indexPath.row]
        cell.title.text = userItem1.title
        cell.points.text = String(userItem1.points)
        //cell.achievementIcon.image = ach.icon
        
        return cell
    }
    
    public func addUserItem(userI: userItem) {
        userItemList += [userI]
    }
    
    public func clearUserItems() {
        userItemList = []
    }
    
    func loadSamples() {
        let us1 = userItem(title: "Achievements", points: 12)
        let us2 = userItem(title: "Preferences", points: 0)
        let us3 = userItem(title: "Points", points: 15000)
        userItemList += [us1!, us2!, us3!]
    }
    
}
    

