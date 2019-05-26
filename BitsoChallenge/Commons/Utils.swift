//
//  Utils.swift
//  BitsoChallenge
//
//  Created by MacbookPro on 5/23/19.
//  Copyright © 2019 nut. All rights reserved.
//

import Foundation
import UIKit


class Utils {
    
    static func showAlert(title: String, message: String, context: UIViewController){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            switch action.style{
            case .default:
                print("default")
                break
            case .cancel:
                print("cancel")
                break
            case .destructive:
                print("destructive")
                break
                
            }}))
        context.present(alert, animated: true, completion: nil)
        
    }
}
