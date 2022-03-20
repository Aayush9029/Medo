//
//  PrefrencesPowerUserView.swift
//  Medo
//
//  Created by Aayush Pokharel on 2022-03-20.
//

import SwiftUI

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
                            // MARK: Add Tasks

                            Text("Quickly Add Tasks By Sending a Request")
                            HStack(spacing: 0) {
                                Text("medo://add-task?title=")
                                    .foregroundColor(.blue)
                                    .bold()

                                Text("taskTitle")
                                    .foregroundStyle(.secondary)
                                Text("?p=")
                                    .foregroundColor(.blue)
                                    .bold()
                                Text("[1, 2 or 3]")
                                    .foregroundStyle(.secondary)
                            }
                            .padding(4)
                            .background(.thinMaterial)
                            .cornerRadius(6)
                        }

                        // MARK: Delete Tasks

                        Group {
                            Text("Delete the task on top")
                            HStack(spacing: 0) {
                                Text("medo://delete-top")
                                    .foregroundColor(.blue)
                                    .bold()
                            }
                            .padding(4)
                            .background(.thinMaterial)
                            .cornerRadius(6)
                        }

                        Group {
                            Text("Delete All Tasks")
                            HStack(spacing: 0) {
                                Text("medo://delete-all")
                                    .foregroundColor(.blue)
                                    .bold()
                            }
                            .padding(4)
                            .background(.thinMaterial)
                            .cornerRadius(6)
                        }

                        // MARK: Show Tasks

                        Group {
                            Text("Shows the top most tasks in a floating window")
                            HStack(spacing: 0) {
                                Text("medo://show-top")
                                    .foregroundColor(.blue)
                                    .bold()
                            }
                            .padding(4)
                            .background(.thinMaterial)
                            .cornerRadius(6)
                        }
                        Group {
                            Text("Shows the top most tasks in a floating window")
                            HStack(spacing: 0) {
                                Text("medo://show-all")
                                    .foregroundColor(.blue)
                                    .bold()
                            }
                            .padding(4)
                            .background(.thinMaterial)
                            .cornerRadius(6)
                        }
                    }
                    .padding(.bottom)
                }

                Divider()

                Group {
                    Text("Keyboard Shortcuts")
                        .font(.title2.bold())
                    HStack {
                        Text("Add Tasks")
                        Spacer()
                        SingleKeyView(image: "command")
                        Image(systemName: "plus")
                        SingleKeyView(image: "return")
                    }
                    .padding(10)
                    .background(.thinMaterial)
                    .cornerRadius(6)

                    HStack {
                        Text("Toggle Floating View")
                        Spacer()
                        SingleKeyView(image: "command")
                        Image(systemName: "plus")
                        SingleKeyView(image: "f.square")
                    }
                    .padding(10)
                    .background(.thinMaterial)
                    .cornerRadius(6)
                }
                Spacer()
            }
            .padding()
        }
    }
}

struct PrefrencesPowerUserView_Previews: PreviewProvider {
    static var previews: some View {
        PrefrencesPowerUserView()
            .frame(width: 300, height: 400)
            .padding()
    }
}

struct SingleKeyView: View {
    let image: String
    var body: some View {
        Image(systemName: image)
            .padding(4)
            .background(.black.opacity(0.5))
            .cornerRadius(6)
    }
}
