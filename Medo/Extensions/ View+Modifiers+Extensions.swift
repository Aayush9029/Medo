//
//  View+Modifiers+Extensions.swift
//  Medo
//
//  Created by Aayush Pokharel on 2022-03-23.
//

import Cocoa
import SwiftUI

// MARK: - Circular Button Modifier

extension View {
    func circularButton(color: Color) -> ModifiedContent<Self, CircularButtonModifier> {
        return modifier(CircularButtonModifier(color: color))
    }
}

// MARK: - Circular Image Modifier

extension View {
    func profileImage() -> ModifiedContent<Self, SpinnyImageModifier> {
        return modifier(SpinnyImageModifier())
    }
}

// MARK: - Circular Image Modifier

extension View {
    func boldText() -> ModifiedContent<Self, BoldTextModifier> {
        return modifier(BoldTextModifier())
    }
}
