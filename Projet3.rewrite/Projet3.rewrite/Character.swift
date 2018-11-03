//
//  Character.swift
//  Projet3.rewrite
//
//  Created by Alexandre Quiblier on 04/09/2018.
//  Copyright © 2018 Alexandre Quiblier. All rights reserved.
//

import Foundation

enum CharacterType {
    case warrior
    case magus
    case collosus
    case dwarf
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
            self.life = 100
        case .dwarf:
            self.life = 80
        default:
            self.life = 50
        }
    }
    
}
