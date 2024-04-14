//
//  RootModifier.swift
//  Rethread
//
//  Created by narayan on 07/04/24.
//

import Foundation
import SwiftUI

struct RootViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content.environment(\.font, Font.custom("Sen", size: 16))
    }
}

// text button modifiers

struct FlatButtonTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content.frame(
            width: .infinity, height: 40
        ).frame(maxWidth: .infinity)
            .background(AppColours.primary)
            .foregroundColor(AppColours.primaryBackground)
            .cornerRadius(10)
            .fontWeight(.semibold)
    }
}

// text field modifiers
struct AuthTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content.padding(14).background(AppColours.grey6).cornerRadius(10)
    }
}
