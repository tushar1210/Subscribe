//
//  NewCardViewController.swift
//  Subscribe
//
//  Created by Tushar Singh on 18/09/20.
//  Copyright © 2020 Tushar Singh. All rights reserved.
//

import UIKit

class NewCardViewController: UIViewController {

    @IBOutlet var shadowView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let card = CardView()
        shadowView.layer.shadowPath =
        UIBezierPath(roundedRect: card.bounds,cornerRadius: card.layer.cornerRadius).cgPath
        shadowView.layer.shadowColor = UIColor.gray.cgColor
        shadowView.layer.shadowOpacity = 0.55
        shadowView.layer.shadowOffset = CGSize(width: 2, height: 5)
        shadowView.layer.shadowRadius = 5
        shadowView.layer.masksToBounds = false
        shadowView.backgroundColor = .clear
        shadowView.addSubview(card)
        

    }
    
}
