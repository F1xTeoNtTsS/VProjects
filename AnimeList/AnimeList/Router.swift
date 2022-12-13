//
//  Router.swift
//  AnimeList
//
//  Created by F1xTeoNtTsS on 31.01.2022.
//

import Foundation
import UIKit


protocol MainRouter {
    var navigationController: UINavigationController? { get set }
    var assemblyBuilder: AssemblyBuilderProtocol? { get set }
}

protocol RouterProtocol: MainRouter {
    func showInitialVC()
    func showInfoVC(currentAnime: Data?)
    func popToRoot()
}

class Router: RouterProtocol {
    
    var navigationController: UINavigationController?
    var assemblyBuilder: AssemblyBuilderProtocol?
    
    init(navigationController: UINavigationController,
         assemblyBuilder: AssemblyBuilderProtocol) {
        self.navigationController = navigationController
        self.assemblyBuilder = assemblyBuilder
    }
    
    func showInitialVC() {
        if let navigationController = navigationController {
            guard let initialVC = assemblyBuilder?.createMainVC(router: self) else { return }
            navigationController.viewControllers = [initialVC]
        }
    }
    
    func showInfoVC(currentAnime: Data?) {
        if let navigationController = navigationController {
            guard let infoVC = assemblyBuilder?.createInfoVC(currentAnime: currentAnime,
                                                             router: self) else { return }
            navigationController.pushViewController(infoVC, animated: true)
        }
    }
    
    func popToRoot() {
        if let navigationController = navigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }
}
