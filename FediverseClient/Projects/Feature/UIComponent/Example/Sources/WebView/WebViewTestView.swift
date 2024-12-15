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
        ZStack {
            VStack {
                Button {
                    self.isSheetPresented.toggle()
                } label: {
                    Text("WKWebView Sheet로 보여주기")
                        .sheet(isPresented: $isSheetPresented) {
                            WKWebViewWrapper(url: "https://www.naver.com")
                        }
                }
                Button {
                    isFilledPresented.toggle()
                } label: {
                    Text("WKWebView 전체화면으로 보여주기")
                }
            }
            if isFilledPresented {
                WKWebViewWrapper(url: "https://www.naver.com")
                    .transition(.move(edge: .bottom))
            }
        }
        .animation(.easeInOut, value: isFilledPresented)
    }
}

#Preview {
    ContentView()
}
