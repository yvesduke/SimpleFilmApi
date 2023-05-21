//
//  ContentView.swift
//  FilmPracticalTask
//
//  Created by Yves Dukuze on 16/05/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: FilmListViewModel
    @State var isError: Bool = false

    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.customError != nil {
                    ProgressView().alert(isPresented: $isError){
                        Alert(title: Text("Oops Something Went Wrong"), message: Text(viewModel.customError?.localizedDescription ?? ""),dismissButton: .default(Text("Okay")))
                    }
                } else {
                    if viewModel.filmLists.count > 0 {
                        List(viewModel.filmLists, id: \.id) { film in
                            NavigationLink {
//                                EmptyView()
                                FilmListDetailView(film: film)
                            } label: {
                                FilmListCellView(film: film)
                            }
                        }
                    } else {
                        EmptyView()
                    }
                }
            }.toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        print("Refresh tapped!")
                        Task{
                            await getDataFromAPI()
                        }
                        DispatchQueue.main.async {
                            if(viewModel.customError != nil){
                                isError = true
                            }
                        }
                    } label: {
                        Image(systemName: "arrow.clockwise")
                    }
                    
                }
            } .navigationTitle(Text("Film List"))
        }.task {
            await getDataFromAPI()
        }
        .refreshable {
            await getDataFromAPI()
        }
    }
    func getDataFromAPI() async{
        await viewModel.getFilmList(urlStr: Endpoint.filmUrl)
        if(viewModel.customError != nil){
            isError = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: FilmListViewModel(repository: FilmRepoImplementation(networkManager: NetworkManager())))
    }
}
