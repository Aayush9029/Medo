//
//  WelcomeView2.swift
//  Medo
//
//  Created by Aayush Pokharel on 2022-03-22.
//

import SwiftUI

struct WelcomeView2: View {
    @State private var isWelcomeShown: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            SingleRowWelcomeView(title: "It's a menu bar app", icon: "menubar.arrow.up.rectangle")

            HStack {
                Text("Open Preferences using")
                Spacer()
                SingleKeyView(image: "command")
                    .foregroundStyle(.secondary)

                Image(systemName: "plus")
                Text(",")
                    .font(.title3.bold())
                    .foregroundStyle(.secondary)

                    .frame(width: 14, height: 14)
                    .padding(4)
                    .background(.black.opacity(0.25))
                    .cornerRadius(6)
            }
            .padding(10)
            .background(
                LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.25), Color.purple]), startPoint: .leading, endPoint: .trailing)
            )
            .cornerRadius(6)
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .stroke(Color.blue.opacity(0.40), lineWidth: 2)
            )
            SingleRowWelcomeView(title: "We've got Keyboard shortcuts", icon: "keyboard")
            SingleRowWelcomeView(title: "URL Scheme support", icon: "globe")

            SingleRowWelcomeView(title: "UI customizations", icon: "sparkles")

            SingleRowWelcomeView(title: "Super Snappy UX", icon: "wind.snow")
            
            
            Spacer()
        }
        .padding()
        .foregroundStyle(.primary)
        .offset(x: isWelcomeShown ? 0 : -500)
        
        .onAppear {
            withAnimation(.easeIn(duration: 0.5)) {
                isWelcomeShown.toggle()
            }
        }
}
}

struct SingleRowWelcomeView: View {
    let title: String
    let icon: String
    var body: some View {
        HStack {
            Text(title)
            Spacer()
            SingleKeyView(image: icon)
                .foregroundStyle(.secondary)

        }
        .padding(10)
        .background(
            LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.25), Color.purple]), startPoint: .leading, endPoint: .trailing)
        )
        .cornerRadius(6)
        .overlay(
            RoundedRectangle(cornerRadius: 6)
                .stroke(Color.blue.opacity(0.40), lineWidth: 2)
                .shadow(color: Color.blue, radius: 10, x: 0, y: 2)

        )
        .shadow(color: Color.purple, radius: 50, x: 0, y: 2)
    }
}
struct WelcomeView2_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView2()
            .frame(width: 300, height: 400)

    }
}
