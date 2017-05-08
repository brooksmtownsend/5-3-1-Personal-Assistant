//
//  MaxCalculatorView.swift
//  PersonalAssistant531
//
//  Created by Brooks Townsend on 5/5/17.
//  Copyright © 2017 Brooks Townsend. All rights reserved.
//

import UIKit

class MaxCalculatorView: UIView {
    @IBOutlet weak var squatWeight: UITextField!
    @IBOutlet weak var squatReps: UITextField!
    @IBOutlet weak var deadliftWeight: UITextField!
    @IBOutlet weak var deadliftReps: UITextField!
    @IBOutlet weak var benchWeight: UITextField!
    @IBOutlet weak var benchReps: UITextField!
    @IBOutlet weak var pressWeight: UITextField!
    @IBOutlet weak var pressReps: UITextField!
    @IBOutlet weak var firstMonth: UISegmentedControl!
    
    @IBAction func calculateMax(_ sender: Any) {
        let squatWeightNum = Double(squatWeight.text!)
        let squatRepsNum = Double(squatReps.text!)
        let deadliftWeightNum = Double(deadliftWeight.text!)
        let deadliftRepsNum = Double(deadliftReps.text!)
        let benchWeightNum = Double(benchWeight.text!)
        let benchRepsNum = Double(benchReps.text!)
        let pressWeightNum = Double(pressWeight.text!)
        let pressRepsNum = Double(pressReps.text!)
        let firstMonthValue = firstMonth.selectedSegmentIndex
        
        //calculate maxes
        //NOTE: Need to catch the nil value here, cannot assume that people will input all
        var calculatedSquat = ((squatWeightNum! * squatRepsNum! * 0.033333) + squatWeightNum!)
        var calculatedDeadlift = ((deadliftWeightNum! * deadliftRepsNum! * 0.033333) + deadliftWeightNum!)
        var calculatedBench = ((benchWeightNum! * benchRepsNum! * 0.033333) + benchWeightNum!)
        var calculatedPress = ((pressWeightNum! * pressRepsNum! * 0.033333) + pressWeightNum!)

        //change max back to original value if user did actually max (consider changing this to ternary)
        if(squatRepsNum! == 1){calculatedSquat = squatWeightNum!}
        if(deadliftRepsNum! == 1){calculatedDeadlift = deadliftWeightNum!}
        if(benchRepsNum! == 1){calculatedBench = benchWeightNum!}
        if(pressRepsNum! == 1){calculatedPress = pressWeightNum!}
        
        if (firstMonthValue == 0){
            calculatedSquat *= 0.9
            calculatedDeadlift *= 0.9
            calculatedBench *= 0.9
            calculatedPress *= 0.9
        }
        
        let userDefaults = UserDefaults.standard
        
        userDefaults.set(calculatedSquat, forKey: "squatMax")
        userDefaults.set(calculatedDeadlift, forKey: "deadliftMax")
        userDefaults.set(calculatedBench, forKey: "benchMax")
        userDefaults.set(calculatedPress, forKey: "pressMax")
        
        print(userDefaults.double(forKey: "squatMax"))
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
