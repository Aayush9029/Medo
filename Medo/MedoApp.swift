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

    @AppStorage(AppStorageStrings.app_open_count) var app_open_count = 0

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
        }
        Settings {
            GeneralPrefrencesView()
                .frame(width: 360, height: 400)
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
        popover.contentSize = NSSize(width: 360, height: 480)
        statusBarController.start(with: popover)
    }
}
