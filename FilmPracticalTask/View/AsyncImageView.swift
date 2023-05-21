//
//  AsyncImageView.swift
//  FilmPracticalTask
//
//  Created by Yves Dukuze on 21/05/2023.
//

import SwiftUI

struct AsyncImageView: View {
    let url: URL
    private let imageWidth = 150.0
    private let cellHeight = 150.0
    
    var body: some View {
        CacheAsyncImage(
            url: url) { phase in
                switch phase {
                case .success(let image):
                    VStack {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: imageWidth)
                            .padding(.trailing, 10)
                        Spacer()
                    }
                case .failure(let error):
                    ErrorView(error: error)
                case .empty:
                    HStack(alignment: .center) {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .red))
                        Spacer()
                    }
                @unknown default:
                    Image(systemName: "questionmark")
                }
            }
    }
}
