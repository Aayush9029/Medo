//
//  PrefrencesUsageView.swift
//  Medo
//
//  Created by Aayush Pokharel on 2022-03-19.
//

import SwiftUI

struct PrefrencesUsageView: View {
    @AppStorage(AppStorageStrings.addUsage) var addUsage = 0
    @AppStorage(AppStorageStrings.deleteUsage) var deleteUsage = 0
    @AppStorage(AppStorageStrings.editUsage) var editUsage = 0
    @AppStorage(AppStorageStrings.openCount) var openCount = 0

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading) {
                Text("App Usage Stats")
                    .boldText()
                    .padding(.vertical)

                PrefrencesSingleLineView(icon: "plus", title: "Total # of Tasks Added", value: addUsage)
                PrefrencesSingleLineView(icon: "trash", title: "Total # of Tasks Deleted", value: deleteUsage)
                PrefrencesSingleLineView(icon: "pencil", title: "Total # of Tasks Edited", value: editUsage)
                PrefrencesSingleLineView(icon: "arrow.up", title: "App Launch Count", value: openCount)
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
