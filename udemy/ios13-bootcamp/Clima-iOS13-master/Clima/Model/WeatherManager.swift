//
//  WeatherManager.swift
//  Clima
//
//  Created by Ken Mau on 2021-12-12.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=5b045bdb37cbba3cc246758eb1124df6&units=metric"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        // Create URL
        if let url = URL(string: urlString) {
            // Create URLSession
            let session = URLSession(configuration: .default)
            
            // Give Session a Task
            let task = session.dataTask(with: url, completionHandler: handle(data:response:error:))
            
            // Start the task
            task.resume()
        }
    }
        
    func handle(data: Data?, response: URLResponse?, error: Error?) {
        if let error = error {
            print(error)
            return
        }
        
        if let safeData = data {
            let dataString = String(data: safeData, encoding: .utf8)
            print(dataString)
        }
        
        // Check Data
    }
}
