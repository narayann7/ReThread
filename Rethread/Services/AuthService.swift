//
//  AuthService.swift
//  Rethread
//
//  Created by narayan on 14/04/24.
//

import Firebase
import Foundation

class AuthService {
    static var shared: AuthService = .init()

    @MainActor
    func signIn(email: String, password: String) async throws {
        let userData: AuthDataResult = try await Auth.auth().signIn(withEmail: email, password: password)
        print(userData.user.displayName ?? "")
        print(userData.user.uid)
        print(userData.user.email ?? "")
    }

    @MainActor
    func signUp(email: String, password: String, name: String, username: String) async throws {
        do {
            let userData: AuthDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
            print(userData.user.displayName ?? "")
            print(userData.user.uid)
            print(userData.user.email ?? "")

        } catch {
            print(error.localizedDescription)
        }
    }
}
