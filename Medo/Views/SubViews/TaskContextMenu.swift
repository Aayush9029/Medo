//
//  TaskContextMenu.swift
//  Medo
//
//  Created by Aayush Pokharel on 2022-03-19.
//

import SwiftUI

struct TaskContextMenu: View {
    @EnvironmentObject var taskViewModel: TaskViewModel
    @Environment(\.managedObjectContext) private var viewContext

    let task: Task

    var body: some View {
        VStack {
            Button {
                taskViewModel.selectItem(item: task)
            } label: {
                Label("Edit Task", systemImage: "pencil")
            }
            Button {
                taskViewModel.delete(item: task, context: viewContext)
            } label: {
                Label("Delete Task", systemImage: "trash")
            }
            Divider()
            Menu("Priority") {
                Button("Low") {
                    taskViewModel.updatePriority(item: task, context: viewContext, priority: .low)
                }
                Button("Medium") {
                    taskViewModel.updatePriority(item: task, context: viewContext, priority: .medium)
                }
                Button("High") {
                    taskViewModel.updatePriority(item: task, context: viewContext, priority: .high)
                }
            }
        }
    }
}
