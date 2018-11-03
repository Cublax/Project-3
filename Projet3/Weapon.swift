//
//  Weapon.swift
//  Projet3
//
//  Created by Alexandre Quiblier on 31/08/2018.
//  Copyright © 2018 Alexandre Quiblier. All rights reserved.
//

import Foundation

enum WeaponType {
    case sword
    case axe
    case bow
    case scepter
    case legendarySword
    case legendaryScepter
}

class Weapon: Item {
    
    let name: String
    let type: WeaponType
    private(set) var damage: Int 
    
    init(type: WeaponType) {
        self.type = type
        
        switch type {
        case .sword:
            self.damage = 10
            self.name = "Sword"
        case .bow:
            self.damage = 8
            self.name = "Bow"
        case .axe:
            self.damage = 15
            self.name = "Axe"
        case .scepter:
            self.damage = -10
            self.name = "Scepter"
        case .legendarySword:
            self.damage = 20
            self.name = "Legendary Sword"
        case .legendaryScepter:
            self.damage = -20
            self.name = "Legendary Scepter"
        }
    }
    
}

extension Weapon: Equatable {
    static func == (lhs: Weapon, rhs: Weapon) -> Bool {
        return String(describing: lhs) == String(describing: rhs)
    }
}
