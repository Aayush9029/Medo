//
//  TasksListView.swift
//  Medo
//
//  Created by Aayush Pokharel on 2022-03-19.
//

import SwiftUI

struct TasksListView: View {
    @EnvironmentObject var taskViewModel: TaskViewModel
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Task.priority, ascending: false)],
        animation: .default
    )
    var tasks: FetchedResults<Task>

    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    VStack {
                        ForEach(tasks) { task in
                            SingleTaskView(title: task.title ?? "Untitled", priority: Priority(rawValue: task.priority ?? "low") ?? Priority.low, timestamp: task.timestamp ?? Date())
                                .contextMenu {
                                    TaskContextMenu(task: task)
                                }
                        }
                    }
                }
                .padding()
                .padding(.bottom, 45)
            }
        }
    }
}
