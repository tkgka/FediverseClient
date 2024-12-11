//
//  TextInputTestView.swift
//  UIComponent
//
//  Created by 김수환 on 12/11/24.
//  Copyright © 2024 com.Nazku. All rights reserved.
//

import SwiftUI

struct TextInputTestView: View {
    
    @State var isShowing: Bool = false
    @State var text: String = ""
    
    var body: some View {
        ScrollView {
            Text("TextInput Example")
                .font(.title)
                .bold()
            Capsule()
                .frame(height: 50)
                .padding(.horizontal, 32)
                .foregroundColor(.blue)
                .padding()
            Text("loreum\nloreum\nloreum\nloreum\nloreum\nloreum\nloreum\nloreum\nloreum\nloreum\nloreum\nloreum\nloreum\nloreum\nloreum\nloreum\nloreum\nloreum\nloreum\nloreum\nloreum\nloreum\nloreum\nloreum\nloreum\nloreum")
            Capsule()
                .frame(height: 50)
                .padding(.horizontal, 32)
                .foregroundColor(.blue)
                .overlay {
                    Text(text)
                        .foregroundStyle(.white)
                        .bold()
                    
                }
                .padding(.bottom, 16)
                .onTapGesture {
                    isShowing.toggle()
                }
        }
        .padding(.horizontal, 8)
        .background(.white)
        .textInput(isShowing: $isShowing, text: $text)
    }
}

#Preview {
    TextInputTestView()
}

extension View {
    
    public func textInput(isShowing: Binding<Bool>, text: Binding<String>) -> some View {
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
                    TextField(
                        "",
                        text: text,
                        prompt: Text("Type here...")
                            .foregroundStyle(.white),
                        axis: .vertical
                    )
                    .lineSpacing(10.0)
                    .padding(16)
                    .foregroundStyle(.white)
                    .background {
                        Color.black.ignoresSafeArea()
                    }
                }
            }
        }
    }
}
