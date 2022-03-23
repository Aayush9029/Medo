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
                    .boldText()
                    .padding(.vertical)

                PrefrencesSingleLineView(icon: "plus", title: "Total # of Tasks Added", value: usage_add)
                PrefrencesSingleLineView(icon: "trash", title: "Total # of Tasks Deleted", value: usage_delete)
                PrefrencesSingleLineView(icon: "pencil", title: "Total # of Tasks Edited", value: usage_edit)
                PrefrencesSingleLineView(icon: "arrow.up", title: "App Launch Count", value: app_open_count)
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
