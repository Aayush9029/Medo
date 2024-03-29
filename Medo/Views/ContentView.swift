//
//  ContentView.swift
//  Medo
//
//  Created by Aayush Pokharel on 2022-03-19.
//

import CoreData
import SwiftUI

struct ContentView: View {
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Task.priority, ascending: true)],
        animation: .default
    )
    var items: FetchedResults<Task>

    @EnvironmentObject var taskViewModel: TaskViewModel

    var body: some View {
        ZStack(alignment: .bottom) {
            EmptyTaskView(isEmpty: items.isEmpty)

            TasksListView()
                .environmentObject(taskViewModel)

            BottomBarView()
                .environmentObject(taskViewModel)
        }
        .alert(isPresented: $taskViewModel.confrimDelete) {
            Alert(
                title: Text("Remove all tasks?"),
                message: Text("This will permanently remove all tasks."),
                primaryButton: .cancel(),
                secondaryButton: .destructive(Text("Remove all"), action: deleteAll)
            )
        }
    }
}

extension ContentView {
    private func deleteAll() {
        withAnimation {
            items.forEach { item in
                taskViewModel.delete(item: item)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
