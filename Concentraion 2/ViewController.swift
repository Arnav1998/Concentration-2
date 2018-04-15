//
//  ViewController.swift
//  Concentraion 2
//
//  Created by ARNAV SINGHANIA on 4/12/18.
//  Copyright © 2018 Singhania Tech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var newGameLabel: UIButton!
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet var cardButtonsArray: [UIButton]!
    private var brain = ConcentrationBrain(numOfCardPairs: 9)
    private let animalsEmojis = ["🐶","🦁","🐼","🦄","🐛","🦋","🐳","🐿","🐇"]
    private let foodEmojis = ["🍉","🥝","🍔","🍟","🍕","🥗","🍝","🍙","🥧"]
    private let sportsEmojis = ["🥈","🏄🏻‍♀️","⚽️","⚾️","🏌️‍♀️","🤸‍♂️","🤾🏾‍♂️","🏊🏻‍♀️","🤼‍♀️"]
    private let faceEmojis = ["😌","🤯","👻","🙄","🤡","😴","🤗","🤑","😈"]
    private var themeNum = 0
    
    @IBOutlet weak var concentrationLabel: UILabel!
    
    @IBAction func cardButtonClicked(_ sender: UIButton) {
        brain.cardPressed(index: cardButtonsArray.index(of: sender)!)
        self.update();
    }
    
    @IBAction func newGameButtonClicked() {

        self.themeNum = Int(arc4random_uniform(4))
        
        if (self.themeNum == 0) {
            view.backgroundColor = #colorLiteral(red: 0.03137254902, green: 0.03137254902, blue: 0.368627451, alpha: 1)
            self.concentrationLabel.textColor = #colorLiteral(red: 0.6352941176, green: 0.937254902, blue: 0.2666666667, alpha: 1)
            self.pointsLabel.textColor = #colorLiteral(red: 0.6352941176, green: 0.937254902, blue: 0.2666666667, alpha: 1)
            self.newGameLabel.setTitleColor(#colorLiteral(red: 0.6352941176, green: 0.937254902, blue: 0.2666666667, alpha: 1), for: UIControlState.normal)
        } else if (self.themeNum == 1) {
            view.backgroundColor = #colorLiteral(red: 0.1607843137, green: 0.1529411765, blue: 0.1450980392, alpha: 1)
            self.concentrationLabel.textColor = #colorLiteral(red: 0.768627451, green: 0, blue: 0.09411764706, alpha: 1)
            self.pointsLabel.textColor = #colorLiteral(red: 0.768627451, green: 0, blue: 0.09411764706, alpha: 1)
            self.newGameLabel.setTitleColor(#colorLiteral(red: 0.768627451, green: 0, blue: 0.09411764706, alpha: 1), for: UIControlState.normal)
        } else if (self.themeNum == 2) {
            view.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.2196078431, blue: 0.3490196078, alpha: 1)
            self.concentrationLabel.textColor = #colorLiteral(red: 0.1568627451, green: 0.1921568627, blue: 0.2862745098, alpha: 1)
            self.pointsLabel.textColor = #colorLiteral(red: 0.1568627451, green: 0.1921568627, blue: 0.2862745098, alpha: 1)
            self.newGameLabel.setTitleColor(#colorLiteral(red: 0.1568627451, green: 0.1921568627, blue: 0.2862745098, alpha: 1), for: UIControlState.normal)
        } else {
            view.backgroundColor = #colorLiteral(red: 0.1843137255, green: 0.8823529412, blue: 0.8392156863, alpha: 1)
            self.concentrationLabel.textColor = #colorLiteral(red: 1, green: 0.9843137255, blue: 0.5921568627, alpha: 1)
            self.pointsLabel.textColor = #colorLiteral(red: 1, green: 0.9843137255, blue: 0.5921568627, alpha: 1)
            self.newGameLabel.setTitleColor(#colorLiteral(red: 1, green: 0.9843137255, blue: 0.5921568627, alpha: 1), for: UIControlState.normal)
        }
        
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
                
                if (self.themeNum == 0) {
                    self.cardButtonsArray[index].setTitle(animalsEmojis[brain.cardsArray[index].identifier], for: UIControlState.normal)
                    self.cardButtonsArray[index].backgroundColor = #colorLiteral(red: 1, green: 0.9411764706, blue: 0.4784313725, alpha: 1)
                } else if (self.themeNum == 1) {
                     self.cardButtonsArray[index].setTitle(foodEmojis[brain.cardsArray[index].identifier], for: UIControlState.normal)
                     self.cardButtonsArray[index].backgroundColor = #colorLiteral(red: 1, green: 0.3803921569, blue: 0.02745098039, alpha: 1)
                } else if (self.themeNum == 2) {
                    self.cardButtonsArray[index].setTitle(faceEmojis[brain.cardsArray[index].identifier], for: UIControlState.normal)
                    self.cardButtonsArray[index].backgroundColor = #colorLiteral(red: 0.8588235294, green: 0.9294117647, blue: 0.9529411765, alpha: 1)
                } else if (self.themeNum == 3) {
                    self.cardButtonsArray[index].setTitle(sportsEmojis[brain.cardsArray[index].identifier], for: UIControlState.normal)
                    self.cardButtonsArray[index].backgroundColor = #colorLiteral(red: 0.5921568627, green: 1, blue: 0.8117647059, alpha: 1)
                }
                
            } else {
                
                if (!brain.cardsArray[index].matched) {
                    if (self.themeNum == 0) {
                        self.cardButtonsArray[index].backgroundColor = #colorLiteral(red: 0.6352941176, green: 0.937254902, blue: 0.2666666667, alpha: 1)
                    } else if (self.themeNum == 1) {
                        self.cardButtonsArray[index].backgroundColor = #colorLiteral(red: 0.768627451, green: 0, blue: 0.09411764706, alpha: 1)
                    } else if (self.themeNum == 2) {
                        self.cardButtonsArray[index].backgroundColor = #colorLiteral(red: 0.1568627451, green: 0.1921568627, blue: 0.2862745098, alpha: 1)
                    } else {
                        self.cardButtonsArray[index].backgroundColor = #colorLiteral(red: 1, green: 0.9843137255, blue: 0.5921568627, alpha: 1)
                    }
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

