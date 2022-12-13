//
//  MainTableViewCell.swift
//  AnimeList
//
//  Created by F1xTeoNtTsS on 31.01.2022.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    var animeInfo: Data? {
        didSet {
            if let title = animeInfo?.attributes.titles.en {
                self.title.text = title
            } else {
                self.title.text = animeInfo?.attributes.titles.en_jp
            }
            guard let urlImage = animeInfo?.attributes.posterImage.medium else { return }
            self.transforfImage(urlString: urlImage)
        }
    }
    let posterImage: UIImageView = {
        let poster = UIImageView()
        poster.contentMode = .scaleAspectFill
        poster.layer.cornerRadius = 50
        poster.clipsToBounds = true
        poster.backgroundColor = .darkGray
        return poster
    }()
    
    let title: UILabel = {
        let title = UILabel()
        title.font = .boldSystemFont(ofSize: 25)
        title.numberOfLines = 0
        title.textColor = .black
        title.textAlignment = .center
        return title
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        setConstraints()
    }
    
    private func setConstraints() {
        let stack = UIStackView(arrangedSubviews: [posterImage, title])
        stack.alignment = .center
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(stack)
        
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            stack.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            stack.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
            stack.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10),
            posterImage.widthAnchor.constraint(equalToConstant: 100),
            posterImage.heightAnchor.constraint(equalToConstant: 100)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func transforfImage(urlString: String) {
        guard let url = URL(string: urlString) else { return }
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
