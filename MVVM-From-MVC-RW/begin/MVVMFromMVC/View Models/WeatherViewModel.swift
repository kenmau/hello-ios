/// Copyright (c) 2021 Razeware LLC
/// 
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
/// 
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
/// 
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
/// 
/// This project and source code may use libraries or frameworks that are
/// released under various Open-Source licenses. Use of those libraries and
/// frameworks are governed by their own individual licenses.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import UIKit.UIImage

// Public to be accessible for testing
public class WeatherViewModel {
  static private let defaultAddress = "Toronto, ON"
  private let geocoder = LocationGeocoder()
  
  let locationName = Box("Loading...")
  let date = Box(" ")
  let icon: Box<UIImage?> = Box(nil)
  let summary = Box(" ")
  let forecastSummary = Box(" ")

  //  Different Methods to bind view model outputs to the view (https://www.raywenderlich.com/6733535-ios-mvvm-tutorial-refactoring-from-mvc)
  //  Key-Value Observing or KVO: A mechanism for using key paths to observe a property and get notifications when that property changes.
  //  Functional Reactive Programming or FRP: A paradigm for processing events and data as streams. Apple’s new Combine framework is its approach to FRP. RxSwift and ReactiveSwift are two popular frameworks for FRP.
  //  Delegation: Using delegate methods to pass notifications when values change.
  //  Boxing: Using property observers to notify observers that a value has changed.

  
  private let dateFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "EEEE, MMM d"
    return dateFormatter
  }()
  
  private let tempFormatter: NumberFormatter = {
    let tempFormatter = NumberFormatter()
    tempFormatter.numberStyle = .none
    return tempFormatter
  }()
  
  init() {
    changeLocation(to: Self.defaultAddress)
  }
  
  func changeLocation(to newLocation: String) {
    locationName.value = "New Location Loading..."
    geocoder.geocode(addressString: newLocation, callback: { [weak self] locations in
      guard let self = self else {return}
      if let location = locations.first {
        self.locationName.value = location.name
        self.fetchWeatherForLocation(location)
        return
      }
      
      self.locationName.value = "Not Found"
      self.date.value = ""
      self.icon.value = nil
      self.summary.value = ""
      self.forecastSummary.value = ""
    })
  }
  
  private func fetchWeatherForLocation(_ location: Location) {
    WeatherbitService.weatherDataForLocation(
      latitude: location.latitude,
      longitude: location.longitude) { [weak self] (weatherData, error) in
        guard
          let self = self,
          let weatherData = weatherData
        else {
          return
        }
        
        // Formats the weather items for the view to present
        self.date.value = self.dateFormatter.string(from: weatherData.date)
        self.icon.value = UIImage(named: weatherData.iconName)
        let temp = self.tempFormatter.string(from: weatherData.currentTemp as NSNumber) ?? ""
        self.summary.value = "\(weatherData.description) - \(temp)℉"
        self.forecastSummary.value = "\nSummary: \(weatherData.description)"
    }
  }
}
