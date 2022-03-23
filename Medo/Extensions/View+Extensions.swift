//
//  View+Extensions.swift
//  Medo
//
//  Created by Aayush Pokharel on 2022-03-19.
//

import SwiftUI
import Cocoa

// MARK: - Better Blur Modifiers
struct VisualEffectView: NSViewRepresentable {
    let material: NSVisualEffectView.Material
    let blendingMode: NSVisualEffectView.BlendingMode

    func makeNSView(context _: Context) -> NSVisualEffectView {
        let visualEffectView = NSVisualEffectView()
        visualEffectView.material = material
        visualEffectView.blendingMode = blendingMode
        visualEffectView.state = NSVisualEffectView.State.active
        return visualEffectView
    }

    func updateNSView(_ visualEffectView: NSVisualEffectView, context _: Context) {
        visualEffectView.material = material
        visualEffectView.blendingMode = blendingMode
    }
}

// MARK: - Floating view
extension View {
    private func newWindowInternal(with title: String, isTransparent: Bool = false) -> NSWindow {
        let window = KeyWindow(
            contentRect: NSRect(x: 20, y: 20, width: 640, height: 360),
            styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
            backing: .buffered,
            defer: false
        )

        window.makeKey()
        window.isReleasedWhenClosed = false
        window.title = title
        window.makeKeyAndOrderFront(self)
        window.level = .floating
        if isTransparent {
            window.backgroundColor =  .clear
            window.isOpaque = false
            window.styleMask = [.hudWindow, .closable]
            window.isMovableByWindowBackground = true
            window.makeKeyAndOrderFront(self)
        }
        window.setIsVisible(true)
        return window
    }

    func openNewWindow(with title: String = "New Window", isTransparent: Bool = false) {
        let window = newWindowInternal(with: title, isTransparent: isTransparent)
        window.contentView = NSHostingView(rootView: self)
        NSApp.activate(ignoringOtherApps: true)
        window.makeKeyAndOrderFront(self)
    }
}
