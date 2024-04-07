//
//  RootModifier.swift
//  Rethread
//
//  Created by narayan on 07/04/24.
//

import Foundation
import SwiftUI


struct RootViewModifier : ViewModifier {
    func body(content:Content ) -> some View {
        content.environment(\.font, Font.custom("Sen",size:16))
    }
}



//text button modifiers

struct FlatButtonText : ViewModifier {
    func body(content: Content) -> some View {
        content.frame(maxWidth: .infinity,maxHeight: 40)
            .background(AppColours.primary)
            .foregroundColor(AppColours.primaryText)
            .cornerRadius(10)
            .fontWeight(.semibold)
    }
}
