//
//  TaskViewModel.swift
//  Medo
//
//  Created by Aayush Pokharel on 2022-03-19.
//

import CoreData
import Foundation
import SwiftUI

class TaskViewModel: ObservableObject {
    let persistenceController = PersistenceController.shared

    //    Default Inititaion
    @Published var id = UUID()
    @Published var title = ""
    @Published var priority = Priority.low.rawValue
    @Published var done = false
    @Published var timestamp = Date()

    //     This is just for the add data UI, not saved in core data.
    @Published var confrimDelete: Bool = false

    //    Storing the updated item
    @Published var updateItem: Task!

//    For Fun Stats

    @AppStorage(AppStorageStrings.addUsage) var addUsage = 0
    @AppStorage(AppStorageStrings.deleteUsage) var deleteUsage = 0
    @AppStorage(AppStorageStrings.editUsage) var editUsage = 0

    //    Functions called to write data to create new task item or update existing one.
    func writeData() {
        if title.isEmpty {
            return
        }
        if updateItem != nil {
            editUsage += 1

            //            Updating old data
            updateItem.title = title
            updateItem.priority = priority
            updateItem.timestamp = timestamp
        } else {
            addUsage += 1

            //            Creating new item
            let newTask = Task(context: persistenceController.container.viewContext)
            newTask.title = title
            newTask.priority = priority
            newTask.done = done
            newTask.id = id
            newTask.timestamp = timestamp
        }

        //        Saving the data
        do {
            try persistenceController.container.viewContext.save()
            resetValues()

        } catch {
            print("Could not add / update the task:", error.localizedDescription)
        }
    }

    func updatePriority(item: Task, priority: Priority) {
        item.priority = priority.rawValue
        do {
            try persistenceController.container.viewContext.save()

        } catch {
            print("Could not update the  priority:", error.localizedDescription)
        }
    }

    func delete(item: Task) {
        deleteUsage += 1
        persistenceController.container.viewContext.delete(item)

        do {
            try persistenceController.container.viewContext.save()
        } catch {
            print("Could not delete the task:", error.localizedDescription)
        }
        id = UUID()
    }

    func selectItem(item: Task) {
        updateItem = item
        title = item.title ?? "Untitled"
        priority = item.priority ?? Priority.low.rawValue
        id = item.id ?? UUID()
    }

    func resetValues() {
        //            clearing the values so next time view appears it's a clean slate
        title = ""
        priority = Priority.low.rawValue
        id = UUID()
        timestamp = Date()
        updateItem = nil
    }
}
