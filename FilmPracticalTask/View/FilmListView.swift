//
//  ContentView.swift
//  FilmPracticalTask
//
//  Created by Yves Dukuze on 16/05/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: FilmListViewModel
    @State var isError: Bool
    @Environment(\.managedObjectContext) var context
    
    var body: some View {
        NavigationStack {
            VStack {
                
                
                if viewModel.filmsDb.isEmpty {
                    ProgressView().onAppear {
                        Task {
                            await getDataFromAPI()
                        }
                    }
                    List(viewModel.filmLists, id: \.id) { film in
                        NavigationLink{
                            FilmListDetailView(film: film, dbFilm: nil)
                        }label: {
                            VStack{
                                FilmListCellView(film: film, dbFilm: nil)
                            }
                        }
                    }.padding()
                } else if viewModel.customError != nil {
                    ProgressView().alert(isPresented: $isError){
                        Alert(title: Text(viewModel.customError?.localizedDescription ?? "Error Occured"),message: Text("Something went wrong"),
                              dismissButton: .default(Text("Ok")))
                    }
                } else {
                    List(viewModel.filmsDb) { filmDb in
                            NavigationLink{
                                FilmListDetailView(film: nil, dbFilm: filmDb)
                            }label: {
                                VStack{
                                    FilmListCellView(film: nil, dbFilm: filmDb)
                                }
                        }
                    }.padding()
                }
                
            }.task {
                await viewModel.getDataFromDb(context: context)
                if viewModel.dbError != nil{
                    isError = true
                }
            }
        }
    }
    func getDataFromAPI() async {
        await viewModel.getFilmList(urlStr: Endpoint.filmUrl, context: context)
        if(viewModel.customError != nil){
            isError = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: FilmListViewModel(repository: FilmRepoImplementation(networkManager: NetworkManager())), isError: false)
    }
}
