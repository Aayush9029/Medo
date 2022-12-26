//
//  CircularButtonModifier.swift
//  Medo
//
//  Created by Aayush Pokharel on 2022-03-19.
//

import SwiftUI

struct CircularButtonModifier: ViewModifier {
    @State var hovering: Bool = false

    let color: Color

    func body(content: Content) -> some View {
        content
            .font(.body.bold())
            .foregroundColor(hovering ? .white : color)
            .buttonStyle(.plain)
            .padding(8)
            .background(color.opacity(hovering ? 0.5 : 0.1))
            .clipShape(Circle())
            .onHover { value in
                withAnimation {
                    hovering = value
                }
            }
    }
}
