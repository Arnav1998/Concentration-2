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
    private var brain = ConcentrationBrain(numOfCardPairs: 9)
    private let animalsEmojis = ["🐶","🦁","🐼","🦄","🐛","🦋","🐳","🐿","🐇"]
    private let foodEmojis = ["🍉","🥝","🍔","🍟","🍕","🥗","🍝","🍙","🥧"]
    private let sportsEmojis = ["🥈","🏄🏻‍♀️","⚽️","⚾️","🏌️‍♀️","🤸‍♂️","🤾🏾‍♂️","🏊🏻‍♀️","🤼‍♀️"]
    private let faceEmojis = ["😌","🤯","👻","🙄","🤡","😴","🤗","🤑","😈"]
    private var themeNum = Int(arc4random_uniform(4))
    
    @IBAction func cardButtonClicked(_ sender: UIButton) {
        brain.cardPressed(index: cardButtonsArray.index(of: sender)!)
        self.update();
    }
    
    @IBAction func newGameButtonClicked() {

        self.themeNum = Int(arc4random_uniform(4))
        
        brain = ConcentrationBrain(numOfCardPairs: 9)
        self.pointsLabel.text = "Points: \(brain.points)"
        
        for index in cardButtonsArray.indices {
            self.cardButtonsArray[index].isEnabled = true
        }
        
        self.update()
    }
    
    private func update() {
        
        for index in 0..<cardButtonsArray.count {
            
            if (brain.cardsArray[index].isFaceUp) {
                
                self.cardButtonsArray[index].backgroundColor = #colorLiteral(red: 0.6509803922, green: 0.7294117647, blue: 0.9803921569, alpha: 1)
                if (self.themeNum == 0) {
                    self.cardButtonsArray[index].setTitle(animalsEmojis[brain.cardsArray[index].identifier], for: UIControlState.normal)
                } else if (self.themeNum == 1) {
                     self.cardButtonsArray[index].setTitle(foodEmojis[brain.cardsArray[index].identifier], for: UIControlState.normal)
                } else if (self.themeNum == 2) {
                    self.cardButtonsArray[index].setTitle(faceEmojis[brain.cardsArray[index].identifier], for: UIControlState.normal)
                } else if (self.themeNum == 3) {
                    self.cardButtonsArray[index].setTitle(sportsEmojis[brain.cardsArray[index].identifier], for: UIControlState.normal)
                }
                
            } else {
                
                if (!brain.cardsArray[index].matched) {
                    self.cardButtonsArray[index].backgroundColor = #colorLiteral(red: 0.4708153009, green: 0.5773581862, blue: 0.9637343287, alpha: 1)
                    self.cardButtonsArray[index].setTitle("", for: UIControlState.normal)
                } else {
                    self.cardButtonsArray[index].backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
                    self.cardButtonsArray[index].setTitle("", for: UIControlState.normal)
                    self.cardButtonsArray[index].isEnabled = false
                }
            }
            
        }
        
        if (brain.numOfCardsFacedUp == 2) {
            close()
            brain.checkForMatch()
            self.pointsLabel.text = "Points: \(brain.points)"
        }
        
    }
    
    private func close() {
        
        for index in 0..<brain.cardsArray.count {
            
            if (brain.cardsArray[index].isFaceUp) {
                brain.cardPressed(index: index)
                brain.cardsFacedUp.append(brain.cardsArray[index])
                brain.indexesOfCardsFacedUp.append(index)
            }
            
        }
        
        brain.numOfCardsFacedUp = 0
        
    }
    
}

