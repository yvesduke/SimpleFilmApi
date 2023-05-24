//
//  CharacterRepo.swift
//  FilmPracticalTask
//
//  Created by Yves Dukuze on 24/05/2023.
//

import Foundation


protocol CharacterRepo {
    func getCharacters(for url: URL) async throws -> Character
}
struct CharacterRepoImplementation {
    private let networkManager: Fetchable

    init(networkManager: Fetchable) {
        self.networkManager = networkManager
    }
}
extension CharacterRepoImplementation: CharacterRepo {
    func getCharacters(for url: URL) async throws -> Character {
        do{
            let listsData =  try await networkManager.get(url: url)
            let lists = try JSONDecoder().decode(Character.self, from: listsData )
            return lists
        }catch let error{
            throw error
        }
    }
}
