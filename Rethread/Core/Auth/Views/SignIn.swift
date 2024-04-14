//
//  SignIn.swift
//  Rethread
//
//  Created by narayan on 07/04/24.
//

import SwiftUI

struct SignIn: View {
    @StateObject private var signInViewModel: SignInViewModel = .init()

    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                VStack(
                    spacing: 12,
                    content: {
                        Image("rethread-icon").resizable().scaledToFit().frame(width: 150)
                        Spacer().frame(height: 10)
                        TextField("Enter your email", text: $signInViewModel.emailText).autocapitalization(.none).modifier(AuthTextFieldModifier())
                        SecureField("Enter your password", text: $signInViewModel.passwordText).modifier(AuthTextFieldModifier())
                        Text("Forgot password?").frame(maxWidth: .infinity, alignment: .trailing)
                        Button {
                            Task {
                                await signInViewModel.signInUser()
                            }

                        } label: {
                            Text("Login").modifier(FlatButtonTextModifier())
                        }
                    })
                Spacer()
                Divider()

                NavigationLink {
                    SignUp().navigationBarBackButtonHidden()
                } label: {
                    HStack(spacing: 4) {
                        Text("Don't have an account?").fontWeight(.medium)
                        Text("Sign up").fontWeight(.bold)
                    }.padding(.top, 30).foregroundStyle(AppColours.primary)
                }
            }
            .padding(.horizontal, 25)
        }.modifier(RootViewModifier())
    }
}

#Preview {
    SignIn()
}
