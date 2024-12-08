//
//  AssetsContents.swift
//  Assets
//
//  Created by 김수환 on 12/8/24.
//  Copyright © 2024 com.Nazku. All rights reserved.
//

import SwiftUI

public struct Asset {
    
    public enum Color {
        
        case red
    }
}

public extension Asset.Color {
    
    var color: SwiftUI.Color {
        
        switch self {
            
        case .red: .red
        }
    }
}
