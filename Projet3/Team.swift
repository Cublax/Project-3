//
//  Team.swift
//  Projet3
//
//  Created by Alexandre Quiblier on 06/07/2018.
//  Copyright © 2018 Alexandre Quiblier. All rights reserved.
//

import Foundation

class Team {

    let name: String
    private(set) var characters: [Character]
    
    init(name: String, characters: [Character]) {
        self.name = name
        self.characters = characters
    }
    
    func removeCharacter(at index: Int) {
        self.characters.remove(at: index)
    }
}


