//
//  AuthenticateWindow.swift
//  Application D
//
//  Created by Andrew Cumming on 25/03/2021.
//

import SwiftUI
import WebKit

struct AuthenticateWindow: View {
    
    var id: String
    var string: String
    
    init(id: String) {
        self.id = id
        self.string = "https://www.themoviedb.org/authenticate/\(id)"
        print(self.string)
    }
    
    var body: some View {
        HStack {
            WebView(request: URLRequest(url: URL(string: "https://www.themoviedb.org/authenticate/\(self.id)")!))
        }.navigationTitle(Text("Authenticate"))
    }

}

// MARK: WebView struct

struct WebView: UIViewRepresentable {
    
    let request: URLRequest
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(self.request)
    }
    
}

//struct AuthenticateWindow_Previews: PreviewProvider {
//    static var previews: some View {
//        AuthenticateWindow()
//    }
//}
