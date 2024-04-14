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
                    TextField("Enter your email", text: $signUpViewModel.emailText).autocapitalization(.none).modifier(AuthTextFieldModifier())
                    SecureField("Enter your password", text: $signUpViewModel.passwordText).modifier(AuthTextFieldModifier())
                    TextField("Enter your user name", text: $signUpViewModel.userNameText).modifier(AuthTextFieldModifier())
                    TextField("Enter your name", text: $signUpViewModel.nameText).modifier(AuthTextFieldModifier())
                    Spacer().frame(height: 30)
                    Button {
                        Task {
                            await signUpViewModel.createUser()
                        }
                    } label: {
                        Text("Sign Up").modifier(FlatButtonTextModifier())
                    }
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
