//
//  ViewController.swift
//  AbstractFactory
//
//  Created by F1xTeoNtTsS on 11.12.2021.
//

import UIKit

class ViewController: UIViewController {


    let bedroomButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Заказать мебель для спальни", for: .normal)
        button.layer.cornerRadius = 16
        button.backgroundColor = UIColor(white: 0.9, alpha: 1)
        button.addTarget(self, action: #selector(bedroomOrder), for: .touchUpInside)
        return button
    }()
    let kitchenButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Заказать мебель для кухни", for: .normal)
        button.layer.cornerRadius = 16
        button.backgroundColor = UIColor(white: 0.9, alpha: 1)
        button.addTarget(self, action: #selector(kitchenOrder), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraints()
    }
    
    @objc func bedroomOrder(){
        let listVC = FurnitureList()
        listVC.list.append(BedroomFactory().createTable())
        listVC.list.append(BedroomFactory().createChair())
        listVC.list.append(BedroomFactory().createSofa())
        navigationController?.pushViewController(listVC, animated: true)
    
    }
    
    @objc func kitchenOrder(){
        let listVC = FurnitureList()
        listVC.list.append(KitchenFactory().createTable())
        listVC.list.append(KitchenFactory().createChair())
        listVC.list.append(KitchenFactory().createSofa())
        navigationController?.pushViewController(listVC, animated: true)
        
    }

    fileprivate func setConstraints(){
        let stack = UIStackView(arrangedSubviews: [bedroomButton,kitchenButton])
        stack.spacing = 16
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(stack)
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stack.widthAnchor.constraint(equalToConstant: 300),
            stack.heightAnchor.constraint(equalToConstant: 100)
        ])
    }

}

