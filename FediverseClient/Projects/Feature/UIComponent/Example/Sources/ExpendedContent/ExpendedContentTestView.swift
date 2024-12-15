//
//  ExpendedContentTestView.swift
//  UIComponent
//
//  Created by 김수환 on 12/10/24.
//  Copyright © 2024 com.Nazku. All rights reserved.
//

import SwiftUI

struct ExpendedContentTestView: View {
    @State var isPresented: Bool = false
    
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .padding(.top, 128)
            Spacer()
            Button {
                isPresented.toggle()
            } label: {
                Capsule()
                    .fill(.black)
                    .frame(width: 120, height: 32)
            }
            .expendedContent(isPresented: $isPresented) {
                VStack {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(.gray)
                        .padding(.horizontal, 16)
                    Button {
                        isPresented.toggle()
                    } label: {
                        Capsule()
                            .fill(.gray)
                            .frame(width: 120, height: 32)
                    }
                }
            }
        }
    }
}

#Preview {
    ExpendedContentTestView()
}

extension View {
    public func expendedContent<ExpendedContent: View>(
        isPresented: Binding<Bool>,
        @ViewBuilder content: @escaping () -> ExpendedContent
    ) -> some View {
        ExpendedContentView(
            isShowing: isPresented,
            expendedContent: content,
            originalContent: { self }
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
    
    var body: some View {
        VStack {
            if isShowing {
                expendedContent()
                    .transition(.scale(.zero, anchor: .bottom).combined(with: .blurReplace))
            } else {
                originalContent()
                    .transition(.blurReplace)
            }
        }
        .animation(.easeInOut, value: isShowing)
    }
}
