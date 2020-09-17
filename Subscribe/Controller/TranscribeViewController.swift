//
//  TranscribeViewController.swift
//  Subscribe
//
//  Created by Tushar Singh on 18/09/20.
//  Copyright © 2020 Tushar Singh. All rights reserved.
//

import UIKit

class TranscribeViewController: UIViewController {

    @IBOutlet var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    


    @IBAction func backButton(_ sender: Any) {
        performSegue(withIdentifier: "unwind", sender: self)
    }
    
}
