//
//  CharacterView.swift
//  FilmPracticalTask
//
//  Created by Yves Dukuze on 24/05/2023.
//

import SwiftUI
import CoreData

struct CharacterView: View {
    
    @StateObject var viewModel: CharacterListViewModel
    @Environment(\.managedObjectContext) var context
        
    @FetchRequest(entity: CharacterEntity.entity(), sortDescriptors: [])
    var dbProductArray: FetchedResults<CharacterEntity>
    var fetchRequest: NSFetchRequest<CharacterEntity> = CharacterEntity.fetchRequest()
    
    var body: some View {
        NavigationStack {
            VStack {
                if dbProductArray.isEmpty {
                    ProgressView().onAppear {
                        Task {
                            await viewModel.getCharacterList(urlStr: Endpoint.characterurl, context: context)
                        }
                    }
                } else {
                    List {
                        ForEach(dbProductArray){ filmDb in
                            NavigationLink {
//                                FilmListDetailView(dbFilm: filmDb)
                            }label: {
                                VStack{
//                                    FilmListCellView(dbFilm: filmDb)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

struct CharacterView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterView()
    }
}
