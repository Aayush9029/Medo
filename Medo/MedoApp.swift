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
    @StateObject private var statusBarController = StatusBarController()

    var body: some Scene {
        WindowGroup {
            //            Thanks SwiftUI
            ZStack {
                EmptyView()
            }
            .hidden()
            .onAppear {
                setupPopupMenu()
            }
        }
        Settings {
            Text("Settings")
                .frame(width: 300, height: 400)
        }
    }
}

// MARK: - Setting up PopUp Menu
extension MedoApp {
    private func setupPopupMenu() {
        let contentView = ContentView()
            .environment(\.managedObjectContext, persistenceController.container.viewContext)
        let popover = NSPopover()
        popover.contentViewController = MainHostingVC(rootView: contentView)
        popover.contentSize = NSSize(width: 360, height: 520)
        statusBarController.start(with: popover)
    }
}
