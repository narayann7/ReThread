//
//  SignInViewModel.swift
//  Rethread
//
//  Created by narayan on 14/04/24.
//

import Foundation

class SignInViewModel: ObservableObject {
    @Published var emailText: String = ""
    @Published var passwordText: String = ""
    @Published var isLoading: Bool = false

    @MainActor
    func signInUser() async {
        isLoading = true
        try? await AuthService.shared.signIn(email: emailText, password: passwordText)
        isLoading = false
    }
}
