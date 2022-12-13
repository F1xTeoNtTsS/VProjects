//
//  ViewData.swift
//  AnimeList
//
//  Created by F1xTeoNtTsS on 31.01.2022.
//

import Foundation

enum ViewData {
    case initial
    case loading
    case success([Data])
    case failure(Error)
}
