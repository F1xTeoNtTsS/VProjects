//
//  TableViewController.swift
//  tableViewInCode
//
//  Created by F1xTeoNtTsS on 16.06.2021.
//

import UIKit

class TitleTableView: UITableViewCell {
    
    
    static let indetifier = "titleTableView"
    var textField = UITextField()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(textField)
        setTextField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTextField() {
        textField.backgroundColor = .systemBackground
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 2
        textField.layer.cornerRadius = 8
    }
}
