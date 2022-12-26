//
//  PrefrencesAboutView.swift
//  Medo
//
//  Created by Aayush Pokharel on 2022-03-20.
//

import SwiftUI

struct PrefrencesAboutView: View {
    var body: some View {
        VStack {
            Spacer()

            Image("thopda")
                .resizable()
                .profileImage()

            Text("Made with ❤️ by Aayush")
                .foregroundStyle(.tertiary)
                .padding(.top)

            Spacer()

            VStack {
                CleanLinkView(
                    image: Image("github"),
                    title: "Github Repo",
                    url: Constants.repoURL,
                    color: .black,
                    inverted: true
                )

                CleanLinkView(
                    image: Image(systemName: "applelogo"),
                    title: "App Store Page",
                    url: Constants.appStoreURL,
                    color: .blue
                )
                CleanLinkView(
                    image: Image(systemName: "globe"),
                    title: "Website",
                    url: Constants.webpageURL,
                    color: .red
                )
            }
            .padding(.horizontal)

            Spacer()
        }
    }
}

struct PrefrencesAboutView_Previews: PreviewProvider {
    static var previews: some View {
        PrefrencesAboutView()
            .frame(width: 300, height: 400)
    }
}
