//
//  UIView.swift
//  BitsoChallenge
//
//  Created by MacbookPro on 5/23/19.
//  Copyright © 2019 nut. All rights reserved.
//

import Foundation
import UIKit

extension UIView{
    func addConstraintsWithFormat(format: String, views: UIView...)
    {
        var viewsDictionary = [String:UIView]()
        for (index,view) in views.enumerated()
        {
            let key = "v\(index)"
            viewsDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        //For xcode 10 use the next line
        //addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionary))
        //Else
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
    
    func AddViews(views: UIView...){
        for v in views{
            addSubview(v)
        }
    }
}
