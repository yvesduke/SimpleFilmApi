//
//  FilmListCoreDataRepo.swift
//  FilmPracticalTask
//
//  Created by Yves Dukuze on 21/05/2023.
//

import Foundation
import CoreData

protocol FilmListCoreDataRepo {

    func savePlanetList(planets:[Result]) async throws
    func getPlanetListFromDb() async throws -> [FilmEntity]

}

class PlanetListCoreDataRepositoryImpl: FilmListCoreDataRepo {

    var context: NSManagedObjectContext

    init(context: NSManagedObjectContext) {
        self.context = context
    }

    func savePlanetList(planets: [Result]) async throws {
        planets.forEach{ film in
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

    func getPlanetListFromDb() async throws -> [FilmEntity] {
        let fetchRequest: NSFetchRequest<FilmEntity>
        fetchRequest = FilmEntity.fetchRequest()
        let films = try context.fetch(fetchRequest)
        return films
    }

}
