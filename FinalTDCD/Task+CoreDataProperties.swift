//
//  Task+CoreDataProperties.swift
//  FinalTDCD
//
//  Created by F1xTeoNtTsS on 12.07.2021.
//
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var name: String?

}

extension Task : Identifiable {

}
