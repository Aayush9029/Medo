//
//  WelcomeView3.swift
//  Medo
//
//  Created by Aayush Pokharel on 2022-03-22.
//

import SwiftUI

struct WelcomeView3: View {
    @State private var isWelcomeShown: Bool = false
    @State private var isNextViewShown: Bool = false

    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            HStack {
                Spacer()
            }
            Text("Hope you have a")
                .font(.title)
                .foregroundStyle(.secondary)
                .offset( x: isWelcomeShown ? 0 : 200, y: 0)
            Text("Productive")
                .font(.system(size: 48))
                .foregroundColor(.blue)

                .opacity(isWelcomeShown ? 1 : 0)

            Text("Day, Week, Month, Year")
                .foregroundStyle(.secondary)
                .offset( x: isWelcomeShown ? 0 : -200, y: 0)

            Spacer()
        }
        .background(.ultraThinMaterial)
        .onAppear {
            withAnimation(.easeIn(duration: 1)) {
                isWelcomeShown.toggle()
            }
        }
    }
}

struct WelcomeView3_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView3()
            .frame(width: 300, height: 400)

    }
}
