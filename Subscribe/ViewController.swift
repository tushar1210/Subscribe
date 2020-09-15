//
//  ViewController.swift
//  Subscribe
//
//  Created by Tushar Singh on 13/09/20.
//  Copyright © 2020 Tushar Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var card = CardView()
    override func viewDidLoad() {
        super.viewDidLoad()
        card.setLogo(logo: .masterCard)
        card.setCardNumber(number:"123431")
        view.insertSubview(card, at: 0)
    }
    


}

