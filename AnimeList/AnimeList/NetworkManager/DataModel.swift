//
//  DataModel.swift
//  AnimeList
//
//  Created by F1xTeoNtTsS on 31.01.2022.
//

import Foundation

struct DataModel: Decodable {
    let data: [Data]
}

struct Data: Decodable {
    let attributes: Attributes
}

struct Attributes: Decodable {
    let description: String?
    let titles: Titles
    let posterImage: PosterImage
}


struct Titles: Decodable {
    let en: String?
    let en_jp: String?
}

struct PosterImage: Decodable {
    let medium: String?
    let original: String?
}
