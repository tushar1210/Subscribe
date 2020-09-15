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
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        contentView.addSubview(card)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
