//
//  CardViewController.swift
//  Subscribe
//
//  Created by Tushar Singh on 15/09/20.
//  Copyright © 2020 Tushar Singh. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {

    @IBOutlet var cardTableView: UITableView!
    var cardsArray:[CardView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cardTableView.delegate = self
        cardTableView.dataSource = self
        cardTableView.separatorStyle = .none
        cardTableView.allowsSelection = false
        cardsArray.append(CardView())
        cardsArray.append(CardView())
    }

}

extension CardViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(cardsArray.count)
        return cardsArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cardTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CardTableViewCell
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 203
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
   
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            cardsArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
}
