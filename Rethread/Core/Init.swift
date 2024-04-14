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
        _
            =
            AuthService.shared.authUserListener { _, user in
                if user?.uid == nil {
                    self.isSigned = false
                }
                else {
                    self.isSigned = true
                }
            }
    }
}

struct Init: View {
    @StateObject private var initViewModel: InitViewModel = .init()

    var body: some View {
        if initViewModel.isSigned {
            FeedScreen()
        }
        else {
            SignIn()
        }
    }
}
