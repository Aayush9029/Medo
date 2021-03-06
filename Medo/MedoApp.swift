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
                if app_open_count == 0 {
                    MainWelcomeView()
                        .background(.ultraThinMaterial)

                        .cornerRadius(16)
                        .openNewWindow(with: "Welcome", isTransparent: true)
                }
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
                    case .floatSmall:
                        showFloatingWindow(height: FloatType.floatSmall.rawValue)
                    case .floatMedium:
                        showFloatingWindow(height: FloatType.floatMedium.rawValue)
                    case .floatLarge:
                        showFloatingWindow(height: FloatType.floatLarge.rawValue)
                    }
                }
            }
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
        Settings {
            PrefrencesView()
                .frame(width: 400, height: 400)
        }
    }
}

// MARK: - Setting up PopUpMenu and showingFloatingWindow

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

    func showFloatingWindow(height: CGFloat=325) {
        ScrollView(.vertical, showsIndicators: false) {
            TasksListView(bottomPadding: 8, showEditTask: false)
                .frame(width: 300, height: height)
                .background(VisualEffectView(material: .hudWindow, blendingMode: .behindWindow))
                .cornerRadius(16)
        }

        .environment(\.managedObjectContext, taskViewModel.persistenceController.container.viewContext)
        .environmentObject(taskViewModel)
        .openNewWindow(isTransparent: true)

    }
}
