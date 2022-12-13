//
//  Factory.swift
//  FactoryMethod
//
//  Created by F1xTeoNtTsS on 11.12.2021.
//

import Foundation

enum Transports {
    case boat, car, plane
}

class TransportFactory {
    func getTransport(type: Transports) -> Transport{
        switch type {
        case .boat:
            return Boat()
        case .car:
            return Car()
        case .plane:
            return Plane()
        }
    }
}
