//
//  ContentView.swift
//  FilmPracticalTask
//
//  Created by Yves Dukuze on 16/05/2023.
//

import SwiftUI
import CoreData


struct ContentView: View {
    @StateObject var viewModel: FilmListViewModel
    @Environment(\.managedObjectContext) var context
        
    @FetchRequest(entity: FilmEntity.entity(), sortDescriptors: [])
    var dbProductArray: FetchedResults<FilmEntity>
    var fetchRequest: NSFetchRequest<FilmEntity> = FilmEntity.fetchRequest()
    
    var body: some View {
        NavigationStack {
            VStack {

                if dbProductArray.isEmpty {
                    ProgressView().onAppear {
                        Task {
                            await viewModel.getFilmList(urlStr: Endpoint.filmUrl, context: context)
                        }
                    }
                } else {
                    List {
                        ForEach(dbProductArray){ filmDb in
                            NavigationLink {
                                FilmListDetailView(dbFilm: filmDb)
                            }label: {
                                VStack{
                                    FilmListCellView(dbFilm: filmDb)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: FilmListViewModel(repository: FilmRepoImplementation(networkManager: NetworkManager())))
    }
}
