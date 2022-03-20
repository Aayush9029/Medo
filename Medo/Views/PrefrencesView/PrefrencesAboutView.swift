//
//  PrefrencesAboutView.swift
//  Medo
//
//  Created by Aayush Pokharel on 2022-03-20.
//

import SwiftUI

struct PrefrencesAboutView: View {
    @State var isHovered: Bool = false
    var body: some View {
        VStack {
            Spacer()
            Image("thopda")
                .resizable()
                .scaledToFill()
                .frame(width: 120, height: 120)
                .blur(radius: isHovered ? 0 : 4)
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(.pink, lineWidth: 2)
                        .shadow(color: .pink, radius: 5)
                        .shadow(color: .pink, radius: isHovered ? 2 : 20, x: 0, y: 0)
                        .shadow(color: .purple, radius: isHovered ? 25 : 100, x: 0, y: 0)
                )
                .onHover { val in
                    withAnimation {
                        isHovered = val
                    }
                }

            Text("Made with ❤️ by Aayush")
                .foregroundStyle(.tertiary)
                .padding(.top)

            Spacer()
            VStack {
                CleanLinkView(
                    image: Image("github"),
                    title: "Github Repo",
                    url: "github.com/Aayush9029",
                    color: .black,
                    inverted: true
                )

                CleanLinkView(
                    image: Image(systemName: "applelogo"),
                    title: "App Store Page",
                    url: "apple.com",
                    color: .blue
                )
                CleanLinkView(
                    image: Image(systemName: "globe"),
                    title: "Website",
                    url: "aayushp.com.np",
                    color: .red
                )
            }
            .padding(.horizontal)

            Spacer()
        }
    }

    struct CleanLinkView: View {
        let image: Image
        let title: String
        let url: String
        let color: Color

        var inverted: Bool = false

        @State var isHovered: Bool = false

        var body: some View {
            Button {
                print(url)
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
}

struct PrefrencesAboutView_Previews: PreviewProvider {
    static var previews: some View {
        PrefrencesAboutView()
            .frame(width: 300, height: 400)
    }
}
