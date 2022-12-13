//
//  ViewController.swift
//  AnimeList
//
//  Created by F1xTeoNtTsS on 31.01.2022.
//

import UIKit

class MainViewController: UIViewController {

    var viewModel: MainViewModelProtocol?
    
    override func loadView() {
        self.view = MainView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        configTableView()
        updateData()
        viewModel?.startFetching()
    }
    
    private func view() -> MainView {
        guard let view = self.view as? MainView else { return MainView() }
        return view
    }
    
    func configTableView() {
        view().tableView.delegate = self
        view().tableView.dataSource = self
        view().tableView.register(MainTableViewCell.self, forCellReuseIdentifier: view().cellId)
    }
    
    private func updateData() {
        self.viewModel?.updateViewData = { [weak self] data in
            guard let self = self else { return }
            self.view().viewData = data
        }
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return view().anime?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: view().cellId,
                                                       for: indexPath) as? MainTableViewCell else {
            return UITableViewCell()
        }
        if let currentAnime = view().anime?[indexPath.row] {
            cell.animeInfo = currentAnime
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let currentAnime = view().anime?[indexPath.row] else { return }
        self.viewModel?.tapOnAnime(currentAnime: currentAnime)
    }
}
