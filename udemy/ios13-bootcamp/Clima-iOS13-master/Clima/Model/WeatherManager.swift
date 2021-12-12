//
//  WeatherManager.swift
//  Clima
//
//  Created by Ken Mau on 2021-12-12.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=5b045bdb37cbba3cc246758eb1124df6&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        // Create URL
        if let url = URL(string: urlString) {
            // Create URLSession
            let session = URLSession(configuration: .default)
            
            // Give Session a Task
            // Trailing closure
            let task = session.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    self.delegate?.didFailWithError(error: error)
                    return
                }
                
                if let safeData = data {
                    if let weather = self.parseJSON(safeData) {
                        // Delegate Pattern
                        self.delegate?.didUpdateWeather(self, weather: weather)
                        
//                        let weatherVC = WeatherViewController()
//                        weatherVC.didUpdateWeather()
                    }
                }
            }
            
            // Start the task
            task.resume()
        }
    }
    
    func parseJSON(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            
            return weather
        } catch {
            delegate?.didFailWithError(error: error)
            print(error)
            return nil
        }
    }
}
