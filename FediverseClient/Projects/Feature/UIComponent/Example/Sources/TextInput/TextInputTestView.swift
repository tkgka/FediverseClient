//
//  TextInputTestView.swift
//  UIComponent
//
//  Created by 김수환 on 12/11/24.
//  Copyright © 2024 com.Nazku. All rights reserved.
//

import SwiftUI

struct TextInputTestView: View {
    
    @State var text: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
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
                .padding(.horizontal, 32)
                .foregroundColor(.blue)
                .overlay {
                    Text(text)
                        .foregroundStyle(.white)
                        .bold()
                    
                }
        }
        .padding(.horizontal, 8)
        .background(.gray)
        .textInput(text: $text)
    }
}

#Preview {
    TextInputTestView()
}

extension View {
    
    public func textInput(text: Binding<String>) -> some View {
        VStack(spacing: 0) {
            ScrollView {
                self
            }
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
        .background(.black)
    }
}
