//
//  TaskList+CoreDataProperties.swift
//  Dooit
//
//  Created by Dinmukhammed Begaly on 12.11.2024.
//
//

import Foundation
import CoreData


extension TaskList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TaskList> {
        return NSFetchRequest<TaskList>(entityName: "TaskList")
    }

    @NSManaged public var title: String?
    @NSManaged public var desc: [String]?

}

extension TaskList : Identifiable {

}
