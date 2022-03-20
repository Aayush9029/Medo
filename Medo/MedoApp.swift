//
//  MedoApp.swift
//  Medo
//
//  Created by Aayush Pokharel on 2022-03-19.
//

import SwiftUI

@main
struct MedoApp: App {
    let persistenceController = PersistenceController.shared
    @AppStorage(AppStorageStrings.app_open_count) var app_open_count = 0

    @StateObject private var statusBarController = StatusBarController()
    @StateObject var taskViewModel = TaskViewModel()

    var body: some Scene {
        WindowGroup {
            //            Thanks SwiftUI
            ZStack {
                EmptyView()
            }
            .hidden()
            .onAppear {
                setupPopupMenu()
                app_open_count += 1
            }
            .onOpenURL { url in
                print(url)
            }
        }
        .commands {
            CommandMenu("Actions") {
                VStack {
                    Button("Add Task, priority low") {
                        taskViewModel.priority = Priority.low.rawValue
                        taskViewModel.writeData(context:  persistenceController.container.viewContext)
                    }
                    .keyboardShortcut("3", modifiers: .command)

                    Button("Add Task, priority medium") {
                        taskViewModel.priority = Priority.medium.rawValue
                        taskViewModel.writeData(context:  persistenceController.container.viewContext)
                    }
                    .keyboardShortcut("2", modifiers: .command)

                    Button("Add Task, priority high") {
                        taskViewModel.priority = Priority.high.rawValue
                        taskViewModel.writeData(context:  persistenceController.container.viewContext)
                    }
                    .keyboardShortcut("1", modifiers: .command)

                }
            }
        }
        Settings {
            PrefrencesView()
                .frame(width: 400, height: 400)
        }
    }
}

// MARK: - Setting up PopUp Menu

extension MedoApp {
    private func setupPopupMenu() {
        let contentView = ContentView()
            .environment(\.managedObjectContext, persistenceController.container.viewContext)
            .environmentObject(taskViewModel)
        let popover = NSPopover()
        popover.contentViewController = MainHostingVC(rootView: contentView)
        popover.contentSize = NSSize(width: 360, height: 480)
        statusBarController.start(with: popover)
    }
}
