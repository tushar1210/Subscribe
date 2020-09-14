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
    let cardProviderImage:Dictionary<String,String> = ["MasterCard":"MasterCardLogo","Visa":"VisaLogo","AmericanExpress":"AmericanExpressLogo","RuPay":"RuPayLogo"]
    var date:String?
    var cardNumber:String?
    var colors:[UIColor]?
    var frame:CGRect = CGRect(x: 0, y: 0, width: 200, height: 100)
}
