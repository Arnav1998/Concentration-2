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
    private let brain = ConcentrationBrain(numOfCardPairs: 9)
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
        //get new theme
        //change points count to 0
        //shuffle cards
    }
    
    private func update() {
        
        for index in 0..<cardButtonsArray.count {
            
            if (brain.cardsArray[index].isFaceUp) {
                self.cardButtonsArray[index].backgroundColor = #colorLiteral(red: 0.7233663201, green: 0.7233663201, blue: 0.7233663201, alpha: 1)
                
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
                self.cardButtonsArray[index].backgroundColor = #colorLiteral(red: 0.912140429, green: 0.04857309163, blue: 0.07928407937, alpha: 1)
                self.cardButtonsArray[index].setTitle("", for: UIControlState.normal)
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
            }
            
        }
        
        brain.numOfCardsFacedUp = 0
        
    }
    
}

