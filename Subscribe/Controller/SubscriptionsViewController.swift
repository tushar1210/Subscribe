//
//  SubscriptionsViewController.swift
//  Subscribe
//
//  Created by Tushar Singh on 17/09/20.
//  Copyright © 2020 Tushar Singh. All rights reserved.
//

import UIKit

class SubscriptionsViewController: UIViewController {
    @IBOutlet var subTableView: UITableView!
    
    var subs:[SubscriptionModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subTableView.delegate = self
        subTableView.dataSource = self
        subTableView.separatorStyle = .none
        subTableView.allowsSelection = false
        subTableView.backgroundColor = .clear
        
    }
    
}

extension SubscriptionsViewController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = subTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SubscriptionTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = UIView(frame: CGRect(x: 0, y: 0, width: 340, height: 30))
        return footer
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 30
    }
        
}
