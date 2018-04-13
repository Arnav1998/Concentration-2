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
    let animalsEmojis = ["🐶","🦁","🐼","🦄","🐛","🦋","🐳","🐿","🐇"]
    
    @IBAction func cardButtonClicked(_ sender: UIButton) {
        
        brain.cardPressed(index: cardButtonsArray.index(of: sender)!)
        self.update();
        
    }
    
    @IBAction func newGameButtonClicked() {
        
    }
    
    private func update() {
        
        for index in 0..<cardButtonsArray.count {
            
            if (brain.cardsArray[index].isFaceUp) {
                self.cardButtonsArray[index].backgroundColor = #colorLiteral(red: 0.7233663201, green: 0.7233663201, blue: 0.7233663201, alpha: 1)
                self.cardButtonsArray[index].setTitle(animalsEmojis[brain.cardsArray[index].identifier], for: UIControlState.normal)
            } else {
                self.cardButtonsArray[index].backgroundColor = #colorLiteral(red: 0.912140429, green: 0.04857309163, blue: 0.07928407937, alpha: 1)
                self.cardButtonsArray[index].setTitle("", for: UIControlState.normal)
            }
            
        }
        
    }
    
}

