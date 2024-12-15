import SwiftUI
import UIComponent

public struct ContentView: View {
    public init() {}
    
    public var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach(Views.allCases, id: \.self) { viewContent in
                        NavigationLink {
                            viewContent.view
                        } label: {
                            RoundedRectangle(cornerRadius: 16)
                                .fill(.blue)
                                .overlay {
                                    Text(viewContent.rawValue)
                                        .foregroundStyle(.white)
                                }
                                .frame(height: 56)
                                .padding(.horizontal, 16)
                        }
                        .buttonStyle(ShrinkButtonStyle())
                    }
                }
            }
        }
    }
    
    enum Views: String, CaseIterable {
        
        case popUp
        case expendedContent
        case textInput
        case webView
        
        @ViewBuilder
        var view: some View {
            switch self {
            case .popUp:
                PopUpTestView()
            case .expendedContent:
                ExpendedContentTestView()
            case .textInput:
                TextInputTestView()
            case .webView:
                WebViewTestView()
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
