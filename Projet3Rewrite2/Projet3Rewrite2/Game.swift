//
//  Game.swift
//  Projet3Rewrite2
//
//  Created by Alexandre Quiblier on 10/09/2018.
//  Copyright © 2018 Alexandre Quiblier. All rights reserved.
//

import Foundation


class Game {
    
    var teams: [Team] = []
    
    func start() {
        print("Début de la partie.")
        settings()
        play()
        endGame()
    }
    
    func settings() {
        print("Configuration des paramètres du jeux")
        
        for index in 1...2 {
            
            print(" Joueur:\(index), merci d'entrer votre nom : ")
            
            var name: String = ""
            repeat {
                print("Merci d'entrer au moins 1 charactère")
               if let choosenName = readLine() {
                    name = choosenName
                }
            }while name == ""
                
            var characters = [Character]()
            for characterIndex in 1...3 {
                
            var nameFighter = ""
                repeat {
                    
                print("Joueur \(index) merci de choisir un nom pour votre perso: \(characterIndex) :")
                     if let choosenCharacterName = readLine() {
                        nameFighter = choosenCharacterName
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
        print("Il y a \(teams.count) joueurs dans la partie")
        for team in teams {
            print("Le joueur a comme nom : \(team.name) et comme persos: ")
            for character in team.characters {
                print("nom: \(character.name) | type: \(character.type) || life: \(character.life)")
            }
        }
        
    }
    
    func play() {
        print("Déroulement de la partie")
    }
    
    func endGame() {
        print("Bilan du combat")
    }
}
