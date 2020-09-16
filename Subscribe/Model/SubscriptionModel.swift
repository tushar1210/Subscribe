//
//  SubscriptionModel.swift
//  Subscribe
//
//  Created by Tushar Singh on 17/09/20.
//  Copyright © 2020 Tushar Singh. All rights reserved.
//

import Foundation

struct SubscriptionModel {
    var name:String?
    var nextDate:Date?
    var imageName:subscriptionImage?
    var price:String?
    enum subscriptionImage {
        case spotify
        case netflix
        case appleMusic
        case iCloud
        case hotstar
    }
}
