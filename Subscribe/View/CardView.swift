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
    var typeLabel = UILabel()
    var cardNumberLabel = UILabel()
    var dateLabel = UILabel()
    var nameLabel = UILabel()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(_ frame:CGRect = CGRect(x: 0, y: 0, width: 323, height: 170),name:String="Card Holder", cardNumber:String="", date:String="MM/YY", vendor:CardModel.cardProviderImageEnum = .masterCard, type:CardModel.typeEnum = .credit) {
        super.init(frame:frame)
        self.frame = frame
        self.cardModel.frame = frame
        self.cardModel.name = name
        self.cardModel.cardNumber=cardNumber
        self.cardModel.date=date
        self.cardModel.cardImage = vendor
        self.cardModel.type = type
        self.generateGradient()
        self.setUpView()
        self.layer.cornerRadius = 10
        self.addSublayouts()
    }
    
    private func generateGradient(){
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = cardModel.allColors[Int.random(in: Range(uncheckedBounds: (0,cardModel.allColors.count)))]
        gradient.startPoint = CGPoint.zero
        gradient.endPoint = CGPoint(x: 1, y: 1)
        layer.insertSublayer(gradient, at: 0)
    }
    
    private func setUpView(){
        layer.cornerRadius = 10
        clipsToBounds = true
        typeLabel.textColor = .white
        cardNumberLabel.textColor = .white
        dateLabel.textColor = .white
        nameLabel.textColor = .white
    }
    
    private func addSublayouts(){
        logoImageView.frame = CGRect(x: frame.minX+8, y: frame.minY+5, width: 75, height: 30)
        logoImageView.image = UIImage(named: cardModel.cardImage!.rawValue)
        logoImageView.contentMode = .scaleAspectFit
        addSubview(logoImageView)
        
        typeLabel.frame = CGRect(x: frame.midX-35, y: 30, width: 70, height: 20)
        typeLabel.center = CGPoint(x: frame.midX, y: 30)
        typeLabel.attributedText = NSAttributedString(string: cardModel.type!.rawValue, attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
        typeLabel.textAlignment = .center
        typeLabel.font = UIFont(name: "AndaleMono", size: 18)
        typeLabel.adjustsFontSizeToFitWidth = true
        addSubview(typeLabel)
        
        cardNumberLabel.frame = CGRect(x: frame.midX-145 , y: 83, width: 290, height: 25)
        cardNumberLabel.center = CGPoint(x: frame.midX, y: 83)
        cardNumberLabel.text = setCardNumber(number: cardModel.cardNumber!)
        cardNumberLabel.textAlignment = .center
        cardNumberLabel.font = UIFont(name: "AndaleMono", size: 22)
        cardNumberLabel.adjustsFontSizeToFitWidth = true
        addSubview(cardNumberLabel)
        
        dateLabel.frame = CGRect(x: frame.minX + 15, y: frame.maxY-29, width: 45, height: 17)
        dateLabel.text = cardModel.date
        dateLabel.textAlignment = .center
        dateLabel.font = UIFont(name: "AndaleMono", size: 15)
        dateLabel.adjustsFontSizeToFitWidth = true
        addSubview(dateLabel)
        
        nameLabel.frame = CGRect(x: dateLabel.frame.maxX, y: frame.maxY-29, width: cardNumberLabel.frame.width-dateLabel.frame.width, height: 17)
        nameLabel.text = cardModel.name
        nameLabel.textAlignment = .right
        nameLabel.font = UIFont(name: "AndaleMono", size: 15)
        nameLabel.adjustsFontSizeToFitWidth = true
        addSubview(nameLabel)
    }
    
    public func setCardNumber(number:String)->String{
        if(number=="" || number.count==0){
            return "••••   ••••   ••••   ••••"
        }
        var formated = ""
        let dif=16-number.count
        var ct=0
        for _ in 0...dif{
            formated.append("•")
        }
        formated.removeLast()
        formated+=number
        var main=""
        for i in formated{
            if(ct==4){
                main+="   "
                ct=0
            }
            main.append(i)
            ct+=1
        }
        return main
    }
       
}
