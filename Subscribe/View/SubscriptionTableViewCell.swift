//
//  SubscriptionTableViewCell.swift
//  Subscribe
//
//  Created by Tushar Singh on 17/09/20.
//  Copyright © 2020 Tushar Singh. All rights reserved.
//

import UIKit

class SubscriptionTableViewCell: UITableViewCell {

    @IBOutlet var logoImage: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var shadowView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        layer.cornerRadius = 5
        shadowView.layer.cornerRadius = 5
        clipsToBounds = true
        shadowView.layer.shadowPath =
        UIBezierPath(roundedRect: shadowView.bounds,
        cornerRadius: layer.cornerRadius).cgPath
        shadowView.layer.shadowColor = UIColor.gray.cgColor
        shadowView.layer.shadowOpacity = 0.25
        shadowView.layer.shadowOffset = CGSize(width: 2, height: 5)
        shadowView.layer.shadowRadius = 5
        shadowView.layer.masksToBounds = false

    }
    @IBAction func nextButton(_ sender: Any) {
        
    }
    
}
