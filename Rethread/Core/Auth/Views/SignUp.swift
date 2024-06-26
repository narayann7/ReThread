//
//  SignUp.swift
//  Rethread
//
//  Created by narayan on 07/04/24.
//

import SwiftUI

struct SignUp: View {
    @StateObject private var signUpViewModel: SignUpViewModel = .init()

    @Environment(\.dismiss) var pop;

    var body: some View {
        VStack {
            Spacer()
            VStack(
                spacing: 12,
                content: {
                    Image("rethread-icon").resizable().scaledToFit().frame(width: 150, height: 150)
                    Spacer().frame(height: 10)

                    TextField("Enter your email", text: $signUpViewModel.emailText)
                        .autocapitalization(.none)
                        .modifier(AuthTextFieldModifier())
                        .disabled(signUpViewModel.isLoading)

                    SecureField("Enter your password", text: $signUpViewModel.passwordText)
                        .modifier(AuthTextFieldModifier())
                        .disabled(signUpViewModel.isLoading)

                    TextField("Enter your user name", text: $signUpViewModel.userNameText)
                        .modifier(AuthTextFieldModifier())
                        .disabled(signUpViewModel.isLoading)

                    TextField("Enter your name", text: $signUpViewModel.nameText)
                        .modifier(AuthTextFieldModifier())
                        .disabled(signUpViewModel.isLoading)

                    Spacer().frame(height: 30)

                    Button {
                        Task {
                            await signUpViewModel.createUser()
                        }

                    } label: {
                        if signUpViewModel.isLoading {
                            ProgressView()
                                .modifier(AppProgressViewModifier())
                        } else {
                            Text("Sign Up").modifier(FlatButtonTextModifier())
                        }

                    }.modifier(LongButtonModifier())

                })
            Spacer()
            Divider()
            Button {
                pop()
            } label: {
                HStack(spacing: 4) {
                    Text("Already have an account?").fontWeight(.medium)
                    Text("Sign in").fontWeight(.bold)
                }.padding(.top, 30)
            }.foregroundStyle(AppColours.primary)
        }
        .padding(.horizontal, 25).modifier(RootViewModifier())
    }
}

#Preview {
    SignUp()
}
