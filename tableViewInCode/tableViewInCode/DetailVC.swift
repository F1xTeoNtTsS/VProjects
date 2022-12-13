//
//  DetailVC.swift
//  tableViewInCode
//
//  Created by F1xTeoNtTsS on 11.06.2021.
//

import UIKit

protocol AddEditedDealDelegate {
    
    func addEditeddeal(deal: String)
}

class DetailVC: UIViewController {

    var delegate: AddEditedDealDelegate?
    
    var titleText = ""
    private  let tableView: UITableView  = {
        let table = UITableView()
        table.register(NotesTableView.self, forCellReuseIdentifier: NotesTableView.indetifier )
//        table.register(TitleTableView.self, forCellReuseIdentifier: TitleTableView.indetifier )
        return table
    } ()
    private let notesTV = NotesTableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.tableFooterView = UIView()
        tableView.delegate = self
        tableView.dataSource = self
        
        tabBar()

      
    }
    

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        tableView.backgroundColor = .systemBackground
    }

    
    func tabBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backTapped))
        navigationItem.title = "Подробнее"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneTapped))
        
    }
    
    @objc private func doneTapped() {
        
        guard let titleText = notesTV.textField.text, notesTV.textField.hasText else {
            print("handle error")
            return
        }
        let deal = titleText
        print(deal)
        delegate?.addEditeddeal(deal: deal )
    }
    
    
    
    @objc private func backTapped() {
        navigationController?.popViewController(animated: true)
    }
    
}

extension DetailVC: UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: NotesTableView.indetifier,
                                                     for: indexPath) as! NotesTableView
            cell.textField.text = titleText
            return cell

    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
     
    }
    
 
    
}

