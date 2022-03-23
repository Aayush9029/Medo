//
//  CleanLinkView.swift
//  Medo
//
//  Created by Aayush Pokharel on 2022-03-23.
//

import SwiftUI

struct CleanLinkView: View {
    let image: Image
    let title: String
    let url: String
    let color: Color

    var inverted: Bool = false

    @Environment(\.openURL) var openURL

    @State var isHovered: Bool = false

    var body: some View {
        Button {
            if let url = URL(string: url) {
                openURL(url)
            }
        } label: {
            HStack {
                if inverted {
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(height: 20)
                        .colorInvert()
                } else {
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(height: 20)
                }

                Text(title)
                    .bold()
                    .foregroundStyle(.secondary)
                Spacer()
            }
            .padding(.horizontal, 8)
            .padding(.vertical, 6)
            .background(color.opacity(isHovered ? 0.5 : 0.25))
            .cornerRadius(16)
            .shadow(color: color, radius: isHovered ? 10 : 50, x: 0, y: 0)
        }
        .buttonStyle(.plain)
        .onHover { val in
            withAnimation {
                isHovered = val
            }
        }
    }
}
struct CleanLinkView_Previews: PreviewProvider {
    static var previews: some View {
        CleanLinkView(
            image: Image(systemName: "globe"),
            title: "Website",
            url: Constants.webpageURL,
            color: .red
        )
        .padding(100)
    }
}
