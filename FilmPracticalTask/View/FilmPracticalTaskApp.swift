//
//  FilmPracticalTaskApp.swift
//  FilmPracticalTask
//
//  Created by Yves Dukuze on 16/05/2023.
//

import SwiftUI

@main
struct FilmPracticalTaskApp: App {
    let persitenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: FilmListViewModel(repository: FilmRepoImplementation(networkManager: NetworkManager()))).environment(\.managedObjectContext, persitenceController.container.viewContext)
        }
    }
}
