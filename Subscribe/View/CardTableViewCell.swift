//
//  CardTableViewCell.swift
//  Subscribe
//
//  Created by Tushar Singh on 15/09/20.
//  Copyright © 2020 Tushar Singh. All rights reserved.
//

import UIKit

class CardTableViewCell: UITableViewCell {

    var card = CardView()
//    var shadowView = UIView(frame: CGRect(x: 0, y: 0, width: 323, height: 170))
    
    @IBOutlet var shadowView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        shadowView.layer.cornerRadius = 10
        
        card.layer.cornerRadius = 10
        clipsToBounds = true
        shadowView.layer.shadowPath =
        UIBezierPath(roundedRect: card.bounds,
        cornerRadius: layer.cornerRadius).cgPath
        shadowView.layer.shadowColor = UIColor.gray.cgColor
        shadowView.layer.shadowOpacity = 0.55
        shadowView.layer.shadowOffset = CGSize(width: 2, height: 5)
        shadowView.layer.shadowRadius = 5
        shadowView.layer.masksToBounds = false
        contentView.addSubview(shadowView)
        shadowView.addSubview(card)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
