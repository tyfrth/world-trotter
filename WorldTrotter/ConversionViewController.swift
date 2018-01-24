//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Tyler Frith on 11/15/17.
//  Copyright © 2017 tfrth. All rights reserved.
//

//import Foundation
import UIKit

//get only the our
extension Date {
    var hour: Int { return Calendar.current.component(.hour, from: self)}
}

class ConversionViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var celsiusLabel: UILabel!
    @IBOutlet var textField: UITextField!
    
    override func viewDidLoad() {
        //always call the super implementation of the of viewDidLoad
        super.viewDidLoad()
        
        
        
        print("ConversionController loaded it's view :)")
        
}
    
// MARK: Timer Stuff to change background color
    
    var timer = Timer()
    
    override func viewWillAppear(_ animated: Bool) {
        
        NotificationCenter.default.addObserver(self, selector: #selector(scheduleTimer), name: .UIApplicationDidBecomeActive, object: nil)
        
        //change background each time view is opened
        changeBackground()
    }
    
    @objc func scheduleTimer() {
        //schedule the timer
        timer = Timer(fireAt: Calendar.current.nextDate(after: Date(), matching: DateComponents(hour: 6..<17  ~= Date().hour ? 17 : 6), matchingPolicy: .nextTime)!, interval: 0, target: self, selector: #selector(changeBackground), userInfo: nil, repeats: false)
        print(timer.fireDate)
        RunLoop.main.add(timer, forMode: .commonModes)
        print("new background change scheduled at:", timer.fireDate.description(with: .current))
    }
    
    @objc func changeBackground() {
    
        //check if day or night
        self.view.backgroundColor = 6..<17 ~= Date().hour ? .white : .black
    }
    
    
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
            celsiusLabel.text = numberFormatter.string(from: NSNumber(value: value))
            
        } else {
            celsiusLabel.text = "???"
        }
    }
 
    
    //this will dismiss keyboard
    @IBAction func dissmissKeyboard(sender: AnyObject) {
        textField.resignFirstResponder()
    }
    
    //number formatter
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    // Mark: Delegates
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        //doesn't allow for alphabetic characters
        let aSet = NSCharacterSet(charactersIn:"0123456789").inverted
        let compSepByCharInSet = string.components(separatedBy: aSet)
        let numberFiltered = compSepByCharInSet.joined(separator: "")
        
        let existingTextHasDecimalSeperator = textField.text?.range(of: ".")
        let replacementTextHasDecimalSeperator = string.range(of: ".")
        
        if existingTextHasDecimalSeperator != nil && replacementTextHasDecimalSeperator != nil {
            return false && string == numberFiltered
        } else {
            return true && string == numberFiltered
        }
    }
}



