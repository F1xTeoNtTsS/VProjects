//
//  ViewController.swift
//  tttttt
//
//  Created by F1xTeoNtTsS on 09.12.2021.
//

import UIKit

class ViewController: UIViewController {

    let nextVCButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 300, height: 150))
        button.setTitle("Next VC", for: .normal)
        button.tintColor = .blue
        button.addTarget(self,
                         action: #selector(showNextVC),
                         for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(nextVCButton)
        nextVCButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        nextVCButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
    
    @objc func showNextVC() {
        let nextVC = NextViewController()
        navigationController?.pushViewController(nextVC, animated: true)
    }
}

