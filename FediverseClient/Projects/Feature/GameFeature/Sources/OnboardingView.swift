//
//  OnboardingView.swift
//  GameFeature
//
//  Created by 김수환 on 12/8/24.
//  Copyright © 2024 com.Nazku. All rights reserved.
//

import SwiftUI
import UIComponent
import Assets

public struct OnboardingView: View {
    
    public init () {}
    
    public var body: some View {
        ScrollView {
            VStack {
                Text("Unlock all your\ngaming potentials")
                    .multilineTextAlignment(.center)
                    .font(.system(
                        size: 24,
                        weight: .bold,
                        design: .rounded
                    ))
                
                Text("lorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsum")
                    .multilineTextAlignment(.center)
                    .font(.system(
                        size: 16,
                        weight: .medium,
                        design: .rounded
                    ))
                    .padding(.top, 32)
            }
        }
        .padding(.horizontal, 16)
        .overlay {
            VStack {
                Spacer()
                Button {
                    
                } label: {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Asset.Color.red.color)
                }
                .frame(height: 56)
                .buttonStyle(ShrinkButtonStyle())
            }
        }
    }
}

#Preview {
    OnboardingView()
}
