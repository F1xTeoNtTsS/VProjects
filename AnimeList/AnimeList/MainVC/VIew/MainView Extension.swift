//
//  MainTableView.swift
//  AnimeList
//
//  Created by F1xTeoNtTsS on 31.01.2022.
//

import UIKit

extension MainView {
    func createTableView() -> UITableView {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tableView)
        setTableViewConstraints(tableView: tableView)
        return tableView
    }
    
    func createActivityIndicator() -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.style = .medium
        activityIndicator.color = .gray
        activityIndicator.hidesWhenStopped = true
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(activityIndicator)
        setActivityIndicatorConstraints(activityIndicator: activityIndicator)
        return activityIndicator
    }

    fileprivate func setTableViewConstraints(tableView: UITableView) {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    fileprivate func setActivityIndicatorConstraints(activityIndicator: UIActivityIndicatorView) {
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}
//
//extension MainView: UITableViewDelegate, UITableViewDataSource {
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return anime?.count ?? 0
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId,
//                                                       for: indexPath) as? MainTableViewCell else {
//            return UITableViewCell()
//        }
//        if let currentAnime = anime?[indexPath.row] {
//            cell.animeInfo = currentAnime
//        }
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        
//    }
//}
