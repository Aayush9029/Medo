//
//  PrefrencesView.swift
//  Medo
//
//  Created by Aayush Pokharel on 2022-03-19.
//

import SwiftUI

struct PrefrencesView: View {
    var body: some View {
        TabView {
            PrefrencesGeneralView()
                .tabItem {
                Label("General", systemImage: "gear")
                }
            PrefrencesPowerUserView()
                .tabItem {
                    Label("Power User", systemImage: "bolt.fill")
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

struct PrefrencesView_Previews: PreviewProvider {
    static var previews: some View {
        PrefrencesView()
    }
}
