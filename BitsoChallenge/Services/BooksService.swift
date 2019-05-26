//
//  BooksServices.swift
//  BitsoChallenge
//
//  Created by MacbookPro on 5/23/19.
//  Copyright © 2019 nut. All rights reserved.
//

import Foundation


class BooksService {
    
    static func getBooks(completion: @escaping (BooksResponse?, Error?) -> ()){
        Connection().get(url: "https://api.bitso.com/v3/available_books/",param: nil){(data,string) in
            do{
                let booksObject = try JSONDecoder().decode(BooksResponse.self, from: data!)
                //print(booksObject)
                completion(booksObject,nil)
            }catch(let error){
                completion(nil,error)
            }
        }
    }
    
    static func getLastPrice(param: [String: Any]?,completion: @escaping (TickerResponse?, Error?) -> ()){
        Connection().get(url: "https://api.bitso.com/v3/ticker/",param: param){(data,string) in
            do{
                //let result = try JSONSerialization.jsonObject(with: data!, options: []) as? [String:AnyObject]
                let booksObject = try JSONDecoder().decode(TickerResponse.self, from: data!)
                //print(booksObject)
            
                completion(booksObject,nil)
            }catch(let error){
                completion(nil,error)
            }
        }
    }
    
}
