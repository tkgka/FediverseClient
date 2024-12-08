import SwiftUI
import GameFeature

public struct ContentView: View {
    public init() {}
    
    public var body: some View {
        NavigationView {
            OnboardingView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Image: EnvironmentCompatible {}
