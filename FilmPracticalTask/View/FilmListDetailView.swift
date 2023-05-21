//
//  FilmListDetailView.swift
//  FilmPracticalTask
//
//  Created by Yves Dukuze on 20/05/2023.
//

import SwiftUI

struct FilmListDetailView: View {
    
    let film: Result?
    let dbFilm: FilmEntity?
    
    var body: some View {

        VStack{
            ScrollView{
//                Text(film.title .uppercased()).font(.title).foregroundColor(.blue)
                dbFilm?.title != nil ? Text(dbFilm?.title ?? "") : Text(film?.title ?? "")
                Divider()
                AsyncImageView(url: URL(string: Endpoint.imgPlaceholder3)!)
                Divider()
                Group{
                    
                    HStack{
                        Text("Link: ").foregroundColor(.black).bold()
//                        Text("\(film.url)").foregroundColor(.blue)
                        dbFilm?.url != nil ? Text(dbFilm?.url ?? "") : Text(film?.url ?? "")
                    }
                    HStack{
                        Text("Released: ").foregroundColor(.black).bold()
//                        Text(film.releaseDate).foregroundColor(.blue)
                        dbFilm?.releaseDate != nil ? Text(dbFilm?.releaseDate ?? "") : Text(film?.releaseDate ?? "")
                    }
                    HStack{
                        Text("Director: ").foregroundColor(.black).bold()
//                        Text(film.director).foregroundColor(.blue)
                        dbFilm?.director != nil ? Text(dbFilm?.director ?? "") : Text(film?.director ?? "")
                    }
                    HStack{
                        Text("Producer: ").foregroundColor(.black).bold()
//                        Text(film.producer).foregroundColor(.blue)
                        dbFilm?.producer != nil ? Text(dbFilm?.producer ?? "") : Text(film?.producer ?? "")
                    }
                }
            }
        }
        
    }
}

struct FilmListDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FilmListDetailView(film: Result.MockedFilm()[0], dbFilm: nil)
    }
}
