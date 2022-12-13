//
//  InfoViewController.swift
//  AnimeList
//
//  Created by F1xTeoNtTsS on 31.01.2022.
//

import UIKit

class InfoViewController: UIViewController {

    var infoViewModel: InfoViewModelProtocol?
    
    override func loadView() {
        self.view = InfoView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        updateData()
        infoViewModel?.setAnime()
    }
    
    func view() -> InfoView {
        guard let view = self.view as? InfoView else { return InfoView() }
        return view
    }
    
    
    private func updateData() {
        self.infoViewModel?.updateIfoViewData = { [weak self] data in
            self?.view().infoViewData = data
        }
    }
}
