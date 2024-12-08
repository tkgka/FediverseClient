//
//  GameListView.swift
//  GameFeature
//
//  Created by 김수환 on 12/8/24.
//  Copyright © 2024 com.Nazku. All rights reserved.
//

import SwiftUI

public struct GameListView: View {
    
    public init () {}
    
    public var body: some View {
        ScrollView {
            HStack {
                Text("Choose the game you want")
                    .font(.system(size: 32, weight: .bold, design: .rounded))
                Spacer()
            }
        }
        .navigationTitle("Games")
        .padding(.horizontal, 16)
    }
}

#Preview {
    GameListView()
}
