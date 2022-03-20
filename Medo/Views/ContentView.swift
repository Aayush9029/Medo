//
//  ContentView.swift
//  Medo
//
//  Created by Aayush Pokharel on 2022-03-19.
//

import CoreData
import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Task.priority, ascending: true)],
        animation: .default
    )
    var items: FetchedResults<Task>
    
    @StateObject var taskViewModel = TaskViewModel()
    
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
                title: Text("Delete all Tasks?"),
                message: Text("Completely delete all tasks."),
                primaryButton: .cancel(),
                secondaryButton: .destructive(Text("Delete all"), action: deleteAll)
            )
        }
    }
}


extension ContentView {
    private func deleteAll() {
        withAnimation {
            items.forEach(viewContext.delete)
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
