//
//  PrefrencesGeneralView.swift
//  Medo
//
//  Created by Aayush Pokharel on 2022-03-20.
//

import SwiftUI
import LaunchAtLogin

struct PrefrencesGeneralView: View {
    @AppStorage(AppStorageStrings.launch_at_login) var launch_at_login = true
    @AppStorage(AppStorageStrings.show_time_stamp) var show_time_stamp = true

    var body: some View {
        VStack(alignment: .leading) {
            List {
                Section {
                    HStack {
                        Label("Launch at login", systemImage: "laptopcomputer.and.arrow.down")
                            .font(.title3)
                        Spacer()
                        LaunchAtLogin.Toggle {
                            Text("")
                        }
                    }
                } header: {
                    Text("General")
                }
                Section {
                    HStack {
                        Label("Show time stamp", systemImage: "calendar")
                            .font(.title3)
                        Spacer()
                        Toggle(isOn: $show_time_stamp) {}
                    }
                } header: {
                    Text("UI / UX")
                }
            }
                .toggleStyle(.switch)
                .padding()
        }
    }
}

struct PrefrencesGeneralView_Previews: PreviewProvider {
    static var previews: some View {
        PrefrencesGeneralView()
            .frame(width: 400, height: 400)
    }
}
