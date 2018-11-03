//
//  Item.swift
//  Projet3
//
//  Created by Alexandre Quiblier on 16/10/2018.
//  Copyright © 2018 Alexandre Quiblier. All rights reserved.
//

import Foundation

enum ItemType {
    case weapon(weapon: Weapon)
    case potion(potion: Potion)
    
}

protocol Item {
    var name: String { get }
    var damage: Int { get }
}
