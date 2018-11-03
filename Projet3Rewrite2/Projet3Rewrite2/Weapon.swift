//
//  Weapon.swift
//  Projet3Rewrite2
//
//  Created by Alexandre Quiblier on 10/09/2018.
//  Copyright © 2018 Alexandre Quiblier. All rights reserved.
//

import Foundation


enum WeaponType {
    case sword
    case bow
    case axe
}

class Weapon {
    let name: String
    let type: WeaponType
    private(set) var damage: Int
    
    init(name: String, type: WeaponType) {
        self.name = name
        self.type = type
        
        switch type {
        case .sword:
            self.damage = 100
        case .bow:
            self.damage = 80
        case .axe:
            self.damage = 120
        }
    }
}
