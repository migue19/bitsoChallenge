//
//  BooksInteractor.swift
//  BitsoChallenge
//
//  Created by MacbookPro on 5/22/19.
//  Copyright © 2019 nut. All rights reserved.
//

import Foundation

class BooksInteractor: BooksProvider {
    weak var output: BooksPresenter?
    
    func getLastPrice(book: String) {
        
        let param: [String: Any] = [
            "book": book
        ]
        BooksService.getLastPrice(param: param) { (response, error) in
            if error != nil
            {
                self.output?.sendLastPrice(response: error?.localizedDescription)
            }else{
                self.output?.sendLastPrice(response: response?.payload)
            }
        }
    }
    
    func getInfoBooks() {
        BooksService.getBooks(){(response,error) in
            if error != nil
            {
                self.output?.sendInfoBooks(response: error?.localizedDescription)
            }else{
                self.output?.sendInfoBooks(response: response?.payload)
            }
        }
    }
    
}
