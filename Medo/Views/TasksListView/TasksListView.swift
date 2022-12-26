//
//  TasksListView.swift
//  Medo
//
//  Created by Aayush Pokharel on 2022-03-19.
//

import SwiftUI

struct TasksListView: View {
    var bottomPadding: CGFloat = 45
    var showEditTask: Bool = true

    @EnvironmentObject var taskViewModel: TaskViewModel

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Task.priority, ascending: true)],
        animation: .default
    )

    var tasks: FetchedResults<Task>

    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    VStack {
                        ForEach(tasks) { task in
                            SingleTaskView(
                                title: task.title ?? "Untitled",
                                priority: Priority(rawValue: task.priority ?? "3") ?? Priority.low,
                                timestamp: task.timestamp ?? Date()
                            )
                            .contextMenu {
                                TaskContextMenu(showEditTask: showEditTask, task: task)
                            }
                        }
                    }
                }
                .padding()
                .padding(.bottom, bottomPadding)
            }
        }
    }
}
