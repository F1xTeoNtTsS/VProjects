//
//  KitchenFactory.swift
//  AbstractFactory
//
//  Created by F1xTeoNtTsS on 11.12.2021.
//

import Foundation


class KitchenFactory: AbstractFactory {
    func createChair() -> Сhair {
        let chair = ChairKitchen()
        return chair
    }
    
    func createTable() -> Table {
        let table = TableKitchen()
        return table
    }
    
    func createSofa() -> Sofa {
        let sofa = SofaKitchen()
        return sofa
    }
}
