//
//  Chest.swift
//  Projet3
//
//  Created by Alexandre Quiblier on 07/10/2018.
//  Copyright © 2018 Alexandre Quiblier. All rights reserved.
//

import Foundation


class Chest {
    
     var items: [ItemType] = []

    private(set) var nbRandom = Int.random(in: 0..<5)
    
    init() {
        switch nbRandom {
        case 0:
            items.append(.weapon(weapon: Weapon(type: .legendaryScepter)))
        case 1:
            items.append(ItemType.potion(potion: Potion(type: .bad)))
        case 2:
            items.append(ItemType.potion(potion: Potion(type: .good)))
        case 3:
            items.append(.weapon(weapon: Weapon(type: .legendarySword)))
        default:
            items = []
        }
    }
}
