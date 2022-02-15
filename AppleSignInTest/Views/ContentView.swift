//
//  ContentView.swift
//  AppleSignInTest
//
//  Created by Alessandro Dovere on 14/02/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            LinearGradient(colors: [Color.blue, Color.white], startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)

            Image("Blob 1")
                .resizable()
                .scaledToFit()
                .offset(x: 40,y: -200)

            SignUpView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
