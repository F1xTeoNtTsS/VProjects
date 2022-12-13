//
//  MaleClothesView.swift
//  ToDoList
//
//  Created by F1xTeoNtTsS on 08.07.2021.
//

import UIKit

class MaleClothesView: UIViewController {
    
    
    
    let underwearButton: TypeOfClothes = {
        let button = TypeOfClothes(title: "Underwear")
        return button
    }()
    
    let clothesButton: TypeOfClothes = {
        let button = TypeOfClothes(title: "Clothes")
        return button
    }()
    
    let shoesButton: TypeOfClothes = {
        let button = TypeOfClothes(title: "Shoes")
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
