//
//  CharacterViewModel.swift
//  FilmPracticalTask
//
//  Created by Yves Dukuze on 24/05/2023.
//

import Foundation
import CoreData

protocol CharacterListViewModelAction: ObservableObject {
    func getCharacterList(urlStr: String, context: NSManagedObjectContext) async
}


@MainActor
final class CharacterListViewModel {
//    @Published private(set) var characterLists: [Character] = []
    @Published private(set) var character: Character?
    @Published var customError: NetworkError?
    
    private let repository: CharacterRepo
    
    init(repository: CharacterRepo) {
        self.repository = repository
    }
}

extension CharacterListViewModel: CharacterListViewModelAction {
    
    func getCharacterList(urlStr: String, context: NSManagedObjectContext) async {

        guard let url = URL(string: urlStr) else {
            DispatchQueue.main.async {
                self.customError = NetworkError.invalidURL
                print("Invalid Url")
            }
            return
        }
        do {
            let character = try await repository.getCharacters(for: url)
            print("Data saved successfuly")
            self.character = character
            self.customError = nil
            await self.saveDataIntoDB(context: context)
        }catch let someError {
            print(someError.localizedDescription)
                switch someError{
                case is URLError:
                    self.customError = NetworkError.invalidURL
                    print("Invlid Url")
                case NetworkError.dataNotFound:
                    self.customError = NetworkError.dataNotFound
                    print("Data not found")
                case is DecodingError:
                    self.customError = NetworkError.parsingError
                    print("Parsing Error")
                default:
                    self.customError = NetworkError.dataNotFound
                    print("Default case Error not recognised")
                }
        }
    }
    
    private func saveDataIntoDB(context:NSManagedObjectContext) async {
        let coreDataRepository = CoreDataRepositoryImpl(context: context)
        do{
            try await coreDataRepository.saveCharacterList(character: character ?? Character.MockeCharacter())
                print("Saved to Db Successfully")
        }catch{
           print("DB Save Failed")
        }
    }
}
