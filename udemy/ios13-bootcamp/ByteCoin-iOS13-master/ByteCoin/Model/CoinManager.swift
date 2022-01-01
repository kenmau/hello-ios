//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    func didUpdateExchangeRate(_ coinManager: CoinManager, exchangeRate: ExchangeRateModel)
    func didFailWithError(error: Error)
}

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "DEB9C349-1009-40B2-AF50-0FB85A1058C2"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    var delegate: CoinManagerDelegate?

    func getCoinPrice(for currency: String) {
        let url = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        
        performRequest(with: url)
    }
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    self.delegate?.didFailWithError(error: error)
                    return
                }
                
                if let data = data {
                    if let exchangeRate = self.parseJSON(data) {
                        self.delegate?.didUpdateExchangeRate(self, exchangeRate: exchangeRate)
                    }
                }
            }
            
            task.resume()
        }
    }
    
    func parseJSON(_ exchangeRateData: Data) -> ExchangeRateModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(ExchangeRateData.self, from: exchangeRateData)
            
            // Map the attributes from the JSON data struct to our model
            let rate = decodedData.rate
            let currency = decodedData.asset_id_quote
            
            let exchangeRate = ExchangeRateModel(rate: rate, currency: currency)
            
            return exchangeRate
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
}
