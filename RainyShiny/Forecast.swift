//
//  Forecast.swift
//  RainyShiny
//
//  Created by Rohan Thakar on 10/03/17.
//  Copyright © 2017 Reverie Works. All rights reserved.
//

import UIKit
import Alamofire

class Forecast {
    
    var _date: String!
    var _weatherType: String!
    var _highTemp: Double!
    var _lowTemp: Double!
    
    var date: String! {
        if _date == nil {
            _date = ""
        }
        return _date
    }
    var weatherType: String! {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var highTemp: Double {
        if _highTemp == nil {
            _highTemp = 0.0
        }
        return _highTemp
    }
    
    var lowTemp: Double {
        if _lowTemp == nil {
            _lowTemp = 0.0
        }
        return _lowTemp
    }
    
    init(weatherDict: Dictionary<String, AnyObject>) {
        
        if let temp = weatherDict["temp"] as? Dictionary<String, AnyObject> {
            
                        if let min = temp["min"] as? Double {
                            self._lowTemp = round(min-273.15)
                        }
            
                        if let max = temp["max"] as? Double {
                            self._highTemp = round(max-273.15 )
                        }
            
                    }
                    if let weather = weatherDict["weather"] as? [Dictionary<String, AnyObject>] {
            
                        if let main = weather[0]["main"] as? String {
                            self._weatherType = main
                        }
                    }
            
                    if let date = weatherDict["dt"] as? Double {
            
                        let unixConvertedDate = Date(timeIntervalSince1970: date)
                        let dateFormatter = DateFormatter()
                        dateFormatter.dateStyle = .full
                        dateFormatter.dateFormat = "EEEE"
                        dateFormatter.timeStyle = .none
                        self._date = unixConvertedDate.dayOfTheWeek()
                    }

    }
    
    
}

extension Date {
    func dayOfTheWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}






















