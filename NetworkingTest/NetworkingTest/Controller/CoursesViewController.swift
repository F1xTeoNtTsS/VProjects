//
//  CorsesViewController.swift
//  NetworkingTest
//
//  Created by F1xTeoNtTsS on 25.10.2021.
//

import UIKit

class CoursesViewController: UIViewController {
    private var courses = [CourseModel]()
    private let url = "https://swiftbook.ru//wp-content/uploads/api/api_courses"
    let tableView: UITableView = {
        let tbv = UITableView(frame: UIScreen.main.bounds)
        tbv.rowHeight = 100
        tbv.register(CustomTableViewCell.self, forCellReuseIdentifier: "Cell")
        return tbv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        fetchData()
    }
    
    func fetchData(){
        NetworkManager.fetchData(url: url) { courses in
            self.courses = courses
        }
    }
    
    private func congigureCell(cell: CustomTableViewCell, for indexPath: IndexPath) {
        let course = courses[indexPath.row]
        cell.nameOfCourse.text = course.name
        cell.numberOfLessons.text = "Number of lessons: \(course.numderOfLessons)"
        cell.numberOfTests.text = "Number of tests: \(course.numberOfTests)"
        DispatchQueue.global().async {
            guard let url = URL(string: course.imageUrl) else { return }
            guard let data = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                cell.dowlodedImage.image = UIImage(data: data)
            }
        }
    }
}

extension CoursesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        congigureCell(cell: cell, for: indexPath)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let webVC = WebViewController()
        webVC.selectedCourse = courses[indexPath.row].name
        webVC.selectedURL = courses[indexPath.row].link
        navigationController?.pushViewController(webVC, animated: true)
    }
}
