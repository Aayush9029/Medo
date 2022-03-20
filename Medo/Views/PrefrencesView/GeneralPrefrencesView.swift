//
//  GeneralPrefrencesView.swift
//  Medo
//
//  Created by Aayush Pokharel on 2022-03-19.
//

import SwiftUI

struct GeneralPrefrencesView: View {
    var body: some View {
        TabView {
            PrefrencesPowerUserView()
                .tabItem {
                    Label("Power User", systemImage: "bolt.fill")
                        .foregroundStyle(.teal)
                }

            PrefrencesUsageView()
                .tabItem {
                    Label("Usage", systemImage: "chart.line.uptrend.xyaxis")
                }

            PrefrencesAboutView()
                .tabItem {
                    Label("Info", systemImage: "info.circle.fill")
                }
        }
    }
}

struct GeneralPrefrencesView_Previews: PreviewProvider {
    static var previews: some View {
        GeneralPrefrencesView()
    }
}
