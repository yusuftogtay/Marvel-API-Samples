//
//  ComicsModel.swift
//  Marvel
//
//  Created by Ahmet Yusuf TOĞTAY on 13.07.2021.
//
//   let comicsResponse = try? newJSONDecoder().decode(ComicsResponse.self, from: jsonData)

import Foundation

// MARK: - ComicsResponse
struct ComicsResponse: Codable {
    let code: Int?
    let status, copyright, attributionText, attributionHTML: String?
    let etag: String?
    let data: DataComics?
}

struct DataComics: Codable {
    let offset, limit, total, count: Int?
    let results: [ComicsDetail]?
}

// MARK: - Result
struct ComicsDetail: Codable {
    var id: String?
    var title: String?
    var issueNumber: String?
    var resultDescription: String?
    var modified: String?


    enum CodingKeys: String, CodingKey {
        case id
        case title, issueNumber
        case resultDescription = "description"
        case modified
    }
}

// MARK: - Characters
struct Characters: Codable {
    let available: Int?
    let collectionURI: String?
    let items: [Series]?
    let returned: Int?
}

// MARK: - Series
struct Series: Codable {
    let resourceURI: String?
    let name: String?
}

// MARK: - Creators
struct Creators: Codable {
    let available: Int?
    let collectionURI: String?
    let items: [CreatorsItem]?
    let returned: Int?
}

// MARK: - CreatorsItem
struct CreatorsItem: Codable {
    let resourceURI: String?
    let name, role: String?
}

// MARK: - DateElement
struct DateElement: Codable {
    let type: DateType?
    let date: String?
}

enum DateType: String, Codable {
    case digitalPurchaseDate = "digitalPurchaseDate"
    case focDate = "focDate"
    case onsaleDate = "onsaleDate"
    case unlimitedDate = "unlimitedDate"
}

enum Format: String, Codable {
    case comic = "Comic"
}

// MARK: - Price
struct Price: Codable {
    let type: PriceType?
    let price: Double?
}

enum PriceType: String, Codable {
    case digitalPurchasePrice = "digitalPurchasePrice"
    case printPrice = "printPrice"
}

// MARK: - TextObject
struct TextObject: Codable {
    let type, language, text: String?
}
