//
//  InfoView.swift
//  AnimeList
//
//  Created by F1xTeoNtTsS on 31.01.2022.
//

import UIKit

class InfoView: UIView {

    var infoViewData: InfoViewData = .initial {
        didSet{
            setNeedsLayout()
        }
    }

    let posterImage: UIImageView = {
        let poster = UIImageView()
        poster.contentMode = .scaleAspectFit
        return poster
    }()
    
    let title: UILabel = {
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        switch infoViewData {
        case .initial:
            setConstraints()
            print("initializing")
        case .loading:
            print("loading")
        case .success(let data):
            setConstraints()
            updateView(data: data)
        case .failure(let error):
            print(error)
        }
    }
    
    func updateView(data: InfoViewData.Data) {
        self.title.text = data.title
        self.descriptionLabel.text = data.description
        transformToImage(url: data.posterImage)
    }
    
    private func setConstraints() {
        let stack = createStack()
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            stack.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
    
    private func createStack() -> UIStackView {
       let mainStack = UIStackView(arrangedSubviews: [title, descriptionLabel, posterImage])
        mainStack.axis = .vertical
        mainStack.spacing = 10
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(mainStack)
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
