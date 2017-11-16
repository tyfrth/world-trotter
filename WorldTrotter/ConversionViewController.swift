//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Tyler Frith on 11/15/17.
//  Copyright © 2017 tfrth. All rights reserved.
//

//import Foundation
import UIKit

class ConversionViewController: UIViewController {
    
    @IBOutlet var celsiusLabel: UILabel!
    @IBOutlet var textField: UITextField!
    
    //this is an optional b/c it could be nil -- we then create a property observer using {} as soon as the value is changed we call updateCelsiusLabel()
    var fahrenheitValue: Double? {
        didSet{
            updateCelsiusLabel()
        }
    }
    
    //our conversion from fahrenheit to celsius
    var celsiusValue: Double? {
        if let value = fahrenheitValue {
            return (value - 32) * (5/9)
        } else {
            return nil
        }
    }
    
    //adds text to the input if there is any, "???" if there isn't
    @IBAction func fahrenheightFieldEditingChanged(textField: UITextField) {
        
        if let text = textField.text, let value = Double(text) {
            fahrenheitValue = value
        } else {
            fahrenheitValue = nil
        }
    }
    
    //anytime fahrenheit value changes, need to update the celsius value
    func updateCelsiusLabel() {
        if let value = celsiusValue {
            celsiusLabel.text = "\(value)"
        } else {
            celsiusLabel.text = "???"
        }
    }
    
    //this will dismiss keyboard
    @IBAction func dissmissKeyboard(sender: AnyObject) {
        textField.resignFirstResponder()
    }
}

