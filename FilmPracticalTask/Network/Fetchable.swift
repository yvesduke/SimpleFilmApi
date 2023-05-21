//
//  Fetchable.swift
//  FilmPracticalTask
//
//  Created by Yves Dukuze on 20/05/2023.
//

import Foundation

protocol Fetchable {
    func get(url: URL) async throws -> Data
}
