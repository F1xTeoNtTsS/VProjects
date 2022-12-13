//
//  Table.swift
//  AbstractFactory
//
//  Created by F1xTeoNtTsS on 11.12.2021.
//

import UIKit

protocol Table: Furniture {
    var name: String {get}
    var type: String {get}
    var image: UIImage {get}
}

