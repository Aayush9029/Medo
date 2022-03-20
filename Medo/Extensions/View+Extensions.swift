//
//  View+Extensions.swift
//  Medo
//
//  Created by Aayush Pokharel on 2022-03-19.
//


import SwiftUI

// MARK: - Better Blur Modifiers
struct VisualEffectView: NSViewRepresentable {
    let material: NSVisualEffectView.Material
    let blendingMode: NSVisualEffectView.BlendingMode
    
    func makeNSView(context: Context) -> NSVisualEffectView {
        let visualEffectView = NSVisualEffectView()
        visualEffectView.material = material
        visualEffectView.blendingMode = blendingMode
        visualEffectView.state = NSVisualEffectView.State.active
        return visualEffectView
    }
    
    func updateNSView(_ visualEffectView: NSVisualEffectView, context: Context) {
        visualEffectView.material = material
        visualEffectView.blendingMode = blendingMode
    }
}



//MARK: - Circular Button Modifier
extension View {
    func circularButton(color: Color) -> ModifiedContent<Self, CircularButtonModifier> {
        return modifier(CircularButtonModifier(color: color))
    }
}
