//
//  ViewModel.swift
//  AnimeList
//
//  Created by F1xTeoNtTsS on 31.01.2022.
//

import Foundation

protocol MainViewModelProtocol {
    var updateViewData: ((ViewData) -> Void)? { get set }
    init(networkManager: NetworkManagerProtocol,
         router: RouterProtocol)
    func startFetching()
    func tapOnAnime(currentAnime: Data?)
}

class MainViewModel: MainViewModelProtocol {
    
    var updateViewData: ((ViewData) -> Void)?
    var networkManager: NetworkManagerProtocol?
    var router: RouterProtocol?
    
    required init(networkManager: NetworkManagerProtocol, router: RouterProtocol) {
        self.networkManager = networkManager
        self.router = router
        updateViewData?(.initial)
    }

    func startFetching() {
        updateViewData?(.loading)
        networkManager?.fetchData(completion: { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let anime):
                let data = anime.data
                DispatchQueue.main.async {
                    self.updateViewData?(.success(data))
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.updateViewData?(.failure(error))
                }
            }
        })
    }
    
    func tapOnAnime(currentAnime: Data?) {
        router?.showInfoVC(currentAnime: currentAnime)
    }
}
