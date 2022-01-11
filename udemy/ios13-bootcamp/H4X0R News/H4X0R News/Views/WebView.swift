//
//  WebView.swift
//  H4X0R News
//
//  Created by Ken Mau on 2022-01-10.
//

import Foundation
import WebKit
import SwiftUI

struct WebView: UIViewRepresentable {
    
    let urlString: String?
    
    // Create
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    // Then update
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let urlString = urlString {
            if let url = URL(string: urlString) {
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
}
