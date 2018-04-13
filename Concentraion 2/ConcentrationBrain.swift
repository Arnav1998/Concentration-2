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
    let numOfCardPairs: Int
    
    init(numOfCardPairs: Int) {
        
        self.numOfCardPairs = numOfCardPairs
       
        generateCards()
        
        //TODO shuffle cards
        
    }
    
    func cardPressed(index:Int) {
        
        if (cardsArray[index].isFaceUp) {
            cardsArray[index].isFaceUp = false
        } else {
            cardsArray[index].isFaceUp = true
        }
        
    }
    
    func generateCards() {
        
        for index in 0..<self.numOfCardPairs {
            
            cardsArray.append(Card(identifier: index, isFaceUp: false))
            cardsArray.append(Card(identifier: index, isFaceUp: false))
            
        }
        
    }
    
}
