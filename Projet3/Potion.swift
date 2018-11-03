//
//  Potion.swift
//  Projet3
//
//  Created by Alexandre Quiblier on 16/10/2018.
//  Copyright © 2018 Alexandre Quiblier. All rights reserved.
//

import Foundation

enum PotionType {
    case good
    case bad
}

class Potion: Item {
    
    var name: String
    
    private(set)var damage: Int
    
    let type: PotionType
    
    
    init(type: PotionType) {
        self.type = type
        
        switch type {
        case .bad:
            self.damage = 20
            self.name = "Bad potion"
        case .good:
            self.damage = -20
            self.name = "Good potion"
        }
    }
    
}
