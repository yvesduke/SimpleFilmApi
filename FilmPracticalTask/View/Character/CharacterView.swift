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
//    @Environment(\.managedObjectContext) var context
//
//    @FetchRequest(entity: CharacterEntity.entity(), sortDescriptors: [])
//    var dbCharactersArray: FetchedResults<CharacterEntity>
//    var fetchRequest: NSFetchRequest<CharacterEntity> = CharacterEntity.fetchRequest()
    
    var body: some View {
        NavigationStack {
            VStack {
                Text(dbCharactersArray[1].name ?? "Name 1")
                Text(dbCharactersArray[2].name ?? "Name 2")
                Text(dbCharactersArray[3].name ?? "Name 3")
                Text(dbCharactersArray[4].name ?? "Name 4")
                List {
                    ForEach(dbCharactersArray){ charDb in
                        NavigationLink {
                            EmptyView()
                        }label: {
                            VStack{
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
//        CharacterView(
//    }
//}
