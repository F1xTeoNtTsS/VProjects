//
//  TableViewCell.swift
//  AbstractFactory
//
//  Created by F1xTeoNtTsS on 11.12.2021.
//

import UIKit

class TableViewCell: UITableViewCell {

    let name: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 24)
        return label
    }()
    
    let furnitureImage: UIImageView = {
        let iv = UIImageView()
        iv.layer.cornerRadius = 16
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let orderButton: UIButton = {
        let button = UIButton()
        button.setTitle("Заказать", for: .normal)
        button.layer.cornerRadius = 16
        button.backgroundColor = UIColor(white: 0.9, alpha: 1)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setConstraints()
    }
    
    
    func setConstraints(){
        let stack = UIStackView(arrangedSubviews: [furnitureImage, name, UIView(), orderButton])
        stack.spacing = 10
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stack)
        
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            stack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            stack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            stack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
