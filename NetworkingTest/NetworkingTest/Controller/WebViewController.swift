//
//  WebViewController.swift
//  NetworkingTest
//
//  Created by F1xTeoNtTsS on 25.10.2021.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    var selectedCourse:String?
    var selectedURL = ""
    private let webView = WKWebView(frame: UIScreen.main.bounds)
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = selectedCourse
        view.addSubview(webView)
        fetchWebLik()
    }
    
    func fetchWebLik(){
        guard let url = URL(string: selectedURL) else { return }
        let request = URLRequest(url: url)
        webView.load(request)
        webView.allowsBackForwardNavigationGestures = true

    }
}
