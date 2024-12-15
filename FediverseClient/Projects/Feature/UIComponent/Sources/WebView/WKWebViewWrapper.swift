//
//  WKWebViewWrapper.swift
//  UIComponent
//
//  Created by 김수환 on 12/15/24.
//  Copyright © 2024 com.Nazku. All rights reserved.
//

import SwiftUI
import WebKit

public struct WKWebViewWrapper: UIViewRepresentable {
    
    var url: String
    
    public func makeUIView(context: Context) -> WKWebView {
        guard let url = URL(string: url) else {
            return WKWebView()
        }
        let webView = WKWebView()
        
        webView.load(URLRequest(url: url))
        
        return webView
    }
    
    public func updateUIView(_ webView: WKWebView, context: UIViewRepresentableContext<WKWebViewWrapper>) {
        guard let url = URL(string: url) else { return }
        
        webView.load(URLRequest(url: url))
    }
    
    public init(url: String) {
        self.url = url
    }
}
