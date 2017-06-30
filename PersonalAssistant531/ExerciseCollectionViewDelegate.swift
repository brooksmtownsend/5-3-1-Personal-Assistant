//
//  ExerciseCollectionViewDelegate.swift
//  PersonalAssistant531
//
//  Created by Brooks Townsend on 6/29/17.
//  Copyright © 2017 Brooks Townsend. All rights reserved.
//

import Foundation
import UIKit

class ExerciseCollectionViewDelegate: NSObject {
    
    //MARK: Properties
    let exerciseIdentifier = "exerciseCell"
    var numberOfExercises = 4
    
    override init(){
        super.init()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfExercises
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: exerciseIdentifier, for: indexPath) as! ExerciseCollectionViewCell
        switch indexPath.row {
        case 0:
            cell.exerciseNameLabel.text = Exercise.Squat.rawValue
            break
        case 1:
            cell.exerciseNameLabel.text = Exercise.Deadlift.rawValue
            break
        case 2:
            cell.exerciseNameLabel.text = Exercise.Bench.rawValue
            break
        case 3:
            cell.exerciseNameLabel.text = Exercise.Press.rawValue
            break
        default:
            cell.exerciseNameLabel.text = "Too many cells"
            break
        }
        
        return cell
    }
    
}
