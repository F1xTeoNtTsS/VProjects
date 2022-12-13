//
//  ViewController.swift
//  FactoryMethod
//
//  Created by F1xTeoNtTsS on 11.12.2021.
//

import UIKit

class ViewController: UIViewController {

    let transportFactory = TransportFactory()
    var myTransport: Transport?
    let myBudget = 1000000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getTransport(.plane)
    }

    
    func getTransport(_ type: Transports){
        myTransport = transportFactory.getTransport(type: type)
        guard let myTransport = myTransport else { return }
        if myBudget - myTransport.price >= 0 {
            print("Я могу купить \(myTransport.name)")
        } else {
            print("Мне не хватает денег на \(myTransport.name)")
        }
    }
}

