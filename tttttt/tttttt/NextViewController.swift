//
//  NextViewController.swift
//  tttttt
//
//  Created by F1xTeoNtTsS on 03.02.2022.
//

import UIKit

class NextViewController: UIViewController {
    
    let imageSample: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.widthAnchor.constraint(equalToConstant: 300).isActive = true
        image.heightAnchor.constraint(equalToConstant: 300).isActive = true
        image.backgroundColor = .red
        return image
    }()
    
    let updateButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 300, height: 150))
        button.setTitle("Update", for: .normal)
        button.tintColor = .blue
        button.addTarget(self,
                         action: #selector(updateButtonPressed),
                         for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageSample)
        view.addSubview(updateButton)
        imageSample.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        imageSample.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        updateButton.topAnchor.constraint(equalTo: imageSample.bottomAnchor).isActive = true
        updateButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        loadImage()
    }
    
    func loadImage() {
        guard let url = URL(string: "https://cs4.pikabu.ru/post_img/big/2014/08/13/10/1407943852_1960284910.jpg") else { return }
        let service = LoadingService()
        let proxy = Proxy(service: service)
        proxy.loadImage(url: url) { [weak self] (data, response, error) in
            if let error = error {
                print(error)
            }
            if let self = self, let data = data {
                DispatchQueue.main.async {
                    self.imageSample.image = UIImage(data: data)
                }
            }
        }
    }
    
    @objc func updateButtonPressed() {
        cache = nil
        imageSample.image = nil
        loadImage()
    }
}
