//
//  ViewController.swift
//  Concentraion 2
//
//  Created by ARNAV SINGHANIA on 4/12/18.
//  Copyright © 2018 Singhania Tech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet var cardButtonsArray: [UIButton]!
    let brain = ConcentrationBrain(numOfCardPairs: 9)
    
    @IBAction func cardButtonClicked(_ sender: UIButton) {
        
    
        
        
        
    }
    
    @IBAction func newGameButtonClicked() {
    }
    
}

