//
//  FilmListDetailView.swift
//  FilmPracticalTask
//
//  Created by Yves Dukuze on 20/05/2023.
//

import SwiftUI

struct FilmListDetailView: View {
    
    let film: Result
    
    var body: some View {
        
        
        VStack{
            ScrollView{
                Text(film.title .uppercased()).font(.title).foregroundColor(.blue)
                Divider()
//                AsyncImageView(url: "", userAvatar: Endpoint.imgPlaceholder2, imageWidth: 450.0, cellHeight: 490.0)
                AsyncImageView(url: URL(string: Endpoint.imgPlaceholder3)!)
                Divider()
                Group{
                    
                    HStack{
                        Text("Link: ").foregroundColor(.black).bold()
                        Text("\(film.url)").foregroundColor(.blue)
                    }
                    HStack{
                        Text("Released: ").foregroundColor(.black).bold()
                        Text(film.releaseDate).foregroundColor(.blue)
                    }
                    HStack{
                        Text("Director: ").foregroundColor(.black).bold()
                        Text(film.director).foregroundColor(.blue)
                    }
                    HStack{
                        Text("Producer: ").foregroundColor(.black).bold()
                        Text(film.producer).foregroundColor(.blue)
                    }
                }
            }
        }
        
        
    }
}

struct FilmListDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FilmListDetailView(film: Result.MockedFilm()[0])
    }
}
