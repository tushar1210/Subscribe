//
//  NewCardViewController.swift
//  Subscribe
//
//  Created by Tushar Singh on 18/09/20.
//  Copyright © 2020 Tushar Singh. All rights reserved.
//

import UIKit

class NewCardViewController: UIViewController {

    @IBOutlet var shadowView: UIView!
    @IBOutlet var nameTF: UITextField!
    @IBOutlet var dateTF: UITextField!
    @IBOutlet var cardNum: UITextField!
    @IBOutlet var vendor: UIButton!
    @IBOutlet var typeSegment: UISegmentedControl!
    
    var vendorPickerToolBar = UIToolbar()
    var vendorPicker  = UIPickerView()
    
    let vendorArray = ["Master Card", "Visa", "American Express", "Rupay"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let card = CardView()
        shadowView.layer.shadowPath =
        UIBezierPath(roundedRect: card.bounds,cornerRadius: card.layer.cornerRadius).cgPath
        shadowView.layer.shadowColor = UIColor.gray.cgColor
        shadowView.layer.shadowOpacity = 0.55
        shadowView.layer.shadowOffset = CGSize(width: 2, height: 5)
        shadowView.layer.shadowRadius = 5
        shadowView.layer.masksToBounds = false
        shadowView.backgroundColor = .clear
        shadowView.addSubview(card)
        vendor.layer.cornerRadius = 8
        vendor.titleLabel?.adjustsFontSizeToFitWidth = true
    }
    
    @IBAction func vendor(_ sender: Any) {
        vendorPicker = UIPickerView.init()
        vendorPicker.delegate = self
        vendorPicker.backgroundColor = .gray
        vendorPicker.setValue(UIColor.white, forKey: "textColor")
        vendorPicker.autoresizingMask = .flexibleWidth
        vendorPicker.contentMode = .center
        vendorPicker.frame = CGRect.init(x: 0.0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 300)
        self.view.addSubview(vendorPicker)

        vendorPickerToolBar = UIToolbar.init(frame: CGRect.init(x: 0.0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 50))
        vendorPickerToolBar.barStyle = .black
        vendorPickerToolBar.isTranslucent=true
        vendorPickerToolBar.items = [UIBarButtonItem.init(title: "Done", style: .done, target: self, action: #selector(onDoneButtonTapped))]
        
        self.view.addSubview(vendorPickerToolBar)
     }
    
    @objc func onDoneButtonTapped() {
        vendorPickerToolBar.removeFromSuperview()
        vendorPicker.removeFromSuperview()
    }
    
}

extension NewCardViewController:UIPickerViewDataSource, UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return vendorArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return vendorArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        vendor.titleLabel?.text = vendorArray[row]
    }
    
}


