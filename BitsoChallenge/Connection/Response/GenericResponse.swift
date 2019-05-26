//
//  GenericResponse.swift
//  BitsoChallenge
//
//  Created by MacbookPro on 5/23/19.
//  Copyright © 2019 nut. All rights reserved.
//

import Foundation


class GenericResponse
{
    var code: Int = Int()
    var response: [String: Any]
    
    
    init(code: Int,response: [String: Any])
    {
        self.code = code
        self.response = response
    }
}
