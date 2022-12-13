//
//  ViewController.swift
//  TestBanner
//
//  Created by F1xTeoNtTsS on 21.03.2022.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func addition(_ sender: Any) {
        //Инициализируем лейбл
        self.label.text = "= "
        // Создаем всплывающее окно
        let alertController = UIAlertController(title: "Внимание", message:  "введите число", preferredStyle: .alert)
        // Создаем возможность делать действия внутри всплывающего окна
        let action = UIAlertAction(title: "OK", style: .default) { action in
            // Создаем переменную, в которую добавляем текстовое поле
            let textOne = alertController.textFields?.first
            let textTwo = alertController.textFields?.last
            let textSum = String(Int(textOne?.text ?? "0")! + Int(textTwo?.text ?? "0")!)
            self.label.text! += String(textSum)
        }
        // Соединяем всплывающее окно с возможностью взаимодействия
        alertController.addAction(action)
        // Добавляем вrвсплывающее окно текстовоое поле
        alertController.addTextField(configurationHandler: nil)
        alertController.addTextField(configurationHandler: nil)
        // Разрешаем нашей кнопке запускать всплывающее окно
        self.present(alertController, animated: true, completion: nil)
    }
    
}

