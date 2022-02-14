//
//  View+.swift
//  AppleSignInTest
//
//  Created by Alessandro Dovere on 14/02/22.
//
import SwiftUI

extension View {
    public func gradientForeground(colors: [Color], startPoint: UnitPoint = .topLeading, endPoint: UnitPoint = .bottomTrailing) -> some View {
        self
            .overlay(LinearGradient(gradient: Gradient(colors: colors), startPoint: startPoint, endPoint: endPoint))
            .mask(self)
    }
}
