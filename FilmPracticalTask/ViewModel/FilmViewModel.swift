//
//  FilmViewModel.swift
//  FilmPracticalTask
//
//  Created by Yves Dukuze on 20/05/2023.
//

import Foundation
import CoreData

protocol FilmListViewModelAction: ObservableObject {
    func getFilmList(urlStr: String, context: NSManagedObjectContext) async
}


@MainActor
final class FilmListViewModel {
    @Published private(set) var filmLists: [Result] = []
    @Published var customError: NetworkError?
    
    private let repository: FilmRepo
    
    init(repository: FilmRepo) {
        self.repository = repository
    }
}

extension FilmListViewModel: FilmListViewModelAction {
    
    func getFilmList(urlStr: String, context: NSManagedObjectContext) async {

        guard let url = URL(string: urlStr) else {
            DispatchQueue.main.async {
                self.customError = NetworkError.invalidURL
                print("Invalid Url")
            }
            return
        }
        do {
            let film = try await repository.getFilm(for: url)
            print("Data saved successfuly")
                self.filmLists = film.results
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
            try await coreDataRepository.saveFilmList(films: filmLists)
                print("Saved to Db Successfully")
        }catch{
           print("DB Save Failed")
        }
    }
}
