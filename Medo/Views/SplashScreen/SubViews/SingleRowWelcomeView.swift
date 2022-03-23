//
//  SingleRowWelcomeView.swift
//  Medo
//
//  Created by Aayush Pokharel on 2022-03-23.
//

import SwiftUI

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
