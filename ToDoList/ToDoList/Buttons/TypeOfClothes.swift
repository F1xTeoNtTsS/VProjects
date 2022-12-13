//
//  TypeOfFemaleClothes.swift
//  ToDoList
//
//  Created by F1xTeoNtTsS on 08.07.2021.
//

import UIKit

class TypeOfClothes: UIButton {

    override init (frame: CGRect) {
        super.init(frame: frame)
    }
    
    
     init(title:String) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        setTitleColor(.black, for: .normal)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        backgroundColor = .systemBackground
        layer.shadowRadius = 20
        layer.shadowColor = UIColor.systemGray.cgColor
        layer.borderWidth = 2
        layer.borderColor = UIColor.systemGray.cgColor
        layer.cornerRadius = 10
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
