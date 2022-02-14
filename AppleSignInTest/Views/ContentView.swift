//
//  ContentView.swift
//  AppleSignInTest
//
//  Created by Alessandro Dovere on 11/02/22.
//

import SwiftUI

struct ContentView: View {
    @State private var mail = ""
    @State private var password = ""
    @State private var editingEmail = false
    @State private var editingPassword = false

    var body: some View {
        ZStack {
            LinearGradient(colors: [Color.blue, Color.white], startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)

            Image("Blob 1")
                .resizable()
                .scaledToFit()
                .offset(x: 40,y: -200)

            VStack(alignment: .leading, spacing: 16) {
                Text("Sign up")
                    .font(.largeTitle).bold()
                    .foregroundColor(.white)
                Text("Accedi alla tua lega")
                    .font(.subheadline)
                    .foregroundColor(Color.white.opacity(0.7))
                HStack(spacing: 12.0) {
                    TextFieldIcon(currentlyEditing: $editingEmail, Icon: "mail")
                        .foregroundColor(.white)
                    TextField("Email", text: $mail)
                        .colorScheme(.dark)
                        .foregroundColor(Color.white.opacity(0.7))
                        .autocapitalization(.none)
                        .textContentType(.emailAddress)
                }
                .frame(height: 52)
                .overlay(RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.white, lineWidth: 1.0)
                            .blendMode(.overlay))
                .background(
                    Color("secondaryBackground")
                        .cornerRadius(16)
                        .opacity(0.8)
                )

                HStack(spacing: 12.0) {
                    TextFieldIcon(currentlyEditing: $editingPassword, Icon: "key.fill")
                        .foregroundColor(.white)
                    TextField("Password", text: $password)
                        .colorScheme(.dark)
                        .foregroundColor(Color.white.opacity(0.7))
                        .autocapitalization(.none)
                        .textContentType(.emailAddress)
                }
                .frame(height: 52)
                .overlay(RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.white, lineWidth: 1.0)
                            .blendMode(.overlay))
                .background(
                    Color("secondaryBackground")
                        .cornerRadius(16)
                        .opacity(0.8)
                )
                Button {
                    print("Accedi")
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .stroke()
                            .gradientForeground(colors: [.white,.blue])
                            .frame(maxHeight: 50)
                        Text("Crea un account")
                            .bold()
                            .foregroundColor(.white)
                    }
                }
                .buttonStyle(.borderless)
                .cornerRadius(0.01)

                Text("Cliccando su crea un account, accetti i nostri Termini e Condizioni")
                    .font(.footnote)
                    .foregroundColor(Color.white.opacity(0.7))

                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(Color.white.opacity(0.8))
                VStack(alignment: .leading, spacing: 16, content: {
                    Button(action: {
                        print("Switch to sign in")
                    }, label: {
                        HStack{
                            Text("Hai già un account ?")
                                .foregroundColor(Color.white.opacity(0.7))
                            GradientText(text: "Accedi")
                        }
                    })
                })
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 24, style: .continuous)
                            .stroke()
                            .fill(LinearGradient(colors: [Color.white, Color.blue], startPoint: .top, endPoint: .bottom))
                            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 24)))
            .padding(10)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
