//
//  AssemblyBuilder.swift
//  AnimeList
//
//  Created by F1xTeoNtTsS on 31.01.2022.
//

import UIKit


protocol AssemblyBuilderProtocol {
    func createMainVC(router: RouterProtocol) -> UIViewController
    func createInfoVC(currentAnime: Data?, router: RouterProtocol) -> UIViewController
}

class AssemblyBuilder: AssemblyBuilderProtocol {
    func createMainVC(router: RouterProtocol) -> UIViewController {
        let view = MainViewController()
        let networkManager = NetworkManager()
        let viewModel = MainViewModel(networkManager: networkManager, router: router)
        view.viewModel = viewModel
        return view
    }
    
    func createInfoVC(currentAnime: Data?, router: RouterProtocol) -> UIViewController {
        let view = InfoViewController()
        let viewModel = InfoViewModel(currentAnime: currentAnime)
        view.infoViewModel = viewModel
        return view
    }
}
