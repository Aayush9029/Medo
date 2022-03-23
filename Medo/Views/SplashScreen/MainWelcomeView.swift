//
//  MainWelcomeView.swift
//  Medo
//
//  Created by Aayush Pokharel on 2022-03-22.
//

import SwiftUI
import Cocoa

struct MainWelcomeView: View {
    @State private var currentView: Int = 0

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Group {
                switch currentView {
                case 0:
                    WelcomeView1()
                case 1:
                    WelcomeView2()
                case 2:
                    WelcomeView3()
                default:
                    EmptyView()
//                    Something's wrong i can feel it
                }
            }

            Button(action: {
                currentView += 1
                if currentView == 3 {
                    NSApplication.shared.keyWindow?.close()

                }
            }, label: {
                Label("Next", systemImage: currentView == 2 ? "checkmark" : "arrow.right")
                    .boldText()
                    .labelStyle(.iconOnly)

            })
            .circularButton(color: currentView == 2 ? .green : .blue)
            .overlay(
                Circle()
                    .stroke(.blue, lineWidth: 3)
            )
            .padding()

        } .frame(width: 300, height: 400)
    }
}

struct MainWelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        MainWelcomeView()
    }
}
