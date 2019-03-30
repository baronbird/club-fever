//
//  ViewController.swift
//  clubfEEver
//
//  Created by Abby Greentree on 3/29/19.
//  Copyright © 2019 Abby Greentree. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var buttonView: UIView!
    
    @IBOutlet weak var AchievementsButton: UIButton!
    
    @IBOutlet weak var userButton: UIButton!
    @IBOutlet weak var calendarButton: UIButton!
    @IBAction func clickAchievements(_ sender: Any) {
        performSegue(withIdentifier: "openAchievements", sender: self)
    }
    @IBAction func clickCalendar(_ sender: Any) {
        performSegue(withIdentifier: "openCalendar", sender: self)
    }
    @IBAction func clickUser(_ sender: Any) {
        performSegue(withIdentifier: "openUser", sender: self)
    }
    
    @IBOutlet weak var mapView: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let initialLocation = CLLocation(latitude: 41.703966, longitude: -86.237261)
        let regionRadius: CLLocationDistance = 250
        func centerMapOnLocation(location: CLLocation) {
            let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
            mapView.setRegion(coordinateRegion, animated: true)
        }
        
        centerMapOnLocation(location: initialLocation)
        
        self.view.bringSubviewToFront(buttonView)
    }


}

