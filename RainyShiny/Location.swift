//
//  Location.swift
//  RainyShiny
//
//  Created by Rohan Thakar on 10/03/17.
//  Copyright © 2017 Reverie Works. All rights reserved.
//

import Foundation
import CoreLocation

class Location {
    
    static var sharedInstance = Location()
    private init() {}
    
    var latitude: Double!
    var longitude: Double!
   
}
