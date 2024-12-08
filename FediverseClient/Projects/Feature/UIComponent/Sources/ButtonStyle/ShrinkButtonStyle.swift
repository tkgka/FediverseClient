//
//  ShrinkButtonStyle.swift
//  UIComponent
//
//  Created by 김수환 on 12/8/24.
//  Copyright © 2024 com.Nazku. All rights reserved.
//

import SwiftUI

public struct ShrinkButtonStyle: ButtonStyle {
    
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.9 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
    
    public init() {}
}
