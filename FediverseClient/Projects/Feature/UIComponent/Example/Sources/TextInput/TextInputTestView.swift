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
