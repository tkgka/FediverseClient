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
    @State var selectedId: Int?
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                Text("TextInput Example")
                    .font(.title)
                    .bold()
                Capsule()
                    .frame(height: 50)
                    .padding(.horizontal, 32)
                    .foregroundColor(.blue)
                    .padding()
                ForEach(0..<50, id: \.self) { i in
                    Text("Item \(i)")
                        .padding()
                        .id(i)
                        .onTapGesture {
                            isShowing.toggle()
                            selectedId = i
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                                withAnimation {
                                    proxy.scrollTo(i, anchor: .bottom)
                                }
                            }
                        }
                }
            }
            .scrollDismissesKeyboard(.immediately)
            .padding(.horizontal, 8)
            .background(.white)
            .textInput(isShowing: $isShowing, text: $text)
            .onChange(of: text) { oldValue, newValue in
                guard let selectedId else { return }
                withAnimation {
                    proxy.scrollTo(selectedId, anchor: .bottom)
                }
            }
        }
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
                    TextInputView(isShowing: isShowing, text: text)
                }
            }
        }
        .animation(.easeInOut, value: isShowing.wrappedValue)
    }
}


struct TextInputView: View {
    @FocusState var isFocused: Bool
    @Binding var isShowing: Bool
    @Binding var text: String
    
    var body: some View {
        HStack(alignment: .bottom) {
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
            
            if text.count > 0 {
                Button {
                    
                } label: {
                    Circle()
                        .fill(.white)
                        .frame(height: 32)
                        .overlay {
                            Image(systemName: "paperplane")
                                .renderingMode(.template)
                                .resizable()
                                .scaledToFit()
                                .padding(8)
                        }
                        .padding(.leading, 16)
                }
            }
        }
        .padding(16)
        .background {
            Color.black.ignoresSafeArea()
        }
        .onAppear {
            isFocused = true
        }
        .onChange(of: isFocused) { _, newValue in
            guard !newValue else { return }
            //            isShowing = false
        }
        .transition(.scale)
    }
}
