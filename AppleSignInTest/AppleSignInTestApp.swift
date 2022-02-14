//
//  AppleSignInTestApp.swift
//  AppleSignInTest
//
//  Created by Alessandro Dovere on 11/02/22.
//

import SwiftUI
import Firebase

@main
struct AppleSignInTestApp: App {

    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
