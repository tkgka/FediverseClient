//
//  WebViewTestView.swift
//  UIComponent
//
//  Created by 김수환 on 12/15/24.
//  Copyright © 2024 com.Nazku. All rights reserved.
//

import SwiftUI
import UIComponent

struct WebViewTestView: View {
    
    @State var isSheetPresented = false
    @State var isFilledPresented = false
    
    var body: some View {
        VStack {
            Button {
                self.isSheetPresented.toggle()
            } label: {
                Text("WKWebView Sheet로 보여주기")
                    .sheet(isPresented: $isSheetPresented) {
                        WKWebViewWrapper(url: "https://www.naver.com")
                            .ignoresSafeArea(edges: .bottom)
                    }
            }
            Button {
                isFilledPresented.toggle()
            } label: {
                Text("WKWebView 전체화면으로 보여주기")
                    .fullScreenCover(isPresented: $isFilledPresented) {
                        WKWebViewWrapper(url: "https://www.naver.com")
                            .ignoresSafeArea(edges: .bottom)
                            .overlay {
                                VStack {
                                    HStack {
                                        Spacer()
                                        Button {
                                            isFilledPresented.toggle()
                                        } label: {
                                            Image(systemName: "xmark")
                                        }
                                    }
                                    .padding(.horizontal, 16)
                                    Spacer()
                                }
                            }
                    }
            }
        }
    }
}

#Preview {
    ContentView()
}
