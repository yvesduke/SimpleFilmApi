//
//  FilmRepo.swift
//  FilmPracticalTask
//
//  Created by Yves Dukuze on 20/05/2023.
//

import Foundation

protocol FilmRepo {
    func getFilm(for url: URL) async throws -> Film
    func getCharacter(for url: URL) async throws -> Character
}
struct FilmRepoImplementation {
    private let networkManager: Fetchable

    init(networkManager: Fetchable) {
        self.networkManager = networkManager
    }
}
extension FilmRepoImplementation: FilmRepo {

    func getFilm(for url: URL) async throws -> Film {
        do{
            let listsData =  try await networkManager.get(url: url)
            let lists = try JSONDecoder().decode(Film.self, from: listsData )
            return lists
        }catch let error{
            throw error
        }
    }

    func getCharacter(for url: URL) async throws -> Character {
        do{
            let listsData =  try await networkManager.get(url: url)
            let lists = try JSONDecoder().decode(Character.self, from: listsData )
            return lists
        }catch let error{
            throw error
        }
    }
}
