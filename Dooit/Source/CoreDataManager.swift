//
//  CoreDataManager.swift
//  Dooit
//
//  Created by Dinmukhammed Begaly on 12.11.2024.
//

import UIKit
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    private init() {}

    //MARK: - Saving inputting data to storage
    func saveData(currentTitleList: String) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        guard let context = appDelegate?.persistentContainer.viewContext else {return}
        guard let nameObject = NSEntityDescription.entity(forEntityName: "TaskList", in: context) else {return}

        let list = TaskList(entity: nameObject, insertInto: context)
        list.title = currentTitleList

        do {
            try context.save()
            print("Data has been saved")
        }   catch {
            print("Error has been occured during saving: \(error)")
        }

    }
    //MARK: - Updating data in storage
    func updateData(NewTitleList: String, desc: [String]?, currentList: TaskList?) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        guard let context = appDelegate?.persistentContainer.viewContext else {return}
        currentList?.desc = desc
        currentList?.title = NewTitleList

        do {
            try context.save()
            print("Data has been updated")
        } catch {
            print("Error has been occured during updating: \(error)")
        }
    }
    //MARK: - Getting inputting data from storage
    func fetchData() -> [TaskList] {
        var currentData = [TaskList]()
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        guard let context = appDelegate?.persistentContainer.viewContext else {fatalError()}

        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "TaskList")

        do {
            currentData = try context.fetch(fetchRequest) as? [TaskList] ?? [TaskList]()
        } catch {
            print("Error during fetchoing data from storage: \(error)")
        }
        return currentData
    }

}
