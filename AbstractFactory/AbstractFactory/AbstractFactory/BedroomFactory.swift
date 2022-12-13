//
//  BedroomFactory.swift
//  AbstractFactory
//
//  Created by F1xTeoNtTsS on 11.12.2021.
//

import Foundation


class BedroomFactory: AbstractFactory {
    func createChair() -> Сhair {
        let chair = ChairBedroom()
        return chair
    }
    
    func createTable() -> Table {
        let table = TableBedroom()
        return table
    }
    
    func createSofa() -> Sofa {
        let sofa = SofaBedroom()
        return sofa
    }
}
