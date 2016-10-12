//
//  ConversionViewController.swift
//  WoldTrotter
//
//  Created by BAZZAOUI chaymae on 10/5/16.
//  Copyright © 2016 Klechkowski. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var celsiusLabel: UILabel!
    @IBOutlet var textField: UITextField!
    
    
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    var fahrenheitValue: Double? {
        didSet {
            updateCelsiusLabel()
        }
    }
    
    var celsiusValue: Double? {
        if let value = fahrenheitValue {
            return (value - 32) * (5/9)
        }
        else {
            return nil
        }
    }
    
    @IBAction func fahrenheitFieldEditingChanged(textField: UITextField) {
        
        if let text = textField.text , let value = Double(text) {
            fahrenheitValue = value
        }
        else {
            celsiusLabel.text = "???"
        }
    }
    @IBAction func dismissKeyboard(sender: AnyObject) {
        textField.resignFirstResponder()
    }
    
    
    func updateCelsiusLabel() {
        if let value = celsiusValue {
            let nsNumberValue = value as NSNumber
            celsiusLabel.text = numberFormatter.string(from: nsNumberValue)
        }
        else {
            celsiusLabel.text = "???"
        }
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let currentTextHasDecimalSeparator = textField.text?.range(of:".")
        let replacementStringHasDecimalSeparator = string.range(of:".")
        
        let letters = NSCharacterSet.letters
        
        if let value = UnicodeScalar(string), letters.contains(value) {
            return false
        }
        
        
        
        if currentTextHasDecimalSeparator != nil && replacementStringHasDecimalSeparator != nil {
            return false
        }
        
        else {
            return true
        }
 
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("\nConversationViewController loaded its view.\n")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let today = Date()
        let calendar = Calendar.current
        
        let hour = calendar.component(.hour, from: today)
        
        let nightModeHour = 18
        
        if hour >= nightModeHour {
            view.backgroundColor = UIColor.darkGray
        }
    }
    
}
