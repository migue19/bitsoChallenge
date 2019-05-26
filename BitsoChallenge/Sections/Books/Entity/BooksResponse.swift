//
//  BooksResponse.swift
//  BitsoChallenge
//
//  Created by MacbookPro on 5/23/19.
//  Copyright © 2019 nut. All rights reserved.
//

import Foundation

class BooksResponse: NSObject, Codable {
    var success: Bool?
    var payload: [PayloadResponse] = [PayloadResponse]()
}


class PayloadResponse: Codable {
    var book: String?
    var minimum_price: String?
    var maximum_price: String?
    var minimum_amount: String?
    var maximum_amount: String?
    var minimum_value: String?
    var maximum_value: String?
    var ticker: TickerModel?
}


