//
//  Game.swift
//  Projet3.rewrite
//
//  Created by Alexandre Quiblier on 05/09/2018.
//  Copyright © 2018 Alexandre Quiblier. All rights reserved.
//

import Foundation


class Game {
    
    // MARK: - Properties
    var teams: [Team] = []
    
    // MARK: - Start
    
    func start() {
        print("Le Jeux à demarrer")
        settings()
        play()
        endGame()
    }
    
    // MARK: - Settings
    
    func settings() {
        print("Configuration des paramètres du jeux")
        
        for index in 1...2 {
            
            print("Jouer \(index) entrez votre nom:")
            
            var name = ""
            repeat {
                print("merci d'entrer un nom d'au moins 1 charactère.")
                if let nameChosen = readLine() {
                    name = nameChosen
                }
            } while name == ""
            
            var characters = [Character]()
            for characterIndex in 1...3 {
                print("Joueur \(index): Configuration de votre personnage n:\(characterIndex) :")
                
                var nameFighter = ""
                repeat {
                    
                    print("merci d'entrer le nom du perso \(characterIndex):")
                    if let chosenName = readLine() {
                        nameFighter = chosenName
                    }
                } while nameFighter == ""
                
                var characterType: CharacterType = .undefined
                repeat {
                    print("""
                        Choisir un type de personnage :
                            1: Warrior
                            2: Magus
                            3: Colossus
                            4: Dwarf
                        """)
                    if let chosenNumber = readLine(), let number = Int(chosenNumber) {
                        switch number {
                        case 1:
                            characterType = .warrior
                        case 2:
                            characterType = .magus
                        case 3:
                            characterType = .collosus
                        case 4:
                            characterType = .dwarf
                        default:
                            characterType = .undefined
                        }
                    }
                } while characterType == .undefined
                
                let perso = Character(name: nameFighter, type: characterType)
                characters.append(perso)
            }
            
            let team = Team(name: name, characters: characters)
            teams.append(team)
            
         
        }
        print("Il y a \(teams.count) équipes")
        for team in teams {
            print("Le joueur a comme nom : \(team.name) et comme persos: ")
            for character in team.characters {
                print("nom: \(character.name) | type: \(character.type) || life: \(character.life)")
            }
        }
    }
    
    
    
    
    
    
    // MARK: - Play
    
    func play () {
        print("Deroulement du combat")
    }
    
    
    
    // MARK: -EndGame
    
    func endGame() {
        print("Bilan du combat")
    }
}

