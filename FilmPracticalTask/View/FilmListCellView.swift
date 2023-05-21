//
//  FilmListCellView.swift
//  FilmPracticalTask
//
//  Created by Yves Dukuze on 20/05/2023.
//

import SwiftUI

struct FilmListCellView: View {
    let film: Result
    
    var body: some View {
        HStack {
            if let url = URL(string: Endpoint.imgPlaceholder1){
                AsyncImageView(url: url)
                    .frame(width: 150, height: 150)
                    .mask(RoundedRectangle(cornerRadius: 16))
            }
            VStack{
                Text("Tittle: \(film.title)")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.headline)
                Text("Director: \(film.director)")
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

struct FilmListCellView_Previews: PreviewProvider {
    static var previews: some View {
        FilmListCellView(film: Result.MockedFilm()[0])
    }
}