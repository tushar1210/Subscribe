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
    @IBOutlet var save: UIButton!
    
    var vendorPickerToolBar = UIToolbar()
    var vendorPicker  = UIPickerView()
    
    let card = CardView()
    
    let vendorArray = ["Master Card", "Visa", "American Express", "Rupay"]
    override func viewDidLoad() {
        super.viewDidLoad()
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
        save.layer.cornerRadius = 8
        save.titleLabel?.adjustsFontSizeToFitWidth = true
        
        nameTF.delegate = self
        dateTF.delegate = self
        cardNum.delegate = self
        
        dateTF.keyboardType = .numberPad
        cardNum.keyboardType = .numberPad
        
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(Randombackgorund))
        card.addGestureRecognizer(tap)
    }
    
    @objc func Randombackgorund(){
        card.generateGradient()
    }
    
    @IBAction func vendor(_ sender: Any) {
        vendorPicker = UIPickerView.init()
        vendorPicker.delegate = self
        vendorPicker.backgroundColor = .gray
        vendorPicker.setValue(UIColor.white, forKey: "textColor")
        vendorPicker.autoresizingMask = .flexibleWidth
        vendorPicker.contentMode = .center
        vendorPicker.frame = CGRect.init(x: 0.0, y: UIScreen.main.bounds.size.height - 250, width: UIScreen.main.bounds.size.width, height: 250)
        self.view.addSubview(vendorPicker)
        vendorPickerToolBar = UIToolbar.init(frame: CGRect.init(x: 0.0, y: UIScreen.main.bounds.size.height - 250, width: UIScreen.main.bounds.size.width, height: 30))
        vendorPickerToolBar.barStyle = .black
        vendorPickerToolBar.isTranslucent=true
        vendorPickerToolBar.items = [UIBarButtonItem.init(title: "Done", style: .done, target: self, action: #selector(onDoneButtonTapped))]
        
        self.view.addSubview(vendorPickerToolBar)
     }
    
    @objc func onDoneButtonTapped() {
        vendorPickerToolBar.removeFromSuperview()
        vendorPicker.removeFromSuperview()
        
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func typeSegment(_ sender: Any) {
        if(typeSegment.selectedSegmentIndex == 1){
            card.cardModel.type = .debit
        }
        if(typeSegment.selectedSegmentIndex == 0){
            card.cardModel.type = .credit
        }
        card.typeLabel.text = card.cardModel.type?.rawValue
    }
    
    @IBAction func save(_ sender: Any) {
        
    }
    
}

extension NewCardViewController:UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate{
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
        print(vendorArray[row])
        vendor.setTitle(vendorArray[row], for: .normal)
       
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {

        switch textField {
            case nameTF:
                card.nameLabel.text = nameTF.text
            case dateTF:
                
                if dateTF.text!.count<=5{
                    if dateTF.text!.count == 2{
                        dateTF.text! += "/"
                    }
                    card.dateLabel.text = dateTF.text
                }
                else{
                    dateTF.text = card.dateLabel.text
                }
            case cardNum:
                card.cardNumberLabel.text = card.setCardNumber(number: cardNum.text!)
                if(cardNum.text!.count > 4){
                    cardNum.text?.removeLast()
                }
            default:
                print("1234")
        }
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true;
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField==dateTF && string.isBackspace{
            dateTF.text = ""
            card.dateLabel.text = ""
        }
      return true
    }

    
}


extension String {
  var isBackspace: Bool {
    let char = self.cString(using: String.Encoding.utf8)!
    return strcmp(char, "\\b") == -92
  }
}


