//
//  ViewController.swift
//  Subscribe
//
//  Created by Tushar Singh on 13/09/20.
//  Copyright © 2020 Tushar Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var card = CardView(colors: [.black,.blue], frame: CGRect(x: 50, y: 140, width: 200, height: 100))
    override func viewDidLoad() {
        super.viewDidLoad()
        view.insertSubview(card.frontView, at: 1)
        
    }


}

