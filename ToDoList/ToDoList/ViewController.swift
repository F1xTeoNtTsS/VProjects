//
//  ViewController.swift
//  ToDoList
//
//  Created by F1xTeoNtTsS on 19.06.2021.
//

import UIKit

class ViewController: UIViewController {

    let genderLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello! Please, choose the gender"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 18)
        
      return label
    }()
    
    let maleButton: GenderButtons = {
       let button = GenderButtons(title: "Male")
        button.addTarget(self, action: #selector(openTheMaleClothesView), for: .touchUpInside)
        return button
    }()
    
    let femaleButton: GenderButtons = {
        let button = GenderButtons(title: "Female")
        button.addTarget(self, action: #selector(openTheFemaleClothesView), for: .touchUpInside)
         return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
//        navSetup()
        setupConstraints()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
       
    }
    
    
    
    func setupConstraints() {
        let stack = UIStackView(arrangedSubviews: [genderLabel,femaleButton,maleButton])
        stack.axis = .vertical
        stack.spacing = 15
        stack.distribution = .fillEqually
        
        view.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.widthAnchor.constraint(equalToConstant: 250).isActive = true
        stack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -400).isActive = true
    }
 
   @objc func openTheMaleClothesView(){
        let nextVC = MaleClothesView()
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc func openTheFemaleClothesView() {
        let nextVC = FemaleClothesView()
        navigationController?.pushViewController(nextVC, animated: true)
    }
//
//    func navSetup(){
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
//                                                                 target: self,
//                                                                 action: #selector(addTapped))
//    }
//    @objc func addTapped(){
//
//    }
}



