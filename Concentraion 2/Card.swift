//
//  Card.swift
//  Concentraion 2
//
//  Created by ARNAV SINGHANIA on 4/12/18.
//  Copyright © 2018 Singhania Tech. All rights reserved.
//

import Foundation

struct Card {
    
    var identifier: Int
    var isFaceUp: Bool = false
    var numOfTimesFlipped: Int = 0
    var matched: Bool = false
    
    init(identifier: Int) {
        self.identifier = identifier
    }
}
