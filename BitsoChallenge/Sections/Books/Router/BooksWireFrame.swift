//
//  BooksWireFrame.swift
//  BitsoChallenge
//
//  Created by MacbookPro on 5/22/19.
//  Copyright © 2019 nut. All rights reserved.
//

import Foundation
import UIKit

class BooksWireFrame{
    private var view: BooksViewController?
    private var presenter: BooksPresenter?
    private var interactor: BooksInteractor?
    private var navigation: UINavigationController?
    private var window: UIWindow?
    
    
    
    init(in window: UIWindow?) {
        view = BooksViewController()
        presenter = BooksPresenter()
        interactor = BooksInteractor()
    
        view?.eventHandler = self.presenter
        presenter?.view = self.view
        presenter?.provider = self.interactor
        interactor?.output = presenter
        presenter?.wireframe = self
        
        self.window = window
    }
    

}


extension BooksWireFrame{
    func showBooksView() {
        window?.rootViewController = UINavigationController(rootViewController: view!)
        window?.makeKeyAndVisible()
    }
}
