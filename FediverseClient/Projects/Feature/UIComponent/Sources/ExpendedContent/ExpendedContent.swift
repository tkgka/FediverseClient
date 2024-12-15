//
//  ExpendedContent.swift
//  UIComponent
//
//  Created by 김수환 on 12/15/24.
//  Copyright © 2024 com.Nazku. All rights reserved.
//

import SwiftUI

extension View {
    public func expendedContent<ExpendedContent: View>(
        isPresented: Binding<Bool>,
        anchor: UnitPoint = .center,
        @ViewBuilder content: @escaping () -> ExpendedContent
    ) -> some View {
        ExpendedContentView(
            isShowing: isPresented,
            expendedContent: content,
            originalContent: { self },
            anchor: anchor
        )
    }
}

struct ExpendedContentView<
    ExpendedContent: View,
    OriginalContent: View
>: View {
    @Binding var isShowing: Bool
    let expendedContent: () -> ExpendedContent
    let originalContent: () -> OriginalContent
    let anchor: UnitPoint
    
    var body: some View {
        VStack {
            if isShowing {
                expendedContent()
                    .transition(.scale(.zero, anchor: anchor).combined(with: .blurReplace))
            } else {
                originalContent()
                    .transition(.blurReplace)
            }
        }
        .animation(.easeInOut, value: isShowing)
    }
}
