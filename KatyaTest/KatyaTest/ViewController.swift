//
//  ViewController.swift
//  KatyaTest
//
//  Created by F1xTeoNtTsS on 04.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private let cellId = "CellId"
    
    let tableView = UITableView()
    var animeList: [Data] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        fetchData()
    }

    override func viewDidLayoutSubviews() {
        tableView.frame = self.view.bounds
    }
    
    private func configView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
    func fetchData() {
        let url = "https://kitsu.io/api/edge/trending/anime"
        guard let url = URL(string: url) else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print(error)
                return
            }
            if let data = data {
                do {
                    let decodedData = try JSONDecoder().decode(DataModel.self, from: data)
                    DispatchQueue.main.async {
                        self.animeList = decodedData.data
                        self.tableView.reloadData()
                    }
                } catch let error {
                    print(error)
                }
            }
        }.resume()
    }
    
//    fileprivate func transformToImage(url: String){
//        guard let url = URL(string: url) else { return}
//        URLSession.shared.dataTask(with: url) { data, _, error in
//            if let error = error {
//                print(error)
//                return
//            }
//            if let data = data {
//               let image = UIImage(data: data)
//                DispatchQueue.main.async {
//                    self.posterImage.image = image
//                }
//            }
//        }.resume()
//    }
}



extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        let currentAnime = animeList[indexPath.row]
        cell.textLabel?.text = currentAnime.attributes.titles.en ?? currentAnime.attributes.titles.en_jp
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        let currentAnime = animeList[indexPath.row]
        detailVC.currentAnime = currentAnime
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
