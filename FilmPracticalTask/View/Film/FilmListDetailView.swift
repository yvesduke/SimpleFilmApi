//
//  FilmListDetailView.swift
//  FilmPracticalTask
//
//  Created by Yves Dukuze on 20/05/2023.
//

import SwiftUI
import CoreData

struct FilmListDetailView: View {
    
    let dbFilm: FilmEntity
    
    @Environment(\.managedObjectContext) var context

    @FetchRequest(entity: CharacterEntity.entity(), sortDescriptors: [])
    var dbCharactersArray: FetchedResults<CharacterEntity>
    var fetchRequest: NSFetchRequest<CharacterEntity> = CharacterEntity.fetchRequest()
    
    var body: some View {

        VStack{
            ScrollView{
                Text(dbFilm.title ?? "").foregroundColor(.blue).bold()
                Divider()
                AsyncImageView(url: URL(string: Endpoint.imgPlaceholder3)!)
                Divider()
                Group{
                    Text("Opening crawl").foregroundColor(.blue).bold()
                    Text(dbFilm.openingCrawl ?? "")
                    Text("Director").foregroundColor(.blue).bold()
                    Text(dbFilm.director ?? "")
                    Text("Producer").foregroundColor(.blue).bold()
                }
                Group{
                    Text(dbFilm.producer ?? "")
                    Text("Released").foregroundColor(.blue).bold()
                    Text(dbFilm.releaseDate ?? "")
                }
            }
            CharacterView(dbCharactersArray: dbCharactersArray)
        }
    }
}

struct FilmListDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FilmListDetailView(dbFilm: Result.Mockedb()[0])
    }
}
