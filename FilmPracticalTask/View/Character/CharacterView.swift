//
//  CharacterView.swift
//  FilmPracticalTask
//
//  Created by Yves Dukuze on 24/05/2023.
//

import SwiftUI
import CoreData

struct CharacterView: View {
    
    let characters: Character
    @Environment(\.managedObjectContext) var context

    @FetchRequest(entity: CharacterEntity.entity(), sortDescriptors: [])
    var dbCharactersArray: FetchedResults<CharacterEntity>
    var fetchRequest: NSFetchRequest<CharacterEntity> = CharacterEntity.fetchRequest()
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(dbCharactersArray){ charDb in
                        NavigationLink {
                            EmptyView()
                        }label: {
                            VStack{
                                Text(characters.name)
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
