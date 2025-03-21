//
//  Document.swift
//  BookFinderWithCodable
//
//  Created by Chiwook Ahn on 3/21/25.
//

struct Meta: Codable {
    let is_end: Bool
}

struct Document: Codable {
    let authors: [String]
    let title: String
    let publisher: String
    let thumbnail: String
    let url: String
    let price: Int
}

struct BookRoot: Codable {
    let meta: Meta
    let documents: [Document]
}
