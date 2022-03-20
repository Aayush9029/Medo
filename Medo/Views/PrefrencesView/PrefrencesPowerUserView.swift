//
//  PrefrencesPowerUserView.swift
//  Medo
//
//  Created by Aayush Pokharel on 2022-03-20.
//

import SwiftUI

struct SingleUrlSchemeView: View {
    let title: String
    let url: String

    var body: some View {
        Group {
            Text(title)
            Text(url)
                .foregroundColor(.blue)
                .bold()
            .padding(4)
            .background(.thinMaterial)
            .cornerRadius(6)
        }
    }
}

struct KeyboardShortCutView: View {
    let title: String
    let image1: String
    let image2: String

    var body: some View {
        HStack {
            Text(title)
            Spacer()
            SingleKeyView(image: image1)
            Image(systemName: "plus")
            SingleKeyView(image: image2)
        }
        .padding(10)
        .background(.thinMaterial)
        .cornerRadius(6)
    }
}

struct PrefrencesPowerUserView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading) {
                Group {
                    Text("URL Schemes")
                        .font(.title2.bold())
                        .padding(.bottom, 5)

                    VStack(alignment: .leading) {
                        Group {
                            // MARK: Add Tasks Custom
                            Text("Quickly Add Tasks By Sending a Request")
                            HStack(spacing: 0) {
                                Text("medo://add-task?title=")
                                    .foregroundColor(.blue)
                                    .bold()

                                Text("taskTitle")
                                    .foregroundStyle(.secondary)
                                Text("&p=")
                                    .foregroundColor(.blue)
                                    .bold()
                                Text("1, 2 or 3")
                                    .foregroundStyle(.secondary)
                            }
                            .padding(4)
                            .background(.thinMaterial)
                            .cornerRadius(6)
                        }

                        // MARK: Delete Tasks
                        Group {
                            SingleUrlSchemeView(title: "Delete Task on Top", url: "medo://delete-top")
                            SingleUrlSchemeView(title: "Delete All Tasks", url: "medo://delete-all")
                        }

                        // MARK: Show Tasks
                        Group {
                            SingleUrlSchemeView(title: "Shows the top most tasks in a floating window", url: "medo://show-top")
                            SingleUrlSchemeView(title: "Shows the top most tasks in a floating window", url: "medo://show-all")
                        }
                    }
                    .padding(.bottom)
                }

                Divider()

                Group {
                    Text("Keyboard Shortcuts")
                        .font(.title2.bold())
                    KeyboardShortCutView(title: "Add Task", image1: "command", image2: "return")
                    KeyboardShortCutView(title: "Add Task, priority low", image1: "command", image2: "1.square")
                    KeyboardShortCutView(title: "Add Task, priority high", image1: "command", image2: "2.square")
                    KeyboardShortCutView(title: "Add Task, priority medium", image1: "command", image2: "3.square")
                    KeyboardShortCutView(title: "Toggle Floating View", image1: "command", image2: "f.square")
                }
                Spacer()
            }
            .padding([.horizontal, .top])
            Text("Note: These aren't global shortcuts")
                .foregroundStyle(.tertiary)

            Divider()

        }
    }
}

struct PrefrencesPowerUserView_Previews: PreviewProvider {
    static var previews: some View {
        PrefrencesPowerUserView()
            .frame(width: 320, height: 400)
            .padding()
    }
}

struct SingleKeyView: View {
    let image: String
    var body: some View {
        Image(systemName: image)
            .padding(4)
            .background(.black.opacity(0.25))
            .cornerRadius(6)
    }
}
