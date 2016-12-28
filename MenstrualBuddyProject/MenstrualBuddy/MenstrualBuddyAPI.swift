//
//  MenstrualBuddyAPI.swift
//  MenstrualBuddy
//
//  Created by Shristi Hingle on 06/12/16.
//  Copyright © 2016 Shristi Hingle. All rights reserved.
//

import Foundation
import QuadratTouch
import MapKit
import RealmSwift

struct API {
    struct notifications {
        static let venuesUpdated = "venues_updated"
    }
}

class MenstrualBuddyAPI
{
    static let sharedInstance = MenstrualBuddyAPI()
    var session:Session?
    init()
    {
        // Initialize the Foursquare client
        let client = Client(clientID: "HTXZBH3HO0Q2V5OFPYWF1KHEHIGRLVBC0TY20K1A13TCFKXP", clientSecret: "0GVFFE5NMQK5TI42XMPPBBTFPVDH4A30LEEK5GTLOGODATA2", redirectURL: "")
        
        let configuration = Configuration(client:client)
        Session.setupSharedSessionWithConfiguration(configuration)
        
        self.session = Session.sharedSession()
    }
    
    func getPharmacyWithLocation(location:CLLocation)
    {
        if let session = self.session
        {
            var parameters = location.parameters()
            parameters += [Parameter.categoryId: "4bf58dd8d48988d10f951735"]
            parameters += [Parameter.radius: "2000"]
            parameters += [Parameter.limit: "50"]
            
            // Start a "search", i.e. an async call to Foursquare that should return venue data
            let searchTask = session.venues.search(parameters)
            {
                (result) -> Void in
                
                if let response = result.response
                {
                    if let venues = response["venues"] as? [[String: AnyObject]]
                    {
                        autoreleasepool
                            {
                                let realm = try! Realm()
                                realm.beginWrite()
                                
                                for venue:[String: AnyObject] in venues
                                {
                                    let venueObject:Venue = Venue()
                                    
                                    if let id = venue["id"] as? String
                                    {
                                        venueObject.id = id
                                    }
                                    
                                    if let name = venue["name"] as? String
                                    {
                                        venueObject.name = name
                                    }
                                    
                                    if  let location = venue["location"] as? [String: AnyObject]
                                    {
                                        if let longitude = location["lng"] as? Float
                                        {
                                            venueObject.longitude = longitude
                                        }
                                        
                                        if let latitude = location["lat"] as? Float
                                        {
                                            venueObject.latitude = latitude
                                        }
                                        
                                        if let formattedAddress = location["formattedAddress"] as? [String]
                                        {
                                            venueObject.address = formattedAddress.joined(separator: " ")
                                        }
                                    }
                                    
                                    realm.add(venueObject, update: true)
                                }
                                
                                do {
                                    try realm.commitWrite()
                                    print("Committing write...")
                                }
                                catch (let e)
                                {
                                    print("Y U NO REALM ? \(e)")
                                }
                        }
                        
                       NotificationCenter.default.post(name: NSNotification.Name(rawValue: API.notifications.venuesUpdated), object: nil, userInfo: nil)
                    }
                }
            }
            
            searchTask.start()
        }
    }
}
extension CLLocation
{
    func parameters() -> Parameters
    {
        let ll      = "\(self.coordinate.latitude),\(self.coordinate.longitude)"
        let llAcc   = "\(self.horizontalAccuracy)"
        let alt     = "\(self.altitude)"
        let altAcc  = "\(self.verticalAccuracy)"
        let parameters = [
            Parameter.ll:ll,
            Parameter.llAcc:llAcc,
            Parameter.alt:alt,
            Parameter.altAcc:altAcc
        ]
        return parameters
    }
}
