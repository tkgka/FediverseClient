import SwiftUI
import UIComponent

public struct ContentView: View {
    public init() {}
    
    @State var selectedTab = ""
    
    public var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                TabView(selection: $selectedTab) {
                    main
                        .toolbar(.hidden, for: .tabBar)
                        .tag("1")
                    Text("!@#")
                        .toolbar(.hidden, for: .tabBar)
                        .tag("2")
                    Text("123")
                        .toolbar(.hidden, for: .tabBar)
                        .tag("3")
                }
                HStack {
                    Spacer()
                    
                    Button {
                        selectedTab = "1"
                    } label: {
                        Image("star")
                            .resizable()
                            .scaledToFit()
                    }
                    
                    Spacer()
                    
                    Button {
                        selectedTab = "2"
                    } label: {
                        Image("stack")
                            .resizable()
                            .scaledToFit()
                    }
                    
                    
                    Spacer()
                    
                    Button {
                        selectedTab = "3"
                    } label: {
                        Image("setting")
                            .resizable()
                            .scaledToFit()
                    }
                    
                    Spacer()
                }
                .padding(.top, 10)
                .frame(height: 50)
                .background(.regularMaterial)
            }
        }
    }
    
    @ViewBuilder
    private var main: some View {
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
    
    enum Views: String, CaseIterable {
        
        case popUp
        case expendedContent
        case textInput
        case webView
        case infinityScroll
        case dynamic
        case interactiveToast
        
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
            case .infinityScroll:
                InfinityScrollTestView()
            case .dynamic:
                DynamicTestView()
            case .interactiveToast:
                InteractiveToastTestView()
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
