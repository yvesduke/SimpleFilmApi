//
//  FilmViewModel.swift
//  FilmPracticalTask
//
//  Created by Yves Dukuze on 20/05/2023.
//

import Foundation
import Combine
import CoreData

protocol FilmListViewModelAction: ObservableObject {
    func getFilmList(urlStr: String) async
}


@MainActor
final class FilmListViewModel {
    @Published private(set) var filmLists: [Result] = []
    @Published var customError: NetworkError?
    
    @Published var planetsDb:[FilmEntity] = []
    @Published var dbError: DbDataError?
    
    private var coreDataRepository: FilmListCoreDataRepo?
    private let repository: FilmRepo
    
    init(repository: FilmRepo) {
        self.repository = repository
    }
}

extension FilmListViewModel: FilmListViewModelAction {
    
    func getFilmList(urlStr: String) async {
        guard let url = URL(string: urlStr) else {
            DispatchQueue.main.async {
                self.customError = NetworkError.invalidURL
            }
            return
        }
        do {
            let film = try await repository.getFilm(for: url)
            DispatchQueue.main.async {
                self.filmLists = film.results
            }
        }catch let someError {
            print(someError.localizedDescription)
            DispatchQueue.main.async {
                switch someError{
                case is URLError:
                    self.customError = NetworkError.invalidURL
                case NetworkError.dataNotFound:
                    self.customError = NetworkError.dataNotFound
                case is DecodingError:
                    self.customError = NetworkError.parsingError
                default:
                    self.customError = NetworkError.dataNotFound
                }
            }
        }
    }
    
    private func saveDataIntoDB(context:NSManagedObjectContext) async {
        do{
            try await coreDataRepository?.savePlanetList(planets: filmLists)
            print("DB Saved successfully")
            DispatchQueue.main.async {
                self.dbError = nil
            }
        }catch{
           print("DB Save Failed")
            self.dbError = DbDataError.savingError
        }
    }
    
    func getDataFromDb(context: NSManagedObjectContext) async {
        do {
//            coreDataRepository = PlanetListCoreDataRepositoryImpl(context: context)
            if let planets = try await coreDataRepository?.getPlanetListFromDb() {
                print("DB retrieved successfully")
                DispatchQueue.main.async {
                    self.planetsDb = planets
                    self.dbError = nil
                }
            }
        } catch {
            print("DB fetch Failed")
            self.dbError = DbDataError.gettingError
        }
    }
    
    
}
