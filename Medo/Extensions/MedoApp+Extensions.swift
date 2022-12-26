//
//  MedoApp.swift
//  Medo
//
//  Created by Aayush Pokharel on 2022-12-26.
//

import SwiftUI

// MARK: - Helper to Show Floating Windows

extension MedoApp {
    func showFloatingWindow(height: CGFloat = 325) {
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
