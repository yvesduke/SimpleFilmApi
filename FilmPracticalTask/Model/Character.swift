//
//  Character.swift
//  FilmPracticalTask
//
//  Created by Yves Dukuze on 24/05/2023.

import Foundation
import CoreData

// MARK: - Character
struct Character: Codable {
    
    static func == (lhs: Character, rhs: Character) -> Bool {
        return lhs.id == rhs.id && lhs.homeworld == rhs.homeworld && lhs.created == rhs.created && lhs.edited == rhs.edited && lhs.url == rhs.url && lhs.name == rhs.name && lhs.height == rhs.height && lhs.mass == rhs.mass && lhs.hairColor == rhs.hairColor && lhs.skinColor == rhs.skinColor && lhs.eyeColor == rhs.eyeColor && lhs.birthYear == rhs.birthYear && lhs.gender == rhs.gender && lhs.species == rhs.species && lhs.vehicles == rhs.vehicles && lhs.starships == rhs.starships && lhs.films == rhs.films
    }

    let id = UUID()
    let homeworld, created, edited, url, name, height, mass, hairColor: String
    let skinColor, eyeColor, birthYear, gender: String
    let species,vehicles, starships, films: [String]

    enum CodingKeys: String, CodingKey {
        case name, height, mass
        case gender, homeworld, films, species, vehicles, starships, created, edited, url
        case hairColor = "hair_color"
        case skinColor = "skin_color"
        case eyeColor = "eye_color"
        case birthYear = "birth_year"
    }
}

extension Character {
    
    static func MockeCharacterEntity() -> CharacterEntity {
        
        let context = NSManagedObjectContext()
        let entity = CharacterEntity(context: context)
        entity.films = NSObject()
        entity.starships = NSObject()
        entity.url = "character.url"
        entity.edited = "character.edited"
        entity.created = "character.created"
        entity.species = NSObject()
//        entity.id = ":"
        entity.birthYear = "character.birthYear"
        entity.eyeColor = "character.eyeColor"
        entity.gender = "character.gender"
        entity.hairColor = "character.hairColor"
        entity.height = "character.height"
        entity.homeworld = "character.homeworld"
        entity.mass = "character.mass"
        entity.name = "character.name"
        entity.skinColor = "character.skinColor"
        return CharacterEntity(context: context)
        
    }
    
    static func MockeCharacter() -> Character {
        return Character(homeworld: "", created: "", edited: "", url: "", name: "", height: "", mass: "", hairColor: "", skinColor: "", eyeColor: "", birthYear: "", gender: "", species: [], vehicles: [], starships: [], films: [])
        
    }
    
    
}

