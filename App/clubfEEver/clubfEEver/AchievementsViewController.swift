//
//  AchievementsViewController.swift
//  clubfEEver
//
//  Created by Abby Greentree on 3/30/19.
//  Copyright © 2019 Abby Greentree. All rights reserved.
//

import UIKit

class achievement {
    var name: String
    var category: Int
    var icon: UIImage?
    var has: Bool
    
    init?(name: String, category: Int, icon: UIImage?, has: Bool){
        self.name = name
        self.category = category
        self.icon = icon
        self.has = has
        
        if(name.isEmpty){
            return nil
        }
    }
}

var achievementList = [achievement]()

class AchievementsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // UI Conncection
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var backButton: UIBarButtonItem!
    
    // Variables
    let cellID: String = "AchievementsTableViewCell"
    
    
    //Functions
    override func viewDidLoad() {
        getAchievements()
        while (achievementList.count == 0){
            //Do Nothing
        }
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //tableView.register(AchievementsTableViewCell.self, forCellReuseIdentifier: cellID)

        // Do any additional setup after loading the view.
    }
    
    func loadsampleAchievements(){
        let photo1 = UIImage(named: "TrophyIcon.png")
        let ach1 = achievement(name: "Multicultural Badge", category: 0, icon: photo1, has: true)
        let ach2 = achievement(name: "Sports Events Badge", category: 2, icon: photo1, has: true)
        let ach3 = achievement(name: "McWell Badge", category: 1, icon: photo1, has: false)
        achievementList += [ach1!, ach2!, ach3!]
    }
        
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return achievementList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? AchievementsTableViewCell else{
            fatalError("The dequeued cell is not an instance of AchievementsViewCell.")
        }
    
        
        let ach = achievementList[indexPath.row]
        cell.achievementTitle.text = ach.name
        cell.achievementIcon.image = ach.icon
        
        return cell
    }
    
    
    
    
    @IBAction func clickBack(_ sender: Any) {
        performSegue(withIdentifier: "backAchievements", sender: self)
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
