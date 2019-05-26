//
//  TickerResponse.swift
//  BitsoChallenge
//
//  Created by MacbookPro on 5/24/19.
//  Copyright © 2019 nut. All rights reserved.
//

import Foundation

class TickerResponse: NSObject,Codable {
    var success: Bool?
    var payload: TickerModel?
}

class TickerModel: Codable {
    var high: String?
    var last: String?
    var created_at: String?
    var book: String?
    var volume: String?
    var vwap: String?
    var low: String?
    var ask: String?
    var bid: String?
    var change_24: String?
}
