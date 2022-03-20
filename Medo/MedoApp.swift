//
//  MedoApp.swift
//  Medo
//
//  Created by Aayush Pokharel on 2022-03-19.
//

import SwiftUI

@main
struct MedoApp: App {
    @StateObject private var statusBarController = StatusBarController()
    @StateObject var taskViewModel = TaskViewModel()

    @AppStorage(AppStorageStrings.app_open_count) var app_open_count = 0
        
    let urlParser = URLParser()
    
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
                guard url.isDeeplink else { return }
                
                if let parsed = URLParser.parse(url.absoluteString)?.first {
                    switch parsed.key {
                    case .addTask:
                        if let task = parsed.value {
                            taskViewModel.title = task.title
                            taskViewModel.priority = task.priority
                            taskViewModel.writeData()
                        }
                    case .deleteTop:
                        if let topTask = taskViewModel.tasks.first {
                            taskViewModel.delete(item: topTask)
                        }
                    case .deleteAll:
                        taskViewModel.tasks.forEach { task in
                            taskViewModel.delete(item: task)
                        }
                    case .showTop:
                        if let topTask = taskViewModel.tasks.first {
                            print(topTask)
                        }
                    case .showAll:
                        print(taskViewModel.tasks)
                    }
                }
            }
        }
        .commands {
            CommandMenu("Actions") {
                VStack {
                    Button("Add Task, priority low") {
                        taskViewModel.priority = Priority.low.rawValue
                        taskViewModel.writeData()
                    }
                    .keyboardShortcut("3", modifiers: .command)

                    Button("Add Task, priority medium") {
                        taskViewModel.priority = Priority.medium.rawValue
                        taskViewModel.writeData()
                    }
                    .keyboardShortcut("2", modifiers: .command)

                    Button("Add Task, priority high") {
                        taskViewModel.priority = Priority.high.rawValue
                        taskViewModel.writeData()
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
            .environment(\.managedObjectContext, taskViewModel.persistenceController.container.viewContext)
            .environmentObject(taskViewModel)
        let popover = NSPopover()
        popover.contentViewController = MainHostingVC(rootView: contentView)
        popover.contentSize = NSSize(width: 360, height: 480)
        statusBarController.start(with: popover)
    }
}
