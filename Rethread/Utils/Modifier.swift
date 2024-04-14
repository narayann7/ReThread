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
        content
            .frame(maxWidth: .infinity, maxHeight: 40)
            .foregroundColor(AppColours.primaryBackground)
            .fontWeight(.semibold)
    }
}

struct LongButtonModifier :ViewModifier{
    func body(content: Content) -> some View {
        content.frame(maxWidth: .infinity, maxHeight: 40).frame(height: 40)
            .background(.white).cornerRadius(10)
    }
}

// text field modifiers
struct AuthTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content.padding(14).background(AppColours.grey6).cornerRadius(10)
    }
}

struct AppProgressViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content.progressViewStyle(CircularProgressViewStyle(tint: AppColours.primaryBackground))
            .scaleEffect(1.5, anchor: .center)
    }
}
