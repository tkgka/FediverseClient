import SwiftUI
import UIComponent

public struct ContentView: View {
    public init() {}
    
    public var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    Button {
                        
                    } label: {
                        RoundedRectangle(cornerRadius: 16)
                            .fill(.blue)
                            .overlay {
                                Text("Button")
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
