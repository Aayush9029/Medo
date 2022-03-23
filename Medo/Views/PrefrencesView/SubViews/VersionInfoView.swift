//
//  VersionInfoView.swift
//  Medo
//
//  Created by Aayush Pokharel on 2022-03-23.
//

import SwiftUI

struct VersionInfoView: View {
    @EnvironmentObject var updatesViewModel: VersionCheckViewModel
    @Environment(\.openURL) var openURL

    var body: some View {
        VStack {
            VersionInfoLine(title: "Installed Version", icon: "info", value: Bundle.main.releaseVersionNumber)

            VersionInfoLine(title: "Latest Version", icon: "number", value: updatesViewModel.latestVersion.version)
            CleanLinkView(
                image: Image("github"),
                title: "Open Releases Page",
                url: Constants.releasesPageURL,
                color: .black,
                inverted: true
            )
        }
    }
}

struct VersionInfoView_Previews: PreviewProvider {
    static var previews: some View {
        VersionInfoView()
            .environmentObject(VersionCheckViewModel())
            .padding(100)
    }
}

// MARK: - Single Version info line
struct VersionInfoLine: View {
    let title: String
    let icon: String
    let value: String?

    var body: some View {

        HStack {
            Label(title, systemImage: icon)
                .symbolVariant(.circle)
            Spacer()
            Text(value ?? "0.0")
        }
        .foregroundStyle(.secondary)
        .padding(8)
        .background(.black.opacity(0.25))
        .cornerRadius(16)
    }
}
