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
}
