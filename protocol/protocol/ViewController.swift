//
//  ViewController.swift
//  protocol
//
//  Created by F1xTeoNtTsS on 12.12.2021.
//

import UIKit

class ViewController: UIViewController, SecondViewDelegate {
    
    var name: String = "dog"

    
    lazy var label: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = name
        return l
    }()
    let button: UIButton = {
        let button = UIButton()
        button.setTitle("переход", for: .normal)
        button.backgroundColor = .orange
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        print(name)
        self.view.addSubview(button)
        self.view.addSubview(label)
        button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        label.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive = true
        label.widthAnchor.constraint(equalToConstant: 100).isActive = true
        label.heightAnchor.constraint(equalToConstant: 50).isActive = true
       Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(changeLabel), userInfo: .none, repeats: false)
    }
    
    func changeButton(text: String, color: UIColor) {
        button.setTitle(text, for: .normal)
        button.backgroundColor = color
    }

    @objc func buttonTapped(){
        let secondVC = SecondViewController()
        secondVC.delegate = self
        self.present(secondVC, animated: true, completion: nil)
    }
    
    @objc func changeLabel(){
        label.text = name
    }

}

