//
//  TextInput.swift
//  example.UIComponent
//
//  Created by 김수환 on 12/15/24.
//  Copyright © 2024 com.Nazku. All rights reserved.
//

import SwiftUI

extension View {
    
    public func textInput<
        TopViewContent: View,
        LeadingViewContent: View,
        TrailingViewContent: View
    >(
        isShowing: Binding<Bool>,
        text: Binding<String>,
        @ViewBuilder topViewContent: @escaping () -> TopViewContent,
        @ViewBuilder leadingViewContent: @escaping () -> LeadingViewContent,
        @ViewBuilder trailingViewContent: @escaping () -> TrailingViewContent
    ) -> some View {
        ZStack {
            Color.black
            VStack(spacing: 0) {
                self
                    .clipShape(
                        .rect(
                            bottomLeadingRadius: isShowing.wrappedValue ? 32 : 0,
                            bottomTrailingRadius: isShowing.wrappedValue ? 32 : 0,
                            style: .continuous
                        )
                    )
                if isShowing.wrappedValue {
                    TextInputView(
                        isShowing: isShowing,
                        text: text,
                        topViewContent: topViewContent,
                        leadingViewContent: leadingViewContent,
                        trailingViewContent: trailingViewContent
                    )
                }
            }
        }
        .animation(.easeInOut, value: isShowing.wrappedValue)
    }
}

struct TextInputView<
    TopViewContent: View,
    LeadingViewContent: View,
    TrailingViewContent: View
>: View {
    
    @Binding var isShowing: Bool
    @Binding var text: String
    
    @FocusState private var isFocused: Bool
    @ViewBuilder var topViewContent: TopViewContent
    @ViewBuilder var leadingViewContent: LeadingViewContent
    @ViewBuilder var trailingViewContent: TrailingViewContent
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            topViewContent
            HStack(alignment: .bottom, spacing: 0) {
                leadingViewContent
                TextField(
                    "",
                    text: $text,
                    prompt: Text("Type here...")
                        .foregroundStyle(.white),
                    axis: .vertical
                )
                .focused($isFocused)
                .lineSpacing(10.0)
                .foregroundStyle(.white)
                trailingViewContent
            }
        }
        .padding(.horizontal, 16)
        .padding(.bottom, 8)
        .background {
            Color.black.ignoresSafeArea()
        }
        .onAppear {
            isFocused = true
        }
        .transition(.scale)
    }
}
