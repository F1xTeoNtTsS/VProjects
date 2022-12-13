//
//  InfoViewData.swift
//  AnimeList
//
//  Created by F1xTeoNtTsS on 31.01.2022.
//

import Foundation

enum InfoViewData {
    case initial
    case loading
    case success(Data)
    case failure(Error)
    
    struct Data {
        let title: String
        let description: String
        let posterImage: String
    }
}
