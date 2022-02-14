//
//  GradientText.swift
//  SwiftUI Advanced
//
//  Created by admin on 18/05/21.
//

import SwiftUI


struct GradientText: View {
    var text = ""
    var body: some View {
        Text(text)
            .font(.footnote)
            .bold()
            .gradientForeground(colors: [Color("pink-gradient-1"),Color("pink-gradient-2")])
    }
}

