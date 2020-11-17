//
//  Constants.swift
//  GreenHouse
//
//  Created by student on 2/26/20.
//  Copyright © 2020 S531823. All rights reserved.
//

import Foundation
import UIKit

//Adding done button on the keyboard
extension UITextField{
    
    @IBInspectable var doneAccessory: Bool{
        get{
            return self.doneAccessory
        }
        set (hasDone) {
            if hasDone{
                addDoneButtonOnKeyboard()
            }
        }
    }
    //adding done button on the keyboard
    func addDoneButtonOnKeyboard()
    {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))
        
        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        self.inputAccessoryView = doneToolbar
    }
    
    //done button action
    @objc func doneButtonAction()
    {
        self.resignFirstResponder()
    }
}

//accessing viewController with storyboard IVC
struct Constants {
    static let settingsViewController = "settingsVC"
    static let addPlantViewController = "addPlantVC"
    static let plantInfoViewController = "plantInfoVC"
}
