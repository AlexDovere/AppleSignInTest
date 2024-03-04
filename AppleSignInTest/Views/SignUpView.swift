//
//  ContentView.swift
//  AppleSignInTest
//
//  Created by Alessandro Dovere on 11/02/22.
//

import SwiftUI
import FirebaseAuth


struct SignUpView: View {
    @State private var mail = ""
    @State private var password = ""
    @State private var editingEmail = false
    @State private var editingPassword = false
    @State private var showProfile = false
    @State private var signInMode = false
    @State private var signInWithAppleObject = SignInWithAppleButtonCoordinator()
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 16) {
            Text(signInMode ? "Sign in" : "Sign up")
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
            
            Button {
                auth()
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .stroke()
                        .foregroundColor(.white)
                        .frame(maxHeight: 50)
                        .background(.thinMaterial, in:     RoundedRectangle(cornerRadius: 20, style: .continuous))
                    Text(signInMode ? "Accedi": "Crea un account")
                        .bold()
                        .foregroundColor(.white)
                }
            }
            .buttonStyle(.borderless)
            .cornerRadius(0.01)
            
            
            Text(signInMode ? "Accedi al tuo account Fantacalcio" : "Cliccando su crea un account, accetti i nostri Termini e Condizioni")
                .font(.footnote)
                .foregroundColor(Color.white.opacity(0.7))
            
            Rectangle()
                .frame(height: 1)
                .foregroundColor(Color.white.opacity(0.8))
            VStack(alignment: .leading, spacing: 16, content: {
                Button(action: {
                    withAnimation {
                        signInMode.toggle()
                    }
                }, label: {
                    HStack{
                        Text(signInMode ? "Non hai un account ?" : "Hai già un account ?")
                            .foregroundColor(Color.white.opacity(0.7))
                        GradientText(text: signInMode ? "Crea account" : "Accedi")
                    }
                })
            })
            Button {
                signInWithAppleObject.signInWithApple()
                print("Sign in with apple")
            } label: {
                SignInWithAppleButton()
                    .cornerRadius(20)
                    .frame(maxHeight: signInMode ? 50 : 0)
                    .opacity(signInMode ? 1 : 0 )
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 24, style: .continuous)
                .stroke()
                .fill(LinearGradient(colors: [Color.white, Color.blue], startPoint: .top, endPoint: .bottom))
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 24)))
        .padding(10)
        .fullScreenCover(isPresented: $showProfile) {
            print("dismiss profile")
        } content: {
            ProfileView()
        }

        
    }

    func auth() {
        Auth.auth().createUser(withEmail: mail, password: password) { result, error in
            guard error == nil else {
                print(error?.localizedDescription ?? "Errore generico durante l'autenticazione")
                return
            }
            print("Autenticazioni avvenuta con successo")
        }
    }
}


struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
