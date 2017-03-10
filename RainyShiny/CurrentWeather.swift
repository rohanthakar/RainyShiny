//
//  CurrentWeather.swift
//  RainyShiny
//
//  Created by Rohan Thakar on 08/03/17.
//  Copyright © 2017 Reverie Works. All rights reserved.
//

import UIKit
import Alamofire

class CurrentWeather {
    
    var _cityName: String!
    var _date: String!
    var _weatherType: String!
    var _CurrentTemp: Double!
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        self._date = "Today, \(currentDate)"
        
        return _date
    }
    
    var cityName: String {
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var currentTemp: Double {
        if _CurrentTemp == nil {
            _CurrentTemp = 0.0
        }
        return _CurrentTemp
    }
    
    
    func downloadWeatherDetails(completed: @escaping DownloadComplete) {
        
        //Alamofire Download
        let currentWeatherURL = URL(string: CURRENT_WEATHER_URL)!
        Alamofire.request(currentWeatherURL).responseJSON { response in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let name = dict["name"] as? String {
                    self._cityName = name.capitalized
                }
                if let weather = dict["weather"] as? [Dictionary<String, AnyObject>] {
                    
                    if let main = weather[0]["main"] as? String {
                        self._weatherType = main.capitalized
                    }
                    
                }
                
                if let main = dict["main"] as? Dictionary<String, AnyObject> {
                    if let temp = main["temp"] as? Double {
                        //Calc temp and convert from K to C
                        
                        self._CurrentTemp = round(temp - 273.15)
                        //print("Current Temp \(self._CurrentTemp)")
                    }
                }
//                completed()
            }
            completed()
        }
       
       
    }
    
    

    
}
