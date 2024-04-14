//
//  SignUpViewModel.swift
//  Rethread
//
//  Created by narayan on 14/04/24.
//

import Foundation

class SignUpViewModel: ObservableObject {
    @Published var emailText: String = ""
    @Published var passwordText: String = ""
    @Published var nameText: String = ""
    @Published var userNameText: String = ""
    @Published var isLoading: Bool = false

    @MainActor
    func createUser() async {
        isLoading=true
        try? await AuthService.shared.signUp(email: emailText, password: passwordText, name: nameText, username: userNameText)
        isLoading=false
    }
}
