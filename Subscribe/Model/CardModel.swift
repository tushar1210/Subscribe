//
//  Card.swift
//  Subscribe
//
//  Created by Tushar Singh on 13/09/20.
//  Copyright © 2020 Tushar Singh. All rights reserved.
//

import Foundation
import UIKit

struct CardModel{
    var name:String?
    enum type:String {
        case debit = "DEBIT"
        case credit = "CREDIT"
    }
    
    enum cardProviderImageEnum:String {
        case masterCard = "MasterCard"
        case visa = "VisaLogo"
        case amex = "AmericanExpressLogo"
        case rupay = "RuPayLogo"
    }
    
    var cardImage:cardProviderImageEnum?
    var date:String?
    var cardNumber:String?
    var colors:[UIColor]?
    var frame:CGRect = CGRect(x: 0, y: 0, width: 200, height: 100)
    
    var allColors = [[UIColor.orange.cgColor,UIColor.red.cgColor],[UIColor(red: 48/255, green: 207/255, blue: 208/255, alpha: 1).cgColor,UIColor(red: 51/255, green: 8/255, blue: 103/255, alpha: 1).cgColor],   [UIColor(red: 37/255, green: 117/255, blue: 252/255, alpha: 1).cgColor,UIColor(red: 106/255, green: 17/255, blue: 203/255, alpha: 1).cgColor],  [UIColor(red: 55/255, green: 236/255, blue: 186/255, alpha: 1).cgColor,UIColor(red: 114/255, green: 175/255, blue: 211/255, alpha: 1).cgColor],[UIColor(red: 196/255, green: 113/255, blue: 245/255, alpha: 1).cgColor,UIColor(red: 250/255, green: 113/255, blue: 205/255, alpha: 1).cgColor],[UIColor(red: 2/255, green: 80/255, blue: 197/255, alpha: 1).cgColor,UIColor(red: 212/255, green: 63/255, blue: 141/255, alpha: 1).cgColor],[UIColor(red: 128/255, green: 208/255, blue: 199/255, alpha: 1).cgColor, UIColor(red: 19/255, green: 84/255, blue: 122/255, alpha: 1).cgColor],[UIColor(red: 255/255, green: 8/255, blue: 68/255, alpha: 1).cgColor, UIColor(red: 255/255, green: 177/255, blue: 153/255, alpha: 1).cgColor],[UIColor(red: 67/255, green: 67/255, blue: 67/255, alpha: 1).cgColor, UIColor.black.cgColor]]
    
    
}

