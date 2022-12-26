//
//  BottomBarView.swift
//  Medo
//
//  Created by Aayush Pokharel on 2022-03-19.
//

import SwiftUI

struct BottomBarView: View {
    @EnvironmentObject var taskViewModel: TaskViewModel

    var body: some View {
        Group {
            HStack {
                Button {
                    taskViewModel.writeData()
                } label: {
                    Label(
                        "Add Item",
                        systemImage: taskViewModel.updateItem != nil ? "pencil" : "plus"
                    )
                    .labelStyle(.iconOnly)
                    .circularButton(
                        color: taskViewModel.updateItem != nil ? .blue : .green
                    )
                }
                .keyboardShortcut(.return)
                .buttonStyle(.plain)
                .opacity(taskViewModel.title.isEmpty ? 0.25 : 1)
                .disabled(taskViewModel.title.isEmpty)

                ScrollView(.horizontal, showsIndicators: true) {
                    TextField("Task Title", text: $taskViewModel.title)
                        .id("TitleTextField")
                        .font(.title2)
                        .textFieldStyle(.plain)
                }

                Spacer()

                Button {
                    taskViewModel.confrimDelete.toggle()
                } label: {
                    Label("Delete All", systemImage: "trash")
                        .labelStyle(.iconOnly)
                }
                .keyboardShortcut(
                    .delete,
                    modifiers: [.command, .option],
                    localization: KeyboardShortcut.Localization.automatic
                )
                .circularButton(color: .red)
            }
        }
        .padding(6)
        .background(
            VisualEffectView(
                material: .hudWindow,
                blendingMode: .withinWindow
            )
        )
        .cornerRadius(8)
        .shadow(color: .white.opacity(0.75), radius: 4, x: 0, y: -2)
        .shadow(color: .blue, radius: 18, x: 0, y: -2)
    }
}

struct BottomBarView_Previews: PreviewProvider {
    static var previews: some View {
        BottomBarView()
    }
}
