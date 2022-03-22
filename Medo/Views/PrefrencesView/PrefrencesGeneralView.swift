//
//  PrefrencesGeneralView.swift
//  Medo
//
//  Created by Aayush Pokharel on 2022-03-20.
//

import SwiftUI

struct PrefrencesGeneralView: View {
    //    App settings
    @AppStorage(AppStorageStrings.launch_at_login) var launch_at_login = true
    @AppStorage(AppStorageStrings.show_time_stamp) var show_time_stamp = true
    @AppStorage(AppStorageStrings.share_usage_data) var share_usage_data = true

//    @AppStorage(AppStorageStrings.smallShortcut) var small_shortcut = "s"
//    @AppStorage(AppStorageStrings.mediumShortcut) var medium_shortcut = "f"
//    @AppStorage(AppStorageStrings.largeShortcut) var large_shortcut = "l"

    var body: some View {
        VStack(alignment: .leading) {
            List {
                Section {
                    HStack {
                        Label("Launch at login", systemImage: "laptopcomputer.and.arrow.down")
                            .font(.title3)
                        Spacer()
                        Toggle(isOn: $launch_at_login) {}
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
                Section {
                    VStack {
                        HStack {
                            Label("Share Crash logs", systemImage: "text.quote")
                                .font(.title3)
                            Spacer()
                            Toggle(isOn: $share_usage_data) {}
                        }
                    }
                } header: {
                    Text("Help Improve the app")
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
