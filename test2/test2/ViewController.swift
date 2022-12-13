//
//  ViewController.swift
//  test2
//
//  Created by F1xTeoNtTsS on 10.01.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let button: UIButton = {
        let button  = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        button.setImage(UIImage(systemName: "trash"), for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(tap))
        
    }
    @objc func tap() {
        
    }

}

