//
//  SignInWithAppleButton.swift
//  AppleSignInTest
//
//  Created by Alessandro Dovere on 11/02/22.
//

import SwiftUI
import AuthenticationServices


struct SignInWithAppleButton: UIViewRepresentable {
    typealias UIViewType = ASAuthorizationAppleIDButton

    func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
        return ASAuthorizationAppleIDButton(type: .signIn, style: .black)
    }
    func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context) {}
}
