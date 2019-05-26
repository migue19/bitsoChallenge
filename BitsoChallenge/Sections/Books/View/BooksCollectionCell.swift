//
//  BooksCollectionCell.swift
//  BitsoChallenge
//
//  Created by MacbookPro on 5/23/19.
//  Copyright © 2019 nut. All rights reserved.
//

import Foundation
import UIKit


class BooksCollectionCell: UICollectionViewCell {
    
    var imageTip: UIImageView!
    var labelDescription: UILabel!
    var labelLastPrice: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageTip = UIImageView()
        imageTip.contentMode = .scaleAspectFit
        imageTip.backgroundColor = .clear
        
        labelDescription = UILabel.getCustomLabel(text: "", alignment: .center, fontName: .bold, size: 14, color: UIColor.white)
        labelLastPrice = UILabel.getCustomLabel(text: "", alignment: .center, fontName: .regular, size: 12, color: UIColor.white)
        
        contentView.addSubview(imageTip)
        contentView.addSubview(labelDescription)
        contentView.addSubview(labelLastPrice)
        //contentView.backgroundColor = .red
        
        let distance = (self.frame.width - 40)/2
        contentView.addConstraintsWithFormat(format: "V:|-\(distance)-[v0]-\(distance)-|", views: imageTip)
        contentView.addConstraintsWithFormat(format: "H:|[v0]|", views: imageTip)
        
        contentView.addConstraintsWithFormat(format: "V:[v0]-5-[v1]", views: imageTip,labelDescription)
        contentView.addConstraintsWithFormat(format: "H:|[v0]|", views: labelDescription)
        
        contentView.addConstraintsWithFormat(format: "V:[v0]-2-[v1]", views: labelDescription,labelLastPrice)
        contentView.addConstraintsWithFormat(format: "H:|[v0]|", views: labelLastPrice)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
