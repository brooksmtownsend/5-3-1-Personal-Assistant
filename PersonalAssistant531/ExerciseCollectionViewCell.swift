//
//  exerciseTableViewCell.swift
//  PersonalAssistant531
//
//  Created by Brooks Townsend on 6/29/17.
//  Copyright © 2017 Brooks Townsend. All rights reserved.
//

import UIKit

class ExerciseCollectionViewCell: UICollectionViewCell, UIPickerViewDelegate, UIPickerViewDataSource {
    
    //MARK: Outlets
    @IBOutlet weak var exerciseNameLabel: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    
    //MARK: Properties
    let pickerViewDelegate = ExercisePickerViewDelegate()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
    }
    
    //PickerViewDelegate and DataSource functions
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return pickerViewDelegate.numberOfComponents(in: pickerView)
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerViewDelegate.pickerView(pickerView,numberOfRowsInComponent: component)
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        return pickerViewDelegate.pickerView(pickerView, attributedTitleForRow: row, forComponent: component)
    }
}
