//
//  cellDetailTV.swift
//  tableViewInCode
//
//  Created by F1xTeoNtTsS on 15.06.2021.
//

import UIKit

class cellDetailTV: UITableViewCell {
    
    
    static let indetifier = "cellDetailTV"
    
   let button = UIButton()
    
 
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(button)
    
        buttonConfiguration()
        buttonConstraint()
        
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func didTapButton () {
        if button.backgroundColor == .systemBackground {
            button.backgroundColor = .green
        } else {
        button.backgroundColor = .systemBackground
    }
    }
    
    func buttonConfiguration() {
        button.backgroundColor = .systemBackground
        button.frame = CGRect(x: 200, y: 100, width: 30, height: 30)
        button.layer.cornerRadius = 0.5 * button.frame.width
        button.layer.masksToBounds = true
    
    
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.cornerCurve = .continuous
        
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
    }
    func buttonConstraint() {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        button.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        button.widthAnchor.constraint(equalToConstant: 30).isActive = true
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
    }
        
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
