//
//  AddPlantViewController.swift
//  GreenHouse
//
//  Created by student on 2/25/20.
//  Copyright © 2020 S531823. All rights reserved.
//

import UIKit

class AddPlantViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var speciesTF: UITextField!
    @IBOutlet weak var waterFrequencyTF: UITextField!
    @IBOutlet weak var sunlightDurationTF: UITextField!
    @IBOutlet weak var waterTimeFramePV: UIPickerView!
    @IBOutlet weak var sunlightTimeFramePV: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.waterTimeFramePV.delegate = self
        self.waterTimeFramePV.dataSource = self
        self.sunlightTimeFramePV.delegate = self
        self.sunlightTimeFramePV.dataSource = self
    }
    
    let frequency = ["day", "week"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return frequency[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return frequency.count
    }
    
    var waterFreq = "day"
    var sunlightFreq = "day"
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == waterTimeFramePV{
            waterFreq = frequency[row]
        }
        else{
            sunlightFreq = frequency[row]
        }
    }
    
    @IBAction func addPlant(sender:Any){
        if let i = Int(waterFrequencyTF.text!) ,let j = Int(sunlightDurationTF.text!)  {
            if i > 0 && j > 0 && i < 5 && j < 12
            {
                let plant = Plant(name: nameTF.text!, species: speciesTF.text!, waterFrequency: i, waterTimeFrame: waterFreq, sunlightDuration: j, sunlightTimeFrame: sunlightFreq)
                Plants.shared.add(plant: plant)
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "Added Plant"), object: nil)
                // intantiated the notification scheduler class with required parameters
                let notificationScheduler = NotificationScheduler.init(waterFrequancy: i , waterTimeFrame: waterFreq, sunlightDuration: j, sunlightTimeFrame: sunlightFreq)
                notificationScheduler.requestPermission()
                self.dismiss(animated: true, completion: nil)}
            else{
                // to limit the hours entry
                let ac = UIAlertController(title: "Invalid Entry of hours", message: "Entered value is in out of bounds", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                ac.addAction(action)
                self.present(ac,animated:true)
                
            }
        }
        else{
            //added alert controller to validate the given data
            let ac = UIAlertController(title: "Invalid Entry" ,message: "Entered value should be an integer", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            ac.addAction(action)
            self.present(ac,animated:true)
        }
    }
    
    @IBAction func cancel(sender:Any){
        self.dismiss(animated: true, completion: nil)
    }
    
}
