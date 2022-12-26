//
//  SpinnyImageModifier.swift
//  Medo
//
//  Created by Aayush Pokharel on 2022-03-23.
//

import SwiftUI

struct SpinnyImageModifier: ViewModifier {
    @State var isHovered: Bool = false

    func body(content: Content) -> some View {
        content
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
            .rotationEffect(Angle(degrees: isHovered ? 720 : 0))
            .scaleEffect(isHovered ? 1.1 : 0.8)
            .onHover { val in
                withAnimation {
                    isHovered = val
                }
            }
    }
}
