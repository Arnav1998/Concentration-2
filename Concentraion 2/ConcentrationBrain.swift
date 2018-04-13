//
//  ConcentrationBrain.swift
//  Concentraion 2
//
//  Created by ARNAV SINGHANIA on 4/12/18.
//  Copyright © 2018 Singhania Tech. All rights reserved.
//

import Foundation

class ConcentrationBrain {
    
    var cardsArray = [Card]()
    private let numOfCardPairs: Int
    var numOfCardsFacedUp: Int = 0
    var cardsFacedUp = [Card]()
    var points = 0
    
    init(numOfCardPairs: Int) {
        
        self.numOfCardPairs = numOfCardPairs
       
        self.generateCards()
        
        self.shuffle()
        
    }
    
    func cardPressed(index:Int) {
        
        if (cardsArray[index].isFaceUp) {
            cardsArray[index].isFaceUp = false
            self.numOfCardsFacedUp -= 1
        } else {
            cardsArray[index].isFaceUp = true
            self.numOfCardsFacedUp += 1
        }
        
    }
    
    private func generateCards() {
        
        for index in 0..<self.numOfCardPairs {
            
            cardsArray.append(Card(identifier: index, isFaceUp: false))
            cardsArray.append(Card(identifier: index, isFaceUp: false))
            
        }
        
    }
    
    private func shuffle() {
        
        for counter in 0..<(2*self.numOfCardPairs) {
            let index = Int(arc4random_uniform(UInt32(self.numOfCardPairs*2)))
            let firstIdentifier = self.cardsArray[counter].identifier
            let secondIdentifier = self.cardsArray[index].identifier
            self.cardsArray[counter].identifier = secondIdentifier
            self.cardsArray[index].identifier = firstIdentifier
        }
        
    }
    
    func checkForMatch(){
        
        if (self.cardsFacedUp[0].identifier == self.cardsFacedUp[1].identifier) {
            points+=1
        }
        
        cardsFacedUp.removeAll()
        
    }
    
    
    
}
