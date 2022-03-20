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
                Group {
                    Button(action: {
                        taskViewModel.writeData()
                    }) {
                        Label("Add Item", systemImage: taskViewModel.updateItem != nil ? "pencil" : "plus")
                            .labelStyle(.iconOnly)
                            .circularButton(color: taskViewModel.updateItem != nil ? .blue : .green)
                    }
                    .keyboardShortcut(.return)
                    .buttonStyle(.plain)
                    .opacity(taskViewModel.title.count > 0 ? 1 : 0.25)
                    .disabled(taskViewModel.title.count == 0)
                }

                ScrollViewReader { scrollView in
                    ScrollView(.horizontal, showsIndicators: true) {
                        TextField("Task Title", text: $taskViewModel.title)
                            .id("TitleTextField")
                            .font(.title2)
                            .textFieldStyle(.plain)
                            .onChange(of: taskViewModel.title) { _ in
                                scrollView.scrollTo("TitleTextField", anchor: .trailing)
                            }
                    }
                }

                Spacer()

                Group {
                    Button(action: {
                        taskViewModel.confrimDelete.toggle()
                    }
                    ) {
                        Label("Delete All", systemImage: "trash")
                            .labelStyle(.iconOnly)
                    }
                    .keyboardShortcut(.delete, modifiers: [.command, .option], localization: KeyboardShortcut.Localization.automatic)
                    .circularButton(color: .red)
                }
            }
        }
        .padding(6)
        .background(VisualEffectView(material: .hudWindow, blendingMode: .withinWindow))
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
