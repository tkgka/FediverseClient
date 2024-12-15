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
//            .textInput(isShowing: $isShowing, text: $text) {
//            }
            .textInput(isShowing: $isShowing, text: $text, topViewContent: {
                HStack(alignment: .bottom) {
                    Button {
                        isShowing = false
                    } label: {
                        Capsule()
                            .fill(.white)
                            .frame(width: 72, height: 24)
                            .overlay {
                                Text("dismiss")
                                    .padding(.bottom,4)
                                    .foregroundStyle(.black)
                            }
                    }
                    
                    ScrollView(.horizontal) {
                        HStack { // TODO: -
                        }
                    }
                    .scrollIndicators(.hidden)
                    
                }
                .padding(.vertical, 8)
            }, leadingViewContent: {
            }, trailingViewContent: {
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
            })
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
        .onChange(of: isFocused) { _, newValue in
            guard !newValue else { return }
            //            isShowing = false
        }
        .transition(.scale)
    }
}
