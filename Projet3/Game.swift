//
//  Game.swift
//  Projet3
//
//  Created by Alexandre Quiblier on 06/07/2018.
//  Copyright © 2018 Alexandre Quiblier. All rights reserved.
//

import Foundation

class Game {
    
    // MARK: - Properties
    
    var teams: [Team] = []
    var roundcompter: Int
    var uniqueNames: [String] = []
    
    init() {
        self.roundcompter = 0
    }
    
    // MARK: - Start
    
    func start() {
        print("                                                                      🏰 GAME START 🏰")
        settings()
        play()
        endGame()
    }
    
    // MARK: - Settings
    
    func settings() {
        print("""
                 \n
                 🔧 SETTINGS 🔧
                 """)
        configureTeams()
        print(" \(teams.count) Teams configured ")
        for team in teams {
            print("""
                \(team.name)'s team is composed by :
                """)
            var compteur: Int = 1
            for character in team.characters {
                print("""
                    \(compteur)  \(character.name)        \(character.type) ❤️ \(character.life)        |WEAPON|      \(character.weapon.name)   dmg \(character.weapon.damage)
                    """ )
                compteur += 1
            }
        }
    }
    
    // Implémentation
    fileprivate func configureTeams() {
        for index in 1...2 {
            
            print(" PLAYER \(index), please enter a name for your team : ")
            
            let name = configureName()
            
            var characters = [Character]()
            configureCharacters(index, &characters)
            
            let team = Team(name: name, characters: characters)
            teams.append(team)
        }
    }
    
    fileprivate func configureName() -> String {
        var name = ""
        repeat {
            if let result = readLine() {
                name = result
            }
        } while name == "" || uniqueNames.contains(name)
        uniqueNames.append(name)
        return name
    }
    
    fileprivate func configureCharacterName(_ characterIndex: Int, _ nameFighter: inout String) {
        repeat {
            print("Please enter a name for your character nb: \(characterIndex) ")
            if let nameCharacter = readLine() {
                nameFighter = nameCharacter
            }
        } while nameFighter == "" || uniqueNames.contains(nameFighter)
    }
    
    fileprivate func configureCharacterType(_ characterType: inout CharacterType) {
        repeat {
            print("""
                        Choisir un type de personnage :
                            1️⃣ Warrior
                            2️⃣ Magus
                            3️⃣ Colossus
                            4️⃣ Dwarf
                        """)
            if let chosenNumber = readLine(), let number = Int(chosenNumber) {
                switch number {
                case 1:
                    characterType = .warrior
                case 2:
                    characterType = .magus
                case 3:
                    characterType = .colossus
                case 4:
                    characterType = .dwarf
                default:
                    characterType = .undefined
                }
            }
        } while characterType == .undefined
    }
    
    fileprivate func configureCharacters(_ index: Int, _ characters: inout [Character]) {
        for characterIndex in 1...3 {
            
            var nameFighter = ""
            configureCharacterName(characterIndex, &nameFighter)
            uniqueNames.append(nameFighter)
            
            var characterType: CharacterType = .undefined
            configureCharacterType(&characterType)
            
            let perso = Character(name: nameFighter, type: characterType)
            characters.append(perso)
        }
    }
    
    // MARK: - Play
    
