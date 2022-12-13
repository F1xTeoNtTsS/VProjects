//
//  ViewController.swift
//  NetworkingTest
//
//  Created by F1xTeoNtTsS on 25.10.2021.
//

import UIKit

enum Actions: String, CaseIterable {
    case downloadImage = "Press to download image"
    case get = "Get"
    case post = "Post"
    case ourCourses = "Our Courses"
    case uploadImage = "Upload Image"
    case downloadFile = "Download File"
}

private let url = "https://jsonplaceholder.typicode.com/posts"
private let uploadImageUrl = "https://api.imgur.com/3/image"
class ViewController: UIViewController {
    
    let collectionView = UICollectionView(
        frame:.zero,
        collectionViewLayout: UICollectionViewFlowLayout()
    )
    let actions = Actions.allCases


    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        view.backgroundColor = .white
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "CollectionCell")
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
   
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return actions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CustomCollectionViewCell
        cell.getLabel.text = actions[indexPath.row].rawValue
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let action = actions[indexPath.row]
        
        switch action {
        case .downloadImage :
            let imageVC = ImageViewController()
            navigationController?.pushViewController(imageVC, animated: true)
        case .get :
            NetworkManager.getRequestPressed(url: url)
        case .post :
            NetworkManager.postRequestPressed(url: url)
        case .ourCourses:
            let courseVC = CoursesViewController()
            navigationController?.pushViewController(courseVC, animated: true)
        case .uploadImage:
            NetworkManager.uploadImage(url: uploadImageUrl)
        case .downloadFile:
            print("download file taped")
        }
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width*0.9,
                      height: view.frame.size.width*0.3)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 40
    }
}
