//
//  BaseViewController.swift
//  BitsoChallenge
//
//  Created by MacbookPro on 5/23/19.
//  Copyright © 2019 nut. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    func createView(){}
    func addViews(){}
    func setupLayout(){}
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createView()
        self.addViews()
        self.setupLayout()
    }

    
}
