//
//  ViewController.swift
//  FinalTDCD
//
//  Created by F1xTeoNtTsS on 12.07.2021.
//

import UIKit
import CoreData
private let cellIdentifier = "cell"

class ViewController: UIViewController {
    
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        return table
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
        getAllItem()
        navBarSetup()
    }
    
    //    override func viewDidLayoutSubviews() {
    //        super.viewDidLayoutSubviews()
    //        tableView.frame = view.bounds
    //    }
    
    
    func navBarSetup() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self,
                                                            action: #selector(addButtonTapped))
        
    }
    
    
    @objc private func addButtonTapped() {
        let alert = UIAlertController(title: "New Task", message: "create a new Task", preferredStyle: .alert)
        alert.addTextField(configurationHandler: nil)
        alert.addAction(UIAlertAction(title: "Done", style: .cancel, handler: {[weak self] _ in
            guard let field = alert.textFields?.first, let text = field.text, !text.isEmpty else { return }
            self?.createItem(name: text)
        }))
        present(alert, animated: true, completion: nil)
    }
    
    private var models = [Task]()
    
    
    
    
    // MARK: core data
    
    
    func createItem (name: String) {
        let newTask = Task(context: context)
        newTask.name = name
        
        do {
            try context.save()
            getAllItem()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    func getAllItem() {
        do {
            models = try context.fetch(Task.fetchRequest())
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    func deleteItem(name: Task) {
        context.delete(name)
        
        do {
            try context.save()
            getAllItem()
        }
        catch let error as NSError {
            print(error.localizedDescription)
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel?.text = model.name
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        //        let model = models[indexPath.row]
        //        if editingStyle == .delete {
        //        deleteItem(name: model)
        //        } else {
        //            return
        //        }
        
        // вот так вот можно :)
        guard editingStyle == .delete else { return }
        let model = models[indexPath.row]
        deleteItem(name: model)
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
}

