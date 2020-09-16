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
    
    enum cardProviderImageEnum:String {
        case masterCard = "MasterCardLogo"
        case visa = "VisaLogo"
        case amex = "AmericanExpressLogo"
        case rupay = "RuPayLogo"
    }
    
    enum CardTypeEnum:String {
        case debit = "DEBIT"
        case credit = "CREDIT"
    }
    
    init(colors:[UIColor] = [UIColor.orange,UIColor.red], frame:CGRect = CGRect(x: 0, y: 0, width: 323, height: 170)) {
        super.init(frame:frame)
        self.cardModel.colors = colors
        self.frame = frame
        self.cardModel.frame = frame
        self.generateGradient()
        self.setUpView()
        self.layer.cornerRadius = 10
        self.addSublayouts()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func generateGradient(){
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
        logoImageView.image = UIImage(named: cardProviderImageEnum.visa.rawValue)
        logoImageView.contentMode = .scaleAspectFit
        addSubview(logoImageView)
        
        typeLabel.frame = CGRect(x: frame.midX-35, y: 30, width: 70, height: 20)
        typeLabel.center = CGPoint(x: frame.midX, y: 30)
        typeLabel.attributedText = NSAttributedString(string: "DEBIT", attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
        typeLabel.textAlignment = .center
        typeLabel.font = UIFont(name: "AndaleMono", size: 18)
        typeLabel.adjustsFontSizeToFitWidth = true
        addSubview(typeLabel)
        
        cardNumberLabel.frame = CGRect(x: frame.midX-145 , y: 83, width: 290, height: 25)
        cardNumberLabel.center = CGPoint(x: frame.midX, y: 83)
        cardNumberLabel.text = "XXXX  XXXX  XXXX  XXXX"
        cardNumberLabel.textAlignment = .center
        cardNumberLabel.font = UIFont(name: "AndaleMono", size: 22)
        cardNumberLabel.adjustsFontSizeToFitWidth = true
        addSubview(cardNumberLabel)
        
        dateLabel.frame = CGRect(x: frame.minX + 15, y: frame.maxY-29, width: 45, height: 17)
        dateLabel.text = "MM/YY"
        dateLabel.textAlignment = .center
        dateLabel.font = UIFont(name: "AndaleMono", size: 15)
        dateLabel.adjustsFontSizeToFitWidth = true
        addSubview(dateLabel)
        
        nameLabel.frame = CGRect(x: dateLabel.frame.maxX, y: frame.maxY-29, width: cardNumberLabel.frame.width-dateLabel.frame.width, height: 17)
        nameLabel.text = "Card Holder"
        nameLabel.textAlignment = .right
        nameLabel.font = UIFont(name: "AndaleMono", size: 15)
        nameLabel.adjustsFontSizeToFitWidth = true
        addSubview(nameLabel)
        
        
    }

    public func setLogo(logo: cardProviderImageEnum){
        logoImageView.image = UIImage(named: "home")
    }
    
    public func setType(type:CardTypeEnum){
        typeLabel.attributedText = NSAttributedString(string: type.rawValue, attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
    }
    
    public func setCardNumber(number:String){
        var formattedString = String()
        var ctr=0
        for i in number{
            if(ctr==4){
                formattedString += "  "
                ctr=0
            }
            formattedString.append(i)
            ctr+=1
        }
        if(number.count<16){
            let diff=16-number.count-1
            for _ in 0...diff{
                if(ctr==4){
                    formattedString += "  "
                    ctr=0
                }
                formattedString.append("X")
                ctr+=1
            }
        }
        cardNumberLabel.text = formattedString
    }
    
}
