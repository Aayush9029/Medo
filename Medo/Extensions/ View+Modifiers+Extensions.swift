//
//  View+Modifiers+Extensions.swift
//  Medo
//
//  Created by Aayush Pokharel on 2022-03-23.
//

import SwiftUI
import Cocoa

// MARK: - Circular Button Modifier

extension View {
    func circularButton(color: Color) -> ModifiedContent<Self, CircularButtonModifier> {
        return modifier(CircularButtonModifier(color: color))
    }
}
// MARK: - Circular Image Modifier

extension View {
    func profileImage() -> ModifiedContent<Self, CircularSpinnyImageModifier> {
        return modifier(CircularSpinnyImageModifier())
    }
}

// MARK: - Circular Image Modifier

extension View {
    func boldText() -> ModifiedContent<Self, BoldTextModifier> {
        return modifier(BoldTextModifier())
    }
}
