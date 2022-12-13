//
//  DetailViewController.swift
//  KatyaTest
//
//  Created by F1xTeoNtTsS on 04.02.2022.
//

import UIKit

class DetailViewController: UIViewController {

    var currentAnime: Data? {
        didSet {
            self.titleName.text = currentAnime?.attributes.titles.en ?? currentAnime?.attributes.titles.en
            self.descriptionLabel.text = currentAnime?.attributes.description
            guard let posterUrl = currentAnime?.attributes.posterImage.medium else { return }
            transformToImage(url: posterUrl)
        }
    }
    
    let posterImage: UIImageView = {
        let poster = UIImageView()
        poster.contentMode = .scaleAspectFit
        return poster
    }()
    
    let titleName: UILabel = {
        let title = UILabel()
        title.font = .boldSystemFont(ofSize: 25)
        title.textColor = .black
        title.textAlignment = .center
        title.numberOfLines = 0
        return title
    }()
    
    let descriptionLabel: UILabel = {
        let info = UILabel()
        info.font = .systemFont(ofSize: 20)
        info.textColor = .darkGray
        info.textAlignment = .center
        info.numberOfLines = 7
        return info
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setConstraints()
    }
    
    private func setConstraints() {
        let stack = createStack()
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            stack.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
    
    private func createStack() -> UIStackView {
       let mainStack = UIStackView(arrangedSubviews: [titleName, descriptionLabel, posterImage])
        mainStack.axis = .vertical
        mainStack.spacing = 10
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(mainStack)
        return mainStack
    }
    
    func transformToImage(url: String){
        guard let url = URL(string: url) else { return}
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print(error)
                return
            }
            if let data = data {
               let image = UIImage(data: data)
                DispatchQueue.main.async {
                    self.posterImage.image = image
                }
            }
        }.resume()
    }

}
