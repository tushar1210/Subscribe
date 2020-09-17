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
        return subs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = subTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SubscriptionTableViewCell
        cell.nameLabel.text = subs[indexPath.section].name
        cell.priceLabel.text = subs[indexPath.section].price
        let df = DateFormatter()
        df.dateFormat = "dd-MM-yyyy"
        let now = df.string(from: Date())
        cell.dateLabel.text = now
        cell.logoImage.image = UIImage(named: subs[indexPath.section].imageName!.rawValue)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 135
    }
        
}
