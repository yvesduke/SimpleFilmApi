//
//  FilmListCoreDataRepo.swift
//  FilmPracticalTask
//
//  Created by Yves Dukuze on 21/05/2023.
//

import Foundation
import CoreData

protocol CoreDataRepo {

    func saveFilmList(films:[Result]) async throws
    func saveCharacterList(character: Character) async throws

}

class CoreDataRepositoryImpl: CoreDataRepo {

    var context: NSManagedObjectContext

    init(context: NSManagedObjectContext) {
        self.context = context
    }

    func saveFilmList(films: [Result]) async throws {
        films.forEach{ film in
            let entity = FilmEntity(context: context)
            entity.director = film.director
            entity.title = film.title
            entity.url = film.url
            entity.id = film.id
            entity.species = film.species as NSObject
            entity.planets = film.planets as NSObject
            entity.created = film.created
            entity.edited = film.edited
            entity.episodeID = Int32(film.episodeID)
            entity.openingCrawl = film.openingCrawl
            entity.producer = film.producer
            entity.releaseDate = film.releaseDate
            entity.vehicles = film.vehicles as NSObject
            entity.starships = film.starships as NSObject
            entity.characters = film.characters as NSObject
        }
        do{
            try context.save()
        }catch let error{
            print(error.localizedDescription)
            throw DbDataError.savingError
        }
    }
    
    func saveCharacterList(character: Character) async throws {
//        characters.forEach{ character in
            let entity = CharacterEntity(context: context)
            entity.films = character.films as NSObject
            entity.starships = character.starships as NSObject
            entity.url = character.url
            entity.edited = character.edited
            entity.created = character.created
            entity.species = character.species as NSObject
            entity.id = character.id
            entity.birthYear = character.birthYear
            entity.eyeColor = character.eyeColor
            entity.gender = character.gender
            entity.hairColor = character.hairColor
            entity.height = character.height
            entity.homeworld = character.homeworld
            entity.mass = character.mass
            entity.name = character.name
            entity.skinColor = character.skinColor
//        }
        do{
            try context.save()
        }catch let error{
            print(error.localizedDescription)
            throw DbDataError.savingError
        }
    }
    
}
