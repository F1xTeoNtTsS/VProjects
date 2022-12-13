//
//  SecondViewController.swift
//  thirdVikasApp
//
//  Created by F1xTeoNtTsS on 22.05.2021.
//

import UIKit

class SecondViewController: UIViewController {

    var login: String?
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        if ((login?.isEmpty) != nil)  {
            
            label.text = "Hello, Pidor"
            
            
        } else {
            label.text = "Hello, \(login)"
        }
        
    }
    
    @IBAction func goBackTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "unwindSegue", sender: nil)
    }
    
}
