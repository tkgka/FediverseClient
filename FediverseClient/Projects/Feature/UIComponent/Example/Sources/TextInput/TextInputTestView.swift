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
            RoundedRectangle(cornerRadius: 116)
                .frame(height: 50)
                .padding(.horizontal, 32)
                .foregroundColor(.blue)
                .padding()
            Text("loreum\nloreum\nloreum\nloreum\nloreum\nloreum\nloreum\nloreum\nloreum\nloreum\nloreum\nloreum\nloreum\nloreum\nloreum\nloreum\nloreum\nloreum\nloreum\nloreum\nloreum\nloreum\nloreum\nloreum\nloreum\nloreum")
            RoundedRectangle(cornerRadius: 116)
                .frame(height: 50)
                .padding(.horizontal, 32)
                .foregroundColor(.blue)
                .overlay {
                    Text(text)
                        .foregroundStyle(.white)
                        .bold()
                    
                }
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
            Color.black.ignoresSafeArea(edges: .bottom)
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
                        "free_form",
                        text: text,
                        prompt: Text("Type here..."),
                        axis: .vertical
                    )
                    .lineSpacing(10.0)
                    .padding(16)
                    .foregroundStyle(.white)
                }
            }
        }
    }
}
