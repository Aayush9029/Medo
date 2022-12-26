//
//  MedoApp.swift
//  Medo
//
//  Created by Aayush Pokharel on 2022-03-19.
//

import SwiftUI

@main
struct MedoApp: App {
    @StateObject var taskViewModel = TaskViewModel()
    @AppStorage(AppStorageStrings.openCount) var openCount = 0

    var body: some Scene {
        MenuBarExtra {
            ContentView()
                .frame(maxHeight: 420)
                .environment(\.managedObjectContext, taskViewModel.persistenceController.container.viewContext)
                .environmentObject(taskViewModel)
                .onOpenURL { url in
                    guard url.isDeeplink else {
                        return
                    }
                    if let parsed = URLParser.parse(url.absoluteString)?.first {
                        switch parsed.key {
                        case .addTask:
                            if let task = parsed.value {
                                taskViewModel.title = task.title
                                taskViewModel.priority = task.priority
                                taskViewModel.writeData()
                            }
                        case .floatSmall:
                            showFloatingWindow(height: FloatType.floatSmall.rawValue)
                        case .floatMedium:
                            showFloatingWindow(height: FloatType.floatMedium.rawValue)
                        case .floatLarge:
                            showFloatingWindow(height: FloatType.floatLarge.rawValue)
                        }
                    }
                }
                .onAppear {
                    openCount += 1
                }
        } label: {
            Label("Medo app", systemImage: "note.text.badge.plus")
        }
        .commands {
            CommandMenu("Add Task") {
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
            CommandMenu("Floating Menu") {
                VStack {
                    Button("Large Floating View") {
                        showFloatingWindow(height: FloatType.floatLarge.rawValue)
                    }
                    .keyboardShortcut("l", modifiers: .command)

                    Button("Medium Floating View") {
                        showFloatingWindow(height: FloatType.floatMedium.rawValue)
                    }
                    .keyboardShortcut("f", modifiers: .command)

                    Button("Small Floating View") {
                        showFloatingWindow(height: FloatType.floatSmall.rawValue)
                    }
                    .keyboardShortcut("s", modifiers: .command)
                }
            }
        }
        .menuBarExtraStyle(.window)

        Settings {
            PrefrencesView()
                .frame(width: 400, height: 400)
        }
    }
}
