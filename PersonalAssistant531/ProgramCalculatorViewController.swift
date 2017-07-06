//
//  FirstViewController.swift
//  PersonalAssistant531
//
//  Created by Brooks Townsend on 5/5/17.
//  Copyright © 2017 Brooks Townsend. All rights reserved.
//

import UIKit

class ProgramCalculatorViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    //MARK: Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: Properties
    let exerciseCollectionViewDelegate = ExerciseCollectionViewDelegate()
    
    //MARK: UIViewController functions
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: CollectionViewDelegate and DataSource functions
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return exerciseCollectionViewDelegate.collectionView(collectionView, numberOfItemsInSection: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return exerciseCollectionViewDelegate.collectionView(collectionView, cellForItemAt: indexPath)
    }
    
    //MARK: Actions
    @IBAction func calculateProgram(_ sender: Any) {
        var weights: [Int] = []
        var reps: [Int] = []
        var units: [Unit] = []
        var maxes: [Int] = []
        var allMaxes: [String: Int] = [:]
        
        var indexPath = IndexPath()
        
        while indexPath.row < 4 {
            let cell = exerciseCollectionViewDelegate.collectionView(self.collectionView, cellForItemAt: indexPath) as! ExerciseCollectionViewCell
            let weightRepMeasurement = cell.getSelectedValuesFromCell()
            weights.append(weightRepMeasurement.weight)
            reps.append(weightRepMeasurement.reps)
//            isImperial.append(weightRepMeasurement.unit)
        }
        print(weights)
        print(reps)
    }
    
    //MARK: Helper methods
    func calculateMax(_ weight: Int, _ reps: Int){
//        wt. x reps x .0333 + wt.
    }
    

}

