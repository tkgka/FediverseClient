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
            self
            if isPresented.wrappedValue {
                Color.black.opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation {
                            isPresented.wrappedValue = false
                        }
                    }
                PopUPSheetView(
                    cornerRadius: cornerRadius,
                    backgroundColor: backgroundColor,
                    isPresented: isPresented,
                    content: content
                )
            }
        }
        .animation(.easeInOut, value: isPresented.wrappedValue)
    }
}


struct PopUPSheetView<PopUPContent: View>: View {
        
    let cornerRadius: CGFloat
    let backgroundColor: Color
    @Binding var isPresented: Bool
    
    @State var offsetX: CGFloat = 0
    @State var offsetY: CGFloat = 0
    @ViewBuilder var content: () -> PopUPContent
    
    var body: some View {
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
        .offset(x: offsetX, y: offsetY)
        .gesture(
            DragGesture()
                .onChanged { value in
                    let offsetXValue = min(max(-8, value.translation.width / 8), 8)
                    let offsetYValue = max(-16, value.translation.height)
                    offsetX = offsetXValue
                    offsetY = offsetYValue
                }
                .onEnded { value in
                    offsetX = 0
                    guard offsetY > 200 else {
                        offsetY = 0
                        return
                    }
                    isPresented = false
                    offsetY = 0
                }
        )
        .animation(.bouncy, value: offsetX)
        .animation(.bouncy, value: offsetY)
        .transition(.move(edge: .bottom))
    }
}
