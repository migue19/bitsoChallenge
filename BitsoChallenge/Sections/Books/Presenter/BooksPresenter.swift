//
//  BooksPresenter.swift
//  BitsoChallenge
//
//  Created by MacbookPro on 5/22/19.
//  Copyright © 2019 nut. All rights reserved.
//

import Foundation

class BooksPresenter {
    weak var view: BooksViewController?
    var provider: BooksProvider?
    var wireframe: BooksWireFrame?
    
    
    init() {
    }
}


extension BooksPresenter: BooksViewEventHandler{
    func lastPrice(book: String) {
        provider?.getLastPrice(book: book)
    }
    
    func getBooks() {
        view?.progress?.startProgressView()
        provider?.getInfoBooks()
    }
}

extension BooksPresenter: BooksOutput{
    func sendLastPrice<T>(response: T) {
        DispatchQueue.main.async {
            self.view?.progress?.stopProgressView()
        }
        switch response {
        case is TickerModel:
            let book = response as! TickerModel
            view?.printLastPrice(book: book)
            break
        case is String:
            let error = response as! String
            Utils.showAlert(title: "Error", message: error, context: view!)
            break
        default:
            break
        }
    }
    
    func sendInfoBooks<T>(response: T) {
        DispatchQueue.main.async {
            self.view?.progress?.stopProgressView()
        }
        switch response {
        case is [PayloadResponse]:
            let books = response as! [PayloadResponse]
            view?.fillCollection(books: books)
            break
        case is String:
            let error = response as! String
            Utils.showAlert(title: "Error", message: error, context: view!)
            break
        default:
            break
        }
    }
    
    
}
