//
//  SecondViewController.swift
//  protocol
//
//  Created by F1xTeoNtTsS on 12.12.2021.
//

import UIKit

protocol SecondViewDelegate {
    var name: String {get set}
    func changeButton(text: String, color: UIColor)
}

class SecondViewController: UIViewController {

    var delegate: SecondViewDelegate?
    
    let button: UIButton = {
        let button = UIButton()
        button.setTitle("назад", for: .normal)
        button.backgroundColor = .orange
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .blue
        self.view.addSubview(button)
        button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
    
    
    @objc func buttonTapped(){
        self.dismiss(animated: true, completion: nil)
        delegate?.changeButton(text: "хуй", color: .yellow)
        delegate?.name = "Frog"
    }


}
