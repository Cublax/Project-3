//
//  Character.swift
//  Projet3
//
//  Created by Alexandre Quiblier on 06/07/2018.
//  Copyright © 2018 Alexandre Quiblier. All rights reserved.
//

import Foundation

enum CharacterType {
    case warrior
    case magus
    case colossus
    case dwarf
    case undefined
}

class Character {
    
    let name: String
    let type: CharacterType
    private(set) var life: Int = 0
    private(set) var weapon: Weapon
    private(set) var lifeMax: Int
    
    
    
    init(name: String, type: CharacterType) {
        self.name = name
        self.type = type
        
        switch type {
        case .warrior:
            self.life = 100
            self.lifeMax = 100
            self.weapon = Weapon(type: .sword)
        case .dwarf:
            self.life = 80
            self.lifeMax = 80
            self.weapon = Weapon(type: .axe)
        case .magus:
            self.life = 60
            self.lifeMax = 60
            self.weapon = Weapon(type: .scepter)
        default:
            self.life = 120
            self.lifeMax = 120
            self.weapon = Weapon(type: .bow)
        }
    }
    
    func updateLife(with damage: Int) {
        if damage > life {
            life = 0
        } else {
            life -= damage
        }
        if life > lifeMax {
            return life = lifeMax
        }
    }
    
    func updateWeapon(with weaponType: WeaponType) {
        self.weapon = Weapon(type: weaponType)
    }
    
}



extension Character: Equatable {
    static func == (lhs: Character, rhs: Character) -> Bool {
        return lhs.life == rhs.life && lhs.name == rhs.name && lhs.type == rhs.type && lhs.weapon == rhs.weapon
    }
    
    
}

