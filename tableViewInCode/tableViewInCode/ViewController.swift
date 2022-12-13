//
//  ViewController.swift
//  tableViewInCode
//
//  Created by F1xTeoNtTsS on 11.06.2021.
//

import UIKit

struct Deals {
    var task:String
}

class ViewController: UIViewController {
    

    
        let tableView: UITableView  = {
        let table = UITableView()
        table.register(cellDetailTV.self, forCellReuseIdentifier: cellDetailTV.indetifier )
        
        return table
    } ()
    
    var deals:[Deals] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Наши делишки"
        view.addSubview(tableView)

        tableView.delegate = self
        tableView.dataSource = self
//        let tableOfTasks = deals[Deals].task
//        self.deals = UserDefaults.standard.stringArray(forKey: "newDeal") ?? []
        
        navigationSetup()

      
    }
    
    private func saveTask(withTitle title:String) {
        
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }

    func navigationSetup() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self,
                                                            action: #selector(didTapAdd))
    }
    
    
    @objc private func didTapAdd() {
            let alert = UIAlertController(title: "New Item", message: "You can add a new item", preferredStyle: .alert)
            alert.addTextField(configurationHandler: {field in
                field.placeholder = "Enter new item..."
            })
                alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            alert.addAction(UIAlertAction(title: "Done", style: .default, handler: {[weak self] (_) in
                    if let field = alert.textFields?.first {
                        if let text = field.text, !text.isEmpty {

                            var currentItems = UserDefaults.standard.stringArray(forKey: "newDeal") ?? []
                            currentItems.append(text)
                            UserDefaults.standard.setValue(currentItems, forKey: "newDeal")
                            DispatchQueue.main.async {
                                self?.saveTask(withTitle: text)
                            self?.tableView.reloadData()
                            }
                        }
                    }
                                                }))
            present(alert, animated: true)
    
        }

}



extension ViewController: UITableViewDelegate,UITableViewDataSource {
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return deals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
    -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellDetailTV.indetifier,
                                                 for: indexPath)
        let task = deals[indexPath.row]
        cell.textLabel?.text = task.task
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let newViewController = DetailVC()
        let task = deals[indexPath.row]
        newViewController.titleText = task.task
        navigationController?.present(UINavigationController(rootViewController: newViewController), animated: true, completion: nil)
        
    }
    
    
    
    // delete func
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            var currentItems = self.deals
            currentItems.remove(at: indexPath.row)
            deals.remove(at: indexPath.row)
            UserDefaults.standard.setValue(currentItems, forKey: "newDeal")
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            tableView.endUpdates()
        }
        
    }
   
}

