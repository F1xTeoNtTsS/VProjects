//
//  TypeOfClothesView.swift
//  ToDoList
//
//  Created by F1xTeoNtTsS on 08.07.2021.
//

import UIKit

class FemaleClothesView: UIViewController {

    let underwearButton: TypeOfClothes = {
        let button = TypeOfClothes(title: "Underwear")
        button.addTarget(self, action: #selector(openUnderwearVC), for: .touchUpInside)
        return button
    }()
    
    let clothesButton: TypeOfClothes = {
        let button = TypeOfClothes(title: "Clothes")
        button.addTarget(self, action: #selector(openClothesVC), for: .touchUpInside)
        return button
    }()
    
    let shoesButton: TypeOfClothes = {
        let button = TypeOfClothes(title: "Shoes")
        button.addTarget(self, action: #selector(openShoesVC), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupConstraints()
    }
    
    
    func setupConstraints() {
        let stack = UIStackView(arrangedSubviews: [underwearButton,clothesButton,shoesButton])
        stack.axis = .vertical
        stack.spacing = 15
        stack.distribution = .fillEqually
        
        view.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.widthAnchor.constraint(equalToConstant: 250).isActive = true
        stack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -400).isActive = true
    }
    
      @objc func openUnderwearVC() {
        let nextVC = FemaleUnderwear()
        navigationController?.pushViewController(nextVC, animated: true)
      }

    @objc func openClothesVC() {
      let nextVC = FemaleClothes()
      navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc func openShoesVC() {
      let nextVC = FemaleShoes()
      navigationController?.pushViewController(nextVC, animated: true)
    }

}
