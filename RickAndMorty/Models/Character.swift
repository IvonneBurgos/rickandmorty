//
//  Character.swift
//  RickAndMorty
//
//  Created by Ivonne Burgos on 20/7/24.
//

import Foundation


struct CharacterList: Codable {
    let info: Info
    let results: [Character]
}

struct Info : Codable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}

struct Character :  Codable, Identifiable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: Origin
    let location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

struct Origin: Codable {
    let name: String
    let url: String
}

struct Location: Codable {
    let name: String
    let url: String
}


