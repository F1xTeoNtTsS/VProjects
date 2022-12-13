//
//  AbstractFactory.swift
//  AbstractFactory
//
//  Created by F1xTeoNtTsS on 11.12.2021.
//

import Foundation


//protocol AbstractFactory{
//    func createChair() -> Chair
//    func createTable() -> Table
//    func createSofa() -> Sofa
//}

protocol AbstractFactory{
    func createChair() -> Сhair
    func createTable() -> Table
    func createSofa() -> Sofa
}
