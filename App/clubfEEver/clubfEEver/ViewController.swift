//
//  ViewController.swift
//  clubfEEver
//
//  Created by Abby Greentree on 3/29/19.
//  Copyright © 2019 Abby Greentree. All rights reserved.
//

import UIKit
import MapKit

class annotations: NSObject, MKAnnotation {
    var title: String?
    var locationName: String
    var coordinate: CLLocationCoordinate2D
    
    init(title: String, locationName: String, coordinate: CLLocationCoordinate2D){
        self.title = title
        self.locationName = locationName
        self.coordinate = coordinate
        
        super.init()
    }
    
    var subtitle: String? {
        return locationName
    }
}

var eventList: [event] = []

var ViewScreen = UIViewController()

class ViewController: UIViewController {
    //Outlets
    @IBOutlet weak var buttonView: UIView!
    @IBOutlet weak var achievementsButton: UIButton!
    @IBOutlet weak var userButton: UIButton!
    @IBOutlet weak var calendarButton: UIButton!
    @IBOutlet weak var mapView: MKMapView!
    
    //Segues
    @IBAction func clickAchievements(_ sender: Any) {
        performSegue(withIdentifier: "openAchievements", sender: self)
    }
    @IBAction func clickCalendar(_ sender: Any) {
        performSegue(withIdentifier: "openCalendar", sender: self)
    }
    @IBAction func clickUser(_ sender: Any) {
        performSegue(withIdentifier: "openUser", sender: self)
    }
    
    override func viewDidLoad() {
        getEvents()

        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let initialLocation = CLLocation(latitude: 41.703966, longitude: -86.237261)
        let regionRadius: CLLocationDistance = 250
        func centerMapOnLocation(location: CLLocation) {
            let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
            mapView.setRegion(coordinateRegion, animated: true)
        }
        
        centerMapOnLocation(location: initialLocation)
        
        for event in eventList {
            let annot = annotations(title: event.name, locationName: event.locName, coordinate: CLLocationCoordinate2D(latitude: event.latitude, longitude: event.longitude))
            mapView.addAnnotation(annot)
        }
        
        
        
        //Sample Annotation --- Make into a function
        //let event0 = Event(title: "LGBTQ BBQ", locationName: "North Quad", category: 3, coordinate: CLLocationCoordinate2D(latitude: 41.703966, longitude: -86.237261))
        //mapView.addAnnotation(event0)
        
        self.view.bringSubviewToFront(buttonView)
    }
    
    public func addEvent(event: event) {
        eventList.append(event)
    }
    
    public func clearEvents(){
        eventList = []
    }
}

