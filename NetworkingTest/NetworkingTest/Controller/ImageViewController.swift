//
//  ImageViewController.swift
//  NetworkingTest
//
//  Created by F1xTeoNtTsS on 25.10.2021.
//

import UIKit

class ImageViewController: UIViewController {
    private let url = "https://applelives.com/wp-content/uploads/2016/03/iPhone-SE-11.jpeg"
    let imageView: UIImageView = {
        let image = UIImageView(frame: UIScreen.main.bounds)
        return image
    }()
    
    let indicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.isHidden = true
        indicator.hidesWhenStopped = true
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        [imageView,indicator].forEach{view.addSubview($0)}
        setConstraints()
        fetchImage()
    }
    
    func fetchImage(){
        indicator.isHidden = false
        indicator.startAnimating()
        NetworkManager.downLoadImage(url: url) { image in
            self.indicator.stopAnimating()
            self.imageView.image = image
        }
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            indicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            indicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
    }


}
