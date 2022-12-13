//
//  CourseModel.swift
//  NetworkingTest
//
//  Created by F1xTeoNtTsS on 25.10.2021.
//

import Foundation


struct CourseModel: Decodable {
    let id: Int
    let name: String
    let link: String
    let imageUrl: String
    let numderOfLessons: Int
    let numberOfTests: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case link
        case imageUrl
        case numderOfLessons = "number_of_lessons"
        case numberOfTests = "number_of_tests"
    }
}
