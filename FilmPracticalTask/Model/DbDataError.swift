//
//  DataError.swift
//  FilmPracticalTask
//
//  Created by Yves Dukuze on 21/05/2023.
//

import Foundation

enum DbDataError:Error{
    case savingError
    case gettingError
}

extension DbDataError: LocalizedError{
    
    var errorDescription: String?{
        switch self{
        case .savingError:
            return NSLocalizedString("Got Error while saving into DB", comment: " saving to the DB Error")
        case .gettingError:
            return NSLocalizedString("Got Error while getting data from DB", comment: "Get from DB Error")
        }
    }
}
