//
//  ProgressViewCustom.swift
//  BitsoChallenge
//
//  Created by MacbookPro on 5/24/19.
//  Copyright © 2019 nut. All rights reserved.
//

import Foundation
import UIKit
import Lottie


class ProgressViewCustom {
    var loaderTelmex: LOTAnimationView?
    var controller: UIViewController!
    var viewWithBlurredBackground: UIVisualEffectView?
    
    init(context: UIViewController) {
        controller = context
        
        
        loaderTelmex = LOTAnimationView(name: "loader")
        loaderTelmex?.center = context.view.center
        loaderTelmex?.tag = 220
        
        loaderTelmex?.loopAnimation = true
        loaderTelmex?.play()
        
        let effect = UIBlurEffect(style: .light)
        viewWithBlurredBackground = UIVisualEffectView(effect: effect)
        viewWithBlurredBackground?.frame = CGRect(x: 0, y: 0, width: controller.view.frame.size.width, height: controller.view.frame.size.height)
        viewWithBlurredBackground?.tag = 230
        viewWithBlurredBackground?.contentView.addSubview(loaderTelmex!)
    }
    
    
    
    func startProgressView(){
        controller.view.addSubview(viewWithBlurredBackground!)
        //loaderTelmex?.startAnimating()
    }
    
    func stopProgressView(){
        let vistas = controller.view.subviews
        
        for vista in vistas{
            if vista.tag == 220 || vista.tag == 230 {
                vista.removeFromSuperview()
            }
        }
    }
    
    deinit {
        //animationArray = nil
        loaderTelmex = nil
        controller = nil
        viewWithBlurredBackground = nil
    }
    
}
