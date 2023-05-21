//
//  NetworkError.swift
//  FilmPracticalTask
//
//  Created by Yves Dukuze on 20/05/2023.
//

import Foundation

import Foundation

enum NetworkError:Error {
    case invalidURL
    case parsingError
    case dataNotFound
}
extension NetworkError:LocalizedError {
    var errorDescription: String? {
        switch self{
        case .invalidURL:
            return NSLocalizedString("Invalid URL", comment: "invalidURL")
        case .parsingError:
            return NSLocalizedString("Encountered Parsing Error", comment: "parsingError")
        case .dataNotFound:
            return NSLocalizedString("Failed to get data from API", comment: "dataNotFound")
        }
    }
}
