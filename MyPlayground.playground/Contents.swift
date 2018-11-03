import UIKit

enum ItemType {
    case weapon(weapon: WeaponType)
    case potion
}

protocol Item {
    var itemType: ItemType { get }
}

class Potion: Item {
    
    var itemType: ItemType = .potion
    
    var name = "Super potion"
    var damage = 20
}

enum WeaponType {
    case bow
    case axe
    case stick
    case ultrasupramegaAXE
}

class Weapon: Item {
    
    var itemType: ItemType
    let type: WeaponType
    let damage: Int
    
    init(type: WeaponType) {
        self.type = type
        itemType = .weapon(weapon: type)
        switch type {
        case .axe:
            self.damage = 10
        case .ultrasupramegaAXE:
            self.damage = 100000
        default:
            self.damage = 50
        }
    }
    
    var name = "Super Weapon"
}

class Chest {
    
    var items: [Item] = []
    
    init() {
        items = [Potion(), Weapon(type: .stick)]
    }
}


let chest = Chest()


enum CharacterType {
    case magus
    case colossus
}

class Character {
    
    let type: CharacterType
    
    private(set) var weapon: Weapon
    
    init(type: CharacterType) {
        self.type = type
        switch type {
        case .colossus:
            self.weapon = Weapon(type: .axe)
        case .magus:
            self.weapon = Weapon(type: .bow)
        }
    }
    
    func updateWeapon(_ weapon: WeaponType) {
        switch type {
        case .magus:
            switch weapon {
            case .axe:
                break
            case .bow:
                self.weapon = Weapon(type: .bow)
            case .stick:
                self.weapon = Weapon(type: .stick)
            case .ultrasupramegaAXE:
                break
            }
        case .colossus:
            if case .ultrasupramegaAXE = weapon { // tricks quand on veut atteindre seulement un cas de l'enum
                self.weapon = Weapon(type: .ultrasupramegaAXE)
            }
        }
    }
}

let character = Character(type: .magus)
print(character.weapon.type)

chest.items.forEach { item in
    switch item.itemType {
    case .potion:
        break
    case .weapon(weapon: let weapon):
        character.updateWeapon(weapon)
    }
}


