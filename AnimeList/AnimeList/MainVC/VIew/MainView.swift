//
//  MainView.swift
//  AnimeList
//
//  Created by F1xTeoNtTsS on 31.01.2022.
//

import UIKit

class MainView: UIView {
    var viewData: ViewData = .initial {
        didSet {
            setNeedsLayout()
        }
    }
    var anime: [Data]?
    let cellId = "CellId"

    lazy var tableView = createTableView()
    lazy var activityIndicator = createActivityIndicator()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        switch viewData {
        case .initial:
            print("initializing")
        case .loading:
            updateView(animeData: nil, isHidden: true)
            setActivityIndicator(start: true)
        case .success(let data):
            updateView(animeData: data, isHidden: false)
            setActivityIndicator(start: false)
        case .failure(let error):
            print(error)
        }
    }
    

    func updateView(animeData: [Data]?, isHidden: Bool) {
        self.anime = animeData
        tableView.isHidden = isHidden
        tableView.reloadData()
    }
    
    func setActivityIndicator(start: Bool) {
        if start {
            self.activityIndicator.startAnimating()
            activityIndicator.isHidden = false
        } else {
            self.activityIndicator.stopAnimating()
            activityIndicator.isHidden = true
        }
    }
    
}
