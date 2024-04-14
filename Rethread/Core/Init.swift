//
//  StartView.swift
//  Rethread
//
//  Created by narayan on 14/04/24.
//

import Firebase
import SwiftUI

class InitViewModel: ObservableObject {
    @Published var isSigned: Bool = false

    init() {
        Auth.auth().addStateDidChangeListener { _, user in
            if user?.uid == nil {
                self.isSigned = false
                print("not login")
            }
            else {
                self.isSigned = true
                print("login")
            }
        }
    }
}

struct Init: View {
    @StateObject private var initViewModel: InitViewModel = .init()

    var body: some View {
        Group {
            if initViewModel.isSigned {

                FeedScreen()
            }
            else {
                SignIn()
            }
        }
    }
}

