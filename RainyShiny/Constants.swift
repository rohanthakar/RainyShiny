//
//  Constants.swift
//  RainyShiny
//
//  Created by Rohan Thakar on 08/03/17.
//  Copyright © 2017 Reverie Works. All rights reserved.
//

import Foundation



let BASE_URL = "http://api.openweathermap.org/data/2.5/"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="
let API_KEY = "602e060503297feca647b042e4122d2c"



typealias DownloadComplete = () -> ()

let CURRENT_WEATHER_URL = "\(BASE_URL)/weather?\(LATITUDE)\(Location.sharedInstance.latitude!)\(LONGITUDE)\(Location.sharedInstance.longitude!)\(APP_ID)\(API_KEY)"

let FORECAST_WEATHER_URL = "\(BASE_URL)/forecast/daily?\(LATITUDE)\(Location.sharedInstance.latitude!)\(LONGITUDE)\(Location.sharedInstance.longitude!)&cnt=10\(APP_ID)\(API_KEY)"
//print(CURRENT_WEATHER_URL)

