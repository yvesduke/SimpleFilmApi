//
//  Film.swift
//  FilmPracticalTask
//
//  Created by Yves Dukuze on 20/05/2023.
//
//   let film = try? JSONDecoder().decode(Film.self, from: jsonData)

import Foundation

// MARK: - Film
struct Film: Codable {
    let count: Int
    let results: [Result]
}

// MARK: - Result
struct Result: Codable {
    
    
    static func == (lhs: Result, rhs: Result) -> Bool {
        return lhs.id == rhs.id && lhs.title == rhs.title && lhs.episodeID == rhs.episodeID && lhs.openingCrawl == rhs.openingCrawl && lhs.director == rhs.director && lhs.producer == rhs.producer && lhs.releaseDate == rhs.releaseDate && lhs.characters == rhs.characters && lhs.planets == rhs.planets && lhs.starships == rhs.starships && lhs.vehicles == rhs.vehicles && lhs.species == rhs.species && lhs.created == rhs.created && lhs.edited == rhs.edited && lhs.url == rhs.url
    }
    
    
    let id = UUID()
    let title: String
    let episodeID: Int
    let openingCrawl, director, producer, releaseDate: String
    let characters, planets, starships, vehicles: [String]
    let species: [String]
    let created, edited: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case title,id
        case episodeID = "episode_id"
        case openingCrawl = "opening_crawl"
        case director, producer
        case releaseDate = "release_date"
        case characters, planets, starships, vehicles, species, created, edited, url
    }
}

extension Result {
    static func MockedFilm() -> [Result] {
        return[
            Result(title: "", episodeID: 1, openingCrawl: "", director: "", producer: "", releaseDate: "", characters: [], planets: [], starships: [], vehicles: [], species: [], created: "", edited: "", url: ""),
            Result(title: "", episodeID: 1, openingCrawl: "", director: "", producer: "", releaseDate: "", characters: [], planets: [], starships: [], vehicles: [], species: [], created: "", edited: "", url: ""),
            Result(title: "", episodeID: 1, openingCrawl: "", director: "", producer: "", releaseDate: "", characters: [], planets: [], starships: [], vehicles: [], species: [], created: "", edited: "", url: "")
        ]
    }
}

