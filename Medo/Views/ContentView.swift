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
    private var items: FetchedResults<Task>

    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    VStack {
                        ForEach(items) { item in
                            SingleTaskView(title: item.title ?? "Untitled", priority: Priority.init(rawValue: item.priority ?? "low") ?? Priority.low, timestamp: item.timestamp ?? Date())
                        }
                        .onDelete(perform: deleteItems)
                    }
                }
                .padding()
                .padding(.bottom, 45)
            }
            
            HStack{
                Button(action: addItem) {
                    Label("Add Item", systemImage: "plus")
                        .labelStyle(.iconOnly)
                }
                .font(.body.bold())
                .foregroundColor(.green)
                .buttonStyle(.plain)
                .padding(8)
                .background(.green.opacity(0.1))
                .clipShape(Circle())
                Spacer()
                Button(action: addItem) {
                    Label("Delete All", systemImage: "trash")
                        .labelStyle(.iconOnly)
                }
                .font(.body.bold())
                .foregroundColor(.red)
                .buttonStyle(.plain)
                .padding(8)
                .background(.red.opacity(0.1))
                .clipShape(Circle())
            }
            .padding(6)
            .background(VisualEffectView(material: .hudWindow, blendingMode: .withinWindow))
            .cornerRadius(12)
            .shadow(color: .white.opacity(0.75), radius: 4, x: 0, y: -2)
            .shadow(color: .blue, radius: 18, x: 0, y: -2)
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Task(context: viewContext)
            newItem.title = "Pariatur Lorem excepteur ex anim excepteur anim aliqua incididunt do aliqua dolore ea."
            newItem.id = UUID()
            newItem.timestamp = Date()
            newItem.priority = Priority.low.rawValue

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

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



struct VisualEffectView: NSViewRepresentable {
    let material: NSVisualEffectView.Material
    let blendingMode: NSVisualEffectView.BlendingMode
    
    func makeNSView(context: Context) -> NSVisualEffectView {
        let visualEffectView = NSVisualEffectView()
        visualEffectView.material = material
        visualEffectView.blendingMode = blendingMode
        visualEffectView.state = NSVisualEffectView.State.active
        return visualEffectView
    }
    
    func updateNSView(_ visualEffectView: NSVisualEffectView, context: Context) {
        visualEffectView.material = material
        visualEffectView.blendingMode = blendingMode
    }
}
