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

    @AppStorage(AppStorageStrings.usage_add) var usage_add = 0
    @AppStorage(AppStorageStrings.usage_delete) var usage_delete = 0
    @AppStorage(AppStorageStrings.usage_edit) var usage_edit = 0

    //    Functions called to write data to create new task item or update existing one.
    func writeData(context: NSManagedObjectContext) {
        if updateItem != nil {
            usage_edit += 1

            //            Updating old data
            updateItem.title = title
            updateItem.priority = priority
            updateItem.timestamp = timestamp
        } else {
            usage_add += 1

            //            Creating new item
            let newTask = Task(context: context)
            newTask.title = title
            newTask.priority = priority
            newTask.done = done
            newTask.id = id
            newTask.timestamp = timestamp
        }

        //        Saving the data
        do {
            try context.save()
            resetValues()

        } catch {
            print("Could not add / update the task:", error.localizedDescription)
        }
    }

    func updatePriority(item: Task, context: NSManagedObjectContext, priority: Priority) {
        item.priority = priority.rawValue
        do {
            try context.save()

        } catch {
            print("Could not update the  priority:", error.localizedDescription)
        }
    }

    func editData(item: Task) {
        print("editing \(item.title ?? "Untitled")")
        updateItem = item
        title = updateItem.title ?? "Untitled"
        priority = updateItem.priority ?? Priority.low.rawValue
        id = updateItem.id ?? UUID()
    }

    func delete(item: Task, context: NSManagedObjectContext) {
        usage_delete += 1
        context.delete(item)

        do {
            try context.save()
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
