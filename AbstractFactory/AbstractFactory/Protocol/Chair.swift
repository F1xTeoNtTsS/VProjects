//
//  File.swift
//  AbstractFactory
//
//  Created by F1xTeoNtTsS on 11.12.2021.
//

import UIKit


protocol Furniture {
    var name: String {get}
    var type: String {get}
    var image: UIImage {get}
}

protocol Сhair: Furniture {
    var name: String {get}
    var type: String {get}
    var image: UIImage {get}
}
