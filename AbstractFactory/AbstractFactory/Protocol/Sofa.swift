//
//  File.swift
//  AbstractFactory
//
//  Created by F1xTeoNtTsS on 11.12.2021.
//

import UIKit

protocol Sofa: Furniture {
    var name: String {get}
    var type: String {get}
    var image: UIImage {get}
}

