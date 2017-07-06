//
//  ExercisePickerViewDelegate.swift
//  PersonalAssistant531
//
//  Created by Brooks Townsend on 6/29/17.
//  Copyright © 2017 Brooks Townsend. All rights reserved.
//

import Foundation
import UIKit

enum Unit: String{
    case Pound = "lbs x"
    case Kilogram = "kgs x"
}

struct WeightRepMeasurement{
    let weight: Int
    let reps: Int
    let unit: Unit
    
    init(weight: Int, reps: Int, unit: Unit){
        self.weight = weight
        self.reps = reps
        self.unit = unit
    }
}

class ExercisePickerViewDelegate: NSObject{
    
    //MARK: Properties
    let columns = 4
    let weightRows = 200
    let repRows = 16
    let labelRow = 1
    let measurementOptions: [String] = [Unit.Pound.rawValue, Unit.Kilogram.rawValue]
    
    var selectedWeight: Int = 0
    var selectedReps: Int = 0
    var selectedUnit: Unit = Unit.Pound
    
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
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0:
            let weight = self.pickerView(pickerView, attributedTitleForRow: row, forComponent: component)
            let weightString = weight?.string.trimmingCharacters(in: CharacterSet.init(charactersIn: " "))
            let weightInt = Int(weightString!)
            self.selectedWeight = weightInt!
            break
        case 1:
            let unit = self.pickerView(pickerView, attributedTitleForRow: row, forComponent: component)?.string
            self.selectedUnit = unit == Unit.Pound.rawValue ? Unit.Pound : Unit.Kilogram
            break
        case 2:
            let reps = self.pickerView(pickerView, attributedTitleForRow: row, forComponent: component)
            let repsString = reps?.string.trimmingCharacters(in: CharacterSet.init(charactersIn: " "))
            let repsInt = Int(repsString!)
            self.selectedReps = repsInt!
            break
        default:
            break
        }
    }
    
    func getSelectedValues() -> WeightRepMeasurement{
        return WeightRepMeasurement(weight: self.selectedWeight, reps: self.selectedReps, unit: self.selectedUnit)
    }
    
}
