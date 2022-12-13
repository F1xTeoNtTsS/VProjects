//
//  InfoViewModel.swift
//  AnimeList
//
//  Created by F1xTeoNtTsS on 31.01.2022.
//

import Foundation

protocol InfoViewModelProtocol {
    var updateIfoViewData: ((InfoViewData)->Void)? { get set }
    func setAnime()
}

class InfoViewModel: InfoViewModelProtocol {
    var updateIfoViewData: ((InfoViewData) -> Void)?
    var currentAnime: Data?

    init(currentAnime: Data?) {
        self.currentAnime = currentAnime
        updateIfoViewData?(.initial)
    }
    
    func setAnime() {
        guard let currentAnime = currentAnime else {
            let error = NSError(domain: "Can't find anime", code: 0, userInfo: nil)
            updateIfoViewData?(.failure(error))
            return
        }
        
        let titleText = currentAnime.attributes.titles.en != nil ?
        currentAnime.attributes.titles.en : currentAnime.attributes.titles.en_jp
        guard let posterImageUrl = currentAnime.attributes.posterImage.medium else {return}
        guard let description = currentAnime.attributes.description else {return}
        updateIfoViewData?(.success(InfoViewData.Data(title: titleText ?? "", description: description, posterImage: posterImageUrl)))
    }
    
}
