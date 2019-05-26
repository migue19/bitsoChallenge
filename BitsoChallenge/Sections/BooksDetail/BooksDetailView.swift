//
//  BooksDetailView.swift
//  BitsoChallenge
//
//  Created by MacbookPro on 5/24/19.
//  Copyright © 2019 nut. All rights reserved.
//

import Foundation
import UIKit


class BooksDetailView: BaseViewController
{
    var delegate: PopupBooksDetailProtocolo!
    var blurEffectView: UIVisualEffectView?
    var ticker: TickerModel?
    
    
    var contentView: UIView!
    
    var imageRestart: UIImageView!
    
    var labelTitle: UILabel!
    var labelBid: UILabel!
    var labelBidDescription: UILabel!
    var labelAsk: UILabel!
    var labelAskDescription: UILabel!
    var labelLow: UILabel!
    var labelLowDescription: UILabel!
    var labelHigh: UILabel!
    var labelHighDescription: UILabel!
    var label24: UILabel!
    var label24Description: UILabel!
    var labelSpread: UILabel!
    var labelSpreadDescription: UILabel!
    
    
    var buttonAccept: UIButton!
    
    
    override func createView() {
        //view.backgroundColor = Constants.BLACK_TRANSPARENT_COLOR
        view.backgroundColor = .clear
        
        //let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
        blurEffectView = UIVisualEffectView(effect: nil)
        blurEffectView?.frame = self.view.bounds
        blurEffectView?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        contentView = UIView()
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 10
        
        imageRestart = UIImageView(image: UIImage(named: "bitso"))
        
        labelTitle = UILabel.getCustomLabel(text: "BTC_MXN", alignment: .center, fontName: .light, size: 20, color: UIColor.black)
        
        labelBid = UILabel.getCustomLabel(text: "Bid:", alignment: .center, fontName: .bold, size: 15, color: UIColor.black)
        
        labelBidDescription = UILabel.getCustomLabel(text: "153800.05", alignment: .center, fontName: .light, size: 15, color: UIColor.black)
        
        labelAsk = UILabel.getCustomLabel(text: "Ask:", alignment: .center, fontName: .bold, size: 15, color: UIColor.black)
        
        labelAskDescription = UILabel.getCustomLabel(text: "143800.05", alignment: .center, fontName: .light, size: 15, color: UIColor.black)
        
        labelLow = UILabel.getCustomLabel(text: "Low:", alignment: .center, fontName: .bold, size: 15, color: UIColor.black)
        
        labelLowDescription = UILabel.getCustomLabel(text: "133800.05", alignment: .center, fontName: .light, size: 15, color: UIColor.black)
        
        labelHigh = UILabel.getCustomLabel(text: "High:", alignment: .center, fontName: .bold, size: 15, color: UIColor.black)
        
        labelHighDescription = UILabel.getCustomLabel(text: "123800.05", alignment: .center, fontName: .light, size: 15, color: UIColor.black)
        
        label24 = UILabel.getCustomLabel(text: "24h Volume:", alignment: .center, fontName: .bold, size: 15, color: UIColor.black)
        
        label24Description = UILabel.getCustomLabel(text: "113800.05", alignment: .center, fontName: .light, size: 15, color: UIColor.black)
        
        labelSpread = UILabel.getCustomLabel(text: "Spread:", alignment: .center, fontName: .bold, size: 15, color: UIColor.black)
        
        labelSpreadDescription = UILabel.getCustomLabel(text: "103800.05", alignment: .center, fontName: .light, size: 15, color: UIColor.black)
        
        
        
        buttonAccept = UIButton()
        buttonAccept.setTitle("Aceptar", for: .normal)
        buttonAccept.setTitleColor(UIColor.white, for: .normal)
        buttonAccept.layer.cornerRadius = 20
        buttonAccept.backgroundColor = UIColor.BITSO_GREEN_COLOR
        buttonAccept.layer.borderColor = UIColor.BITSO_GREEN_COLOR.cgColor
        buttonAccept.layer.borderWidth = 1
        buttonAccept.addTarget(self, action: #selector(cancelButtonPressed), for: .touchUpInside)
        
       
    }
    
    override func addViews() {
        view.addSubview(blurEffectView!)
        view.addSubview(contentView)
        
        
        contentView.addSubview(imageRestart)
        contentView.addSubview(labelTitle)
        contentView.addSubview(labelBid)
        contentView.addSubview(labelBidDescription)
        contentView.addSubview(labelAsk)
        contentView.addSubview(labelAskDescription)
        contentView.addSubview(labelLow)
        contentView.addSubview(labelLowDescription)
        contentView.addSubview(labelHigh)
        contentView.addSubview(labelHighDescription)
        contentView.addSubview(label24)
        contentView.addSubview(label24Description)
        contentView.addSubview(labelSpread)
        contentView.addSubview(labelSpreadDescription)
        contentView.addSubview(buttonAccept)
        
    }
    
    override func setupLayout() {
        var distance = (view.frame.height - 400) / 2
        view.addConstraintsWithFormat(format: "V:|-\(distance)-[v0]-\(distance)-|", views: contentView)
        view.addConstraintsWithFormat(format: "H:|-30-[v0]-30-|", views: contentView)
        
        
        
        contentView.addConstraintsWithFormat(format: "V:|-45-[v0(43)]", views: imageRestart)
        distance = (view.frame.width - 100) / 2
        contentView.addConstraintsWithFormat(format: "H:|-\(distance)-[v0]-\(distance)-|", views: imageRestart)
        
        contentView.addConstraintsWithFormat(format: "V:[v0]-15-[v1]", views: imageRestart,labelTitle)
        contentView.addConstraintsWithFormat(format: "H:|-20-[v0]-20-|", views: labelTitle)
        
        contentView.addConstraintsWithFormat(format: "V:[v0]-20-[v1]", views: labelTitle,labelBid)
        contentView.addConstraintsWithFormat(format: "H:|-50-[v0]", views: labelBid)
        
        contentView.addConstraintsWithFormat(format: "V:[v0]-20-[v1]", views: labelTitle,labelBidDescription)
        contentView.addConstraintsWithFormat(format: "H:[v0]-10-[v1]", views: labelBid,labelBidDescription)
        
        contentView.addConstraintsWithFormat(format: "V:[v0]-10-[v1]", views: labelBid,labelAsk)
        
        contentView.addConstraintsWithFormat(format: "V:[v0]-10-[v1]", views: labelBidDescription,labelAskDescription)
        contentView.addConstraintsWithFormat(format: "H:|-50-[v0]-10-[v1]", views: labelAsk,labelAskDescription)
        
        contentView.addConstraintsWithFormat(format: "V:[v0]-10-[v1]", views: labelAsk,labelLow)
        
        contentView.addConstraintsWithFormat(format: "V:[v0]-10-[v1]", views: labelAskDescription,labelLowDescription)
        contentView.addConstraintsWithFormat(format: "H:|-50-[v0]-10-[v1]", views: labelLow,labelLowDescription)
        
        
        contentView.addConstraintsWithFormat(format: "V:[v0]-10-[v1]", views: labelLow,labelHigh)
        
        contentView.addConstraintsWithFormat(format: "V:[v0]-10-[v1]", views: labelLowDescription,labelHighDescription)
        contentView.addConstraintsWithFormat(format: "H:|-50-[v0]-10-[v1]", views: labelHigh,labelHighDescription)
        
        contentView.addConstraintsWithFormat(format: "V:[v0]-10-[v1]", views: labelHigh,label24)
        
        contentView.addConstraintsWithFormat(format: "V:[v0]-10-[v1]", views: labelHighDescription,label24Description)
        contentView.addConstraintsWithFormat(format: "H:|-50-[v0]-10-[v1]", views: label24,label24Description)
        
        contentView.addConstraintsWithFormat(format: "V:[v0]-10-[v1]", views: label24,labelSpread)
        
        contentView.addConstraintsWithFormat(format: "V:[v0]-10-[v1]", views: label24Description,labelSpreadDescription)
        contentView.addConstraintsWithFormat(format: "H:|-50-[v0]-10-[v1]", views: labelSpread,labelSpreadDescription)
        
        
        
        
        distance = (view.frame.width - 120) / 2
        contentView.addConstraintsWithFormat(format: "V:[v0(40)]-30-|", views: buttonAccept)
        contentView.addConstraintsWithFormat(format: "H:|-20-[v0]-20-|", views: buttonAccept)
        
        
        
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        labelTitle.text = ticker?.book?.uppercased()
        labelBidDescription.text = ticker?.bid
        labelAskDescription.text = ticker?.ask
        labelLowDescription.text = ticker?.low
        labelHighDescription.text = ticker?.high
        label24Description.text = ticker?.change_24
        
        guard let bidString: String = ticker?.bid else{
            return
        }
        
        guard let askString: String = ticker?.ask else{
            return
        }
        
        let bid: Double = Double(bidString) ?? 0.0
        let ask: Double = Double(askString) ?? 0.0
        let spread = bid - ask
        
        labelSpreadDescription.text = String(spread)
        
        
    }
    
    @objc func cancelButtonPressed() {
        print("Cancelado")
        self.dismiss(animated: true, completion: nil)
    }
    
   
    
    override func viewWillDisappear(_ animated: Bool) {
        //self.blurEffectView?.effect = UIBlurEffect(style: UIBlurEffect.Style.extraLight)
        self.view.backgroundColor = .clear
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.5) {
            //self.blurEffectView?.effect = UIBlurEffect(style: UIBlurEffect.Style.extraLight)
            self.view.backgroundColor = UIColor.BLACK_TRANSPARENT_COLOR
        }
        
        //UIView.animate(withDuration: 6.0, delay: 0.5, options: .autoreverse, animations: <#T##() -> Void#>, completion: <#T##((Bool) -> Void)?##((Bool) -> Void)?##(Bool) -> Void#>)
        //self.view.backgroundColor = Constants.BLACK_TRANSPARENT_COLOR
        /*let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
         let blurEffectView = UIVisualEffectView(effect: blurEffect)
         blurEffectView.frame = self.view.bounds
         blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
         self.view.insertSubview(blurEffectView, at: 0)*/
        //}
    }
    
    
}


