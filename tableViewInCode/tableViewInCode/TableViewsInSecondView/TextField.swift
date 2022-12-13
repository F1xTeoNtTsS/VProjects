//
//  TextField.swift
//  tableViewInCode
//
//  Created by F1xTeoNtTsS on 16.06.2021.
//

import UIKit

class NotesTableView: UITableViewCell {

    
    static let indetifier = "notesTableView"
    
    let textField: UITextField = {
        let tf = UITextField()
        tf.font = UIFont.systemFont(ofSize: 20)
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Notes"
        
        return tf
    }()
    
    func initConstraints(){
            
            
            NSLayoutConstraint.activate([
                textField.heightAnchor.constraint(equalToConstant: 40),
                textField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
                textField.topAnchor.constraint(equalTo: topAnchor, constant: 8),
                textField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            ])
            
        }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(textField)
        initConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
      
        
    }
    
}



