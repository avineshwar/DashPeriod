//
//  PharmacyAnnotation.swift
//  MenstrualBuddy
//
//  Created by Shristi Hingle on 06/12/16.
//  Copyright © 2016 Shristi Hingle. All rights reserved.
//

import MapKit

class PharmacyAnnotation: NSObject, MKAnnotation
{
    let title:String?
    let subtitle:String?
    let coordinate: CLLocationCoordinate2D
    
    init(title: String?, subtitle:String?, coordinate: CLLocationCoordinate2D)
    {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
        
        super.init()
    }
}
