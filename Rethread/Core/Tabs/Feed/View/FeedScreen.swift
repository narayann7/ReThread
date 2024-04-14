//
//  FeedScreen.swift
//  Rethread
//
//  Created by narayan on 14/04/24.
//

import SwiftUI

struct FeedScreen: View {
    var body: some View {
        Button {
            Task {
                try? await AuthService.shared.logout()
            }
        } label: {
            Text("Logout")
        }
    }
}

#Preview {
    FeedScreen()
}
