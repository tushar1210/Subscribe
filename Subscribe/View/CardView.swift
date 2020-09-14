//
//  CardView.swift
//  Subscribe
//
//  Created by Tushar Singh on 14/09/20.
//  Copyright © 2020 Tushar Singh. All rights reserved.
//

import Foundation
import UIKit

class CardView:UIView{
    
    var frontView = UIView()
    var cardModel = CardModel()
    
    init(colors:[UIColor], frame:CGRect) {
        super.init(frame:frame)
        self.cardModel.colors = colors
        self.frontView.frame = frame
        self.cardModel.frame = frame
        self.generateGradient()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    func generateGradient(){
        let gradient = CAGradientLayer()
        gradient.frame = frontView.bounds
        var cgColors:[CGColor] = []
        for color:UIColor in cardModel.colors!{
            cgColors.append(color.cgColor)
        }
        gradient.colors = cgColors
        gradient.startPoint = CGPoint.zero
        gradient.endPoint = CGPoint(x: 1, y: 1)
        frontView.layer.insertSublayer(gradient, at: 0)
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
