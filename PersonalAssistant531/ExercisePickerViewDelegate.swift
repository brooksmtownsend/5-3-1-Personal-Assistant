//
//  ExercisePickerViewDelegate.swift
//  PersonalAssistant531
//
//  Created by Brooks Townsend on 6/29/17.
//  Copyright © 2017 Brooks Townsend. All rights reserved.
//

import Foundation
import UIKit

class ExercisePickerViewDelegate: NSObject{
    
    //MARK: Properties
    let columns = 4
    let weightRows = 200
    let repRows = 16
    let labelRow = 1
    let measurementOptions: [String] = ["lbs x", "kgs x"]
    
    override init(){
        super.init()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return columns
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        switch component {
        case 0:
            return weightRows
        case 1:
            return measurementOptions.count
        case 2:
            return repRows
        case 3:
            return labelRow
        default:
            return 0
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        var title: String
        
        //Odd spacing is to create a better look in the actual picker
        switch component{
        case 0:
            let weight = row * 5
            title = " \(weight)"
        case 1:
            title = measurementOptions[row]
        case 2:
            let reps = row
            title = " \(reps)"
        case 3:
            title = "reps  "
        default:
            title = ""
        }
        
        return NSAttributedString(string: title, attributes: [NSForegroundColorAttributeName:UIColor.white])
        
    }
    
    
}
