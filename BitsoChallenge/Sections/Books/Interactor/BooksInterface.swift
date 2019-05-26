//
//  BooksInterface.swift
//  BitsoChallenge
//
//  Created by MacbookPro on 5/22/19.
//  Copyright © 2019 nut. All rights reserved.
//

import Foundation

protocol BooksView {
    func fillCollection(books: [PayloadResponse]?)
}


protocol BooksOutput {
    func sendInfoBooks<T>(response: T)
    func sendLastPrice<T>(response: T)
}


protocol BooksProvider {
   func getInfoBooks()
   func getLastPrice(book: String)
}

protocol BooksViewEventHandler {
    func getBooks()
    func lastPrice(book: String)
    
}