    func play() {
        var resume: String = ""
        print("Battle Start 🔱")
        repeat {
            for _ in 1...5 {
                print("""
                     \n
                """) }
            print(resume)
            resume = ""
            print(" \(teams[0].name)'s turn to play :")
            var characterIndex = 1
            for character in teams[0].characters {
                print("\(characterIndex)  \(character.name)        \(character.type) ❤️ \(character.life)        |WEAPON|      \(character.weapon.name)   dmg \(character.weapon.damage)" )
                characterIndex += 1
            }
            var chosenCharacter: Character? = nil
            repeat {
                print("Please enter index Chosen character")
                if let number = readLine(), let chosenPerso = Int(number), chosenPerso >= 1 && chosenPerso <= 3, chosenPerso <= teams[0].characters.count {
                    switch chosenPerso {
                    case 1 : chosenCharacter = teams[0].characters[0]
                    case 2 : chosenCharacter = teams[0].characters[1]
                    case 3 : chosenCharacter = teams[0].characters[2]
                    default : chosenCharacter = nil
                    }
                } else { chosenCharacter = nil }
            } while chosenCharacter == nil
            
            guard let _chosenCharacter = chosenCharacter else {
                fatalError("chosenCharacter should be setup")
            }
            
            if Int.random(in: 0...6) == 1  {
                print("A Chest just popped !")
                
                let chest = Chest()
                
                if chest.items.isEmpty {
                    print("Bats are popping out it...")
                } else {
                    chest.items.forEach { item in
                        switch item {
                        case .potion(potion: let potion):
                            print("A potion is in it ")
                            switch potion.type {
                            case .bad:
                                print("\(_chosenCharacter.name) just drank a bad potion and loose 20 life points...")
                            case .good:
                                print("\(_chosenCharacter.name) just drank a good potion and gained 20 life points !")
                            }
                            _chosenCharacter.updateLife(with: potion.damage)
                        case .weapon(weapon: let weapon):
                            if case .magus = _chosenCharacter.type, weapon.type == .legendaryScepter {
                                _chosenCharacter.updateWeapon(with: weapon.type)
                                print("\(_chosenCharacter.name) just founded a \(weapon.name) ! heal capacity: \(weapon.damage)")
                            } else if weapon.type != .legendaryScepter, _chosenCharacter.type != .magus {
                                _chosenCharacter.updateWeapon(with: weapon.type)
                                print("\(_chosenCharacter.name) just founded a \(weapon.name) ! damage capacity: \(weapon.damage)")
                            }
                        }
                    }
                }
            }
            
            if _chosenCharacter.life > 0 {
                if _chosenCharacter.type == .magus {
                    print("Choose a character of \(teams[0].name)'s team to heal ")
                    var characterIndexBis = 1
                    teams[0].characters.forEach { character in
                        print("\(characterIndexBis)  \(character.name)          \(character.type) ❤️ \(character.life)        |WEAPON|      \(character.weapon.name)   dmg \(character.weapon.damage)" )
                        characterIndexBis += 1
                    }
                    var chosenEnemy: Character? = nil
                    repeat {
                        print("Enter the Index: ")
                        if let stringChoice = readLine(), let intChoice = Int(stringChoice), intChoice >= 1 && intChoice <= 3, intChoice <=  teams[1].characters.count {
                            switch intChoice {
                            case 1 : chosenEnemy = teams[0].characters[0]
                            case 2 : chosenEnemy = teams[0].characters[1]
                            case 3 : chosenEnemy = teams[0].characters[2]
                            default : chosenEnemy = nil
                            }
                        } else { chosenEnemy = nil }
                    } while chosenEnemy == nil
                    
                    guard let _chosenEnemy = chosenEnemy else  {
                        fatalError("chosenEnemy should be setup")
                    }
                    
                    _chosenEnemy.updateLife(with: _chosenCharacter.weapon.damage)
                    
                    resume = ("\(_chosenEnemy.name) just got healed of \(_chosenCharacter.weapon.damage) life points ")

                    
                } else {
                    
                    print("Choose one character of \(teams[1].name)'s team to attack")
                    var characterIndexBis = 1
                    teams[1].characters.forEach { character in
                        print("\(characterIndexBis)  \(character.name)          \(character.type) ❤️ \(character.life)        |WEAPON|      \(character.weapon.name)   dmg \(character.weapon.damage)" )
                        characterIndexBis += 1
                    }
                    var chosenEnemy: Character? = nil
                    repeat {
                        print("Please enter the following index ")
                        if let stringChoice = readLine(), let intChoice = Int(stringChoice), intChoice >= 1 && intChoice <= 3, intChoice <= teams[1].characters.count {
                            switch intChoice {
                            case 1 : chosenEnemy = teams[1].characters[0]
                            case 2 : chosenEnemy = teams[1].characters[1]
                            case 3 : chosenEnemy = teams[1].characters[2]
                            default : chosenEnemy = nil
                            }
                        } else { chosenEnemy = nil }
                    } while chosenEnemy == nil
                    
                    guard let _chosenEnemy = chosenEnemy, let _chosenCharacter = chosenCharacter else  {
                        fatalError("chosenEnemy & chosenCharacter should be setup")
                    }
                    
                    _chosenEnemy.updateLife(with: _chosenCharacter.weapon.damage)
                    
                    resume = ("\(_chosenEnemy.name) just lost \(_chosenCharacter.weapon.damage) life pts ")
                    
                    if _chosenEnemy.life == 0 {
                        if let index = teams[1].characters.index(of: _chosenEnemy) {
                            teams[1].removeCharacter(at: index)
                            for _ in 1...10 {
                                print("\n") }
                            print(" \(_chosenEnemy.name) is DEAD ☠️ !")
                        }
                    }
                }
            } else {
                if let index = teams[0].characters.index(of: _chosenCharacter) {
                    teams[0].removeCharacter(at: index)
                    for _ in 1...10 {
                        print("\n") }
                    
                    print(" \(_chosenCharacter.name) is DEAD ☠️ !")
                }
            }
            teams.swapAt(0, 1)
            roundcompter += 1
        } while teams[0].characters.count > 0 && teams[1].characters.count > 0
    }
    
    // MARK: - EndGame
    
    func endGame() {
        for _ in 1...10 {
            print("""
                     \n
                """) }
        print("""
            
                                                         \(teams[1].name) WIN 🏆 !
            
            
            
            It lasted \(roundcompter) rounds
            """)
        
    }
    
}

