//
//  PrefrencesUsageView.swift
//  Medo
//
//  Created by Aayush Pokharel on 2022-03-19.
//

import SwiftUI

struct PrefrencesUsageView: View {
    @AppStorage(AppStorageStrings.usage_add) var usage_add = 0
    @AppStorage(AppStorageStrings.usage_delete) var usage_delete = 0
    @AppStorage(AppStorageStrings.usage_edit) var usage_edit = 0
    @AppStorage(AppStorageStrings.app_open_count) var app_open_count = 0

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading) {
                Text("App Usage Stats")
                    .font(.title2.bold())
                    .padding(.vertical)

                PrefrencesSingleLine(icon: "plus", title: "Total # of Tasks Added", value: usage_add)
                PrefrencesSingleLine(icon: "trash", title: "Total # of Tasks Deleted", value: usage_delete)
                PrefrencesSingleLine(icon: "pencil", title: "Total # of Tasks Edited", value: usage_edit)
                PrefrencesSingleLine(icon: "arrow.up", title: "App Launch Count", value: app_open_count)
            }
            .padding(.horizontal)
        }
    }
}

struct PrefrencesUsageView_Previews: PreviewProvider {
    static var previews: some View {
        PrefrencesUsageView()
    }
}

// MARK: - Single Prefrence Line

struct PrefrencesSingleLine: View {
    let icon: String
    let title: String
    let value: Int

    var body: some View {
        HStack {
            Label(title, systemImage: icon)
                .foregroundStyle(.secondary)

            Spacer()
            Text("\(value)")
                .bold()
                .foregroundStyle(.primary)
        }
        .font(.title3)
        .padding()
        .background(.ultraThinMaterial)
        .cornerRadius(6)
        .symbolVariant(.circle)
    }
}
