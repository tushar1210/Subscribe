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
    
    var cardModel = CardModel()
    var logoImageView = UIImageView()
    var typeTextField = UITextField()
    var cardNumberTextField = UITextField()
    var dateTextField = UITextField()
    var nameTextField = UITextField()
    
    
    
    init(colors:[UIColor] = [UIColor.orange,UIColor.red], frame:CGRect = CGRect(x: 0, y: 0, width: 323, height: 170)) {
        super.init(frame:frame)
        self.cardModel.colors = colors
        self.frame = frame
        self.cardModel.frame = frame
        self.generateGradient()
        self.setUpView()
        self.layer.cornerRadius = 10
       
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        print(123)
    }
    
    
    func generateGradient(){
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        var cgColors:[CGColor] = []
        for color:UIColor in cardModel.colors!{
            cgColors.append(color.cgColor)
        }
        gradient.colors = cgColors
        gradient.startPoint = CGPoint.zero
        gradient.endPoint = CGPoint(x: 1, y: 1)
        layer.insertSublayer(gradient, at: 0)
    }
    func setUpView(){
        layer.cornerRadius = 10
        clipsToBounds = true
    }
    
    
    
    
    
    
}
