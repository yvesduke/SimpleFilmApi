//
//  FilmListCellView.swift
//  FilmPracticalTask
//
//  Created by Yves Dukuze on 20/05/2023.
//

import SwiftUI

struct FilmListCellView: View {
    
//    let film: Result?
    let dbFilm: FilmEntity
    
    
    var body: some View {
        HStack {
            if let url = URL(string: Endpoint.imgPlaceholder1){
                AsyncImageView(url: url)
                    .frame(width: 150, height: 150)
                    .mask(RoundedRectangle(cornerRadius: 16))
            }
            VStack(alignment: .leading) {
                Text(dbFilm.title ?? "")
                Text(dbFilm.director ?? "")
            }
        }
    }
}

struct FilmListCellView_Previews: PreviewProvider {
    static var previews: some View {
        FilmListCellView(dbFilm: Result.Mockedb()[0])
    }
}
