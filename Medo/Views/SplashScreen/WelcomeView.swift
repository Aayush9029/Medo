//
//  WelcomeView.swift
//  Medo
//
//  Created by Aayush Pokharel on 2022-03-22.
//

import SwiftUI

struct WelcomeView: View {
    @State private var isWelcomeShown: Bool = false
    @State private var isBlurShown: Bool = false

    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            HStack {
                Spacer()
            }
            Text("Welcome to")
                .font(.title)
                .foregroundStyle(.secondary)
                .offset(x: 0, y: isWelcomeShown ? 0 : -200)
            Text("medo")
                .font(.system(size: 48))
                .foregroundColor(.blue)
                .shadow(color: .blue, radius: 25)
            //                .offset( x: isWelcomeShown ? 0 : 200)
                .blur(radius: isBlurShown ? 0 : 50)

            Text("a minimal todo app")
                .foregroundStyle(.secondary)
                .offset(x: 0, y: isWelcomeShown ? 0 : 200)

            Spacer()
        }
        .onAppear {
            withAnimation(.spring(response: 1, dampingFraction: 0.25, blendDuration: 0.25)) {
                isBlurShown.toggle()
            }
            withAnimation(.easeIn(duration: 0.5)) {
                isWelcomeShown.toggle()
            }
        }
    }

}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
            .frame(width: 300, height: 400)
    }
}
