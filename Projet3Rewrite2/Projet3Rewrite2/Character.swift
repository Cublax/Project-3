//
//  Character.swift
//  Projet3Rewrite2
//
//  Created by Alexandre Quiblier on 10/09/2018.
//  Copyright © 2018 Alexandre Quiblier. All rights reserved.
//

import Foundation


enum CharacterType {
    case warrior
    case dwarf
    case magus
    case collosus
    case undefined
}

class Character {
    
    let name: String
    let type: CharacterType
    private(set) var life: UInt = 0
    
    init(name: String, type: CharacterType) {
        self.name = name
        self.type = type
    
        switch type {
        case .collosus:
            self.life = 120
        case .warrior:
            self.life = 100
        default:
            self.life = 80
    
    }
    }
}
