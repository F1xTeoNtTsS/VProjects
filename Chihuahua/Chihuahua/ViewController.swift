//
//  ViewController.swift
//  Chihuahua
//
//  Created by F1xTeoNtTsS on 12.06.2022.
//

import UIKit

class ViewController: UIViewController {

    var dog: UIView = {
        let v = UIView()
        v.backgroundColor = .brown
        v.layer.cornerRadius = 10
        v.layer.borderWidth = 5
        return v
    }()
    
    var cat: UIView = {
        let v = UIView()
        v.backgroundColor = .orange
        v.layer.cornerRadius = 10
        v.layer.borderWidth = 5
        
        return v
    }()
    
    var mouse: UISwitch = {
        let m = UISwitch()
        return m
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(dog)
        self.view.addSubview(cat)
        self.view.addSubview(mouse)
        dog.translatesAutoresizingMaskIntoConstraints = false
        dog.widthAnchor.constraint(equalToConstant: 100).isActive = true
        dog.heightAnchor.constraint(equalToConstant: 100).isActive = true
        dog.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -55).isActive = true
        dog.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        cat.translatesAutoresizingMaskIntoConstraints = false
        cat.widthAnchor.constraint(equalToConstant: 100).isActive = true
        cat.heightAnchor.constraint(equalToConstant: 100).isActive = true
        cat.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 55).isActive = true
        cat.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        mouse.translatesAutoresizingMaskIntoConstraints = false
        mouse.centerXAnchor.constraint(equalTo: cat.centerXAnchor).isActive = true
        mouse.centerYAnchor.constraint(equalTo: cat.centerYAnchor).isActive = true
        mouse.layoutSubviews()
    }
}

