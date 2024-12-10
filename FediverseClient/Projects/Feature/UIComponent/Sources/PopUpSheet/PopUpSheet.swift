//
//  PopUpSheet.swift
//  UIComponent
//
//  Created by 김수환 on 12/10/24.
//  Copyright © 2024 com.Nazku. All rights reserved.
//

import SwiftUI

extension View {
    public func popUpSheet<PopupContent: View>(
        isPresented: Binding<Bool>,
        cornerRadius: CGFloat = 32,
        backgroundColor: Color = .white,
        @ViewBuilder content: @escaping () -> PopupContent
    ) -> some View {
        ZStack {
            self // The original view
            
            if isPresented.wrappedValue {
                Color.black.opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation {
                            isPresented.wrappedValue = false
                        }
                    }
                VStack {
                    Spacer()
                    content()
                        .frame(maxWidth: .infinity)
                        .padding(.bottom, 32)
                        .background {
                            RoundedRectangle(cornerRadius: cornerRadius)
                                .fill(backgroundColor)
                        }
                        .padding(.horizontal, 16)
                }
                .transition(.move(edge: .bottom)) // Ensures sliding in/out
            }
        }
        .animation(.easeInOut, value: isPresented.wrappedValue) // Animate changes to isPresented
    }
}
