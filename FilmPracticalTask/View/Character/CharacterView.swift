//
//  CharacterView.swift
//  FilmPracticalTask
//
//  Created by Yves Dukuze on 24/05/2023.
//

import SwiftUI
import CoreData

struct CharacterView: View {
    
    let dbCharactersArray: FetchedResults<CharacterEntity>
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    Section(header: Text("Characters").foregroundColor(.blue).bold()){
                        ForEach(dbCharactersArray){ charDb in
                            NavigationLink {
                                EmptyView()
                            }label: {
                                Text(charDb.name ?? "name")
                            }
                        }
                    }
                }
            }
        }
    }
}

//struct CharacterView_Previews: PreviewProvider {
//    static var previews: some View {
//        CharacterView(dbCharactersArray: FetchedResults<CharacterEntity>)
//    }
//}
