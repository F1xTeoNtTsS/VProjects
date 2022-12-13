//
//  CustomCollectionViewCell.swift
//  NetworkingTest
//
//  Created by F1xTeoNtTsS on 26.10.2021.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    let getLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .center
        label.backgroundColor = .lightGray
        label.font = .systemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(getLabel)
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        getLabel.frame = contentView.bounds
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }    
}
