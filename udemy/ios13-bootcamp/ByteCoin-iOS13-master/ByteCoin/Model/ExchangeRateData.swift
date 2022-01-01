//
//  ExchangeRateModel.swift
//  ByteCoin
//
//  Created by Ken Mau on 2021-12-31.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct ExchangeRateData: Codable {
    let time: String //"2017-08-09T14:31:18.3150000Z",
    let asset_id_base: String // "BTC",
    let asset_id_quote: String // "USD",
    let rate: Double // 3260.3514321215056208129867667
}
