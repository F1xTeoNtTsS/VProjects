//
//  CustomTableViewCell.swift
//  NetworkingTest
//
//  Created by F1xTeoNtTsS on 25.10.2021.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    let cellView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let nameOfCourse: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.text = "Name of course"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let numberOfLessons: UILabel = {
       let label = UILabel()
        label.text = "Number of lessons"
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let numberOfTests: UILabel = {
       let label = UILabel()
        label.numberOfLines = 0
        label.text = "Label"
        label.font = .systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dowlodedImage: UIImageView = {
       let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(cellView)
        configCell(contentView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configCell(_ view: UIView){
        let labelsStack = UIStackView(arrangedSubviews: [nameOfCourse, numberOfLessons, numberOfTests])
        labelsStack.axis = .vertical
        labelsStack.distribution = .fillProportionally
        labelsStack.spacing = 5
        labelsStack.translatesAutoresizingMaskIntoConstraints = false
        
        let cellStack = UIStackView(arrangedSubviews: [dowlodedImage, labelsStack])
        cellStack.axis = .horizontal
        cellStack.spacing = 10
        cellStack.translatesAutoresizingMaskIntoConstraints = false
        cellView.addSubview(cellStack)
        
        NSLayoutConstraint.activate([
            dowlodedImage.widthAnchor.constraint(equalToConstant: 80),
            dowlodedImage.heightAnchor.constraint(equalToConstant: 80),
            cellStack.trailingAnchor.constraint(equalTo: cellView.trailingAnchor),
            cellStack.leadingAnchor.constraint(equalTo: cellView.leadingAnchor),
            
            cellView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            cellView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 10),
            cellView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            cellView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
        ])
    }
    
    
}
