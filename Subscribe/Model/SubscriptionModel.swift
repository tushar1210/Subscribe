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
    var imageName:subscriptionImage? = .noImage
    var price:String?
    enum subscriptionImage:String {
        case spotify = "spotify-logo"
        case netflix = "netflix-logo"
        case appleMusic = "apple-music-logo"
        case iCloud = "icloud-logo"
        case hotstar = "hotstar-logo"
        case noImage = "default-logo"
    }
}
