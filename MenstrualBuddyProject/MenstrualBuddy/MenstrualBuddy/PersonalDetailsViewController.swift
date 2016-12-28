//
//  PersonalDetailsViewController.swift
//  MenstrualBuddy
//
//  Created by Shristi Hingle on 02/11/16.
//  Copyright © 2016 Shristi Hingle. All rights reserved.
//

import UIKit
import HealthKit
import MapKit
import RealmSwift


import UIKit
import MapKit
import RealmSwift

class PersonalDetailsViewController: UIViewController, CLLocationManagerDelegate, UITableViewDataSource, UITableViewDelegate, MKMapViewDelegate
{
    @IBOutlet var mapView:MKMapView?
    
    @IBOutlet var tableView:UITableView?
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    var locationManager:CLLocationManager?
    
    var lastLocation:CLLocation?

    var venues:[Venue]?
    
    /// Span in meters for map view and data filtering
    let distanceSpan:Double = 500;
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        if revealViewController() != nil {
                        revealViewController().rearViewRevealWidth = 200
                        menuButton.target = revealViewController()
                        menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
                        view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }

        
        NotificationCenter.default.addObserver(self, selector: #selector(PersonalDetailsViewController.onVenuesUpdated(notification:)), name: NSNotification.Name(rawValue: API.notifications.venuesUpdated), object: nil)
    }
    
    func refreshVenues(location: CLLocation?, getDataFromFoursquare:Bool = false)
    {

        if location != nil
        {
            lastLocation = location;
        }
        
        if let location = lastLocation
        {
            if getDataFromFoursquare == true
            {
                MenstrualBuddyAPI.sharedInstance.getPharmacyWithLocation(location: location)
            }
            
    
            let (start, stop) = calculateCoordinatesWithRegion(location: location);
            
            let predicate = NSPredicate(format: "latitude < %f AND latitude > %f AND longitude > %f AND longitude < %f", start.latitude, stop.latitude, start.longitude, stop.longitude);
            
            let realm = try! Realm();
            
            venues = realm.objects(Venue.self).filter(predicate).sorted {
                location.distance(from: $0.coordinate) < location.distance(from: $1.coordinate);
            };
            
            for venue in venues!
            {
                let annotation = PharmacyAnnotation(title: venue.name, subtitle: venue.address, coordinate: CLLocationCoordinate2D(latitude: Double(venue.latitude), longitude: Double(venue.longitude)));
                
                mapView?.addAnnotation(annotation);
            }
            
                tableView?.reloadData();
        }
    }
    
    func calculateCoordinatesWithRegion(location:CLLocation) -> (CLLocationCoordinate2D, CLLocationCoordinate2D)
    {
        let region = MKCoordinateRegionMakeWithDistance(location.coordinate, distanceSpan, distanceSpan);
        
        var start:CLLocationCoordinate2D = CLLocationCoordinate2D();
        var stop:CLLocationCoordinate2D = CLLocationCoordinate2D();
        
        start.latitude  = region.center.latitude  + (region.span.latitudeDelta  / 2.0);
        start.longitude = region.center.longitude - (region.span.longitudeDelta / 2.0);
        stop.latitude   = region.center.latitude  - (region.span.latitudeDelta  / 2.0);
        stop.longitude  = region.center.longitude + (region.span.longitudeDelta / 2.0);
        
        return (start, stop);
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated);
        
        if let tableView = self.tableView
        {
            tableView.delegate = self;
            tableView.dataSource = self;
        }
        
        if let mapView = self.mapView
        {
            mapView.delegate = self;
        }
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        if locationManager == nil
        {
            locationManager = CLLocationManager();
            
            locationManager!.delegate = self;
            locationManager!.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
            locationManager!.requestAlwaysAuthorization();
            locationManager!.distanceFilter = 50; // Don't send location updates with a distance smaller than 50 meters between them
            locationManager!.startUpdatingLocation();
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        if let mapView = self.mapView
        {
            let region = MKCoordinateRegionMakeWithDistance((locations.last?.coordinate)!, distanceSpan, distanceSpan);
            mapView.setRegion(region, animated: true);
            
            refreshVenues(location: locations.last, getDataFromFoursquare: true)
        }
    }
    
    func onVenuesUpdated(notification:NSNotification)
    {
        refreshVenues(location: nil);
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return venues?.count ?? 0;
    }
    
    func numberOfSections(in tableView: UITableView) -> Int     {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier");
        
        if cell == nil
        {
            cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "cellIdentifier");
        }
        
        if let venue = venues?[indexPath.row]
        {
            cell!.textLabel?.text = venue.name;
            cell!.detailTextLabel?.text = venue.address;
        }
        
        return cell!;
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?
    {
        if annotation.isKind(of: MKUserLocation.self)
        {
            return nil;
        }
        
        var view = mapView.dequeueReusableAnnotationView(withIdentifier: "annotationIdentifier");
        
        if view == nil
        {
            view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "annotationIdentifier");
        }
        
        view?.canShowCallout = true;
        
        return view;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if let venue = venues?[indexPath.row]
        {
            let region = MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2D(latitude: Double(venue.latitude), longitude: Double(venue.longitude)), distanceSpan, distanceSpan);
            mapView?.setRegion(region, animated: true);
        }
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning();
    }
}
