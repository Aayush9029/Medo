//
//  KeyWindow.swift
//  Medo
//
//  Created by Aayush Pokharel on 2022-03-23.
//

import Cocoa

class KeyWindow: NSWindow {
    override var canBecomeKey: Bool {
        return true
    }
}

// Handle key events

extension KeyWindow {
    override func keyDown(with event: NSEvent) {
        if event.modifierFlags.intersection(.deviceIndependentFlagsMask) == .command && event.charactersIgnoringModifiers == "w" {
            close()
            return
        } else {
            super.keyDown(with: event)
        }
    }
}
