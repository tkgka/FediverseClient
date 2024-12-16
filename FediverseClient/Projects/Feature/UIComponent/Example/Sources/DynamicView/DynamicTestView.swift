//
//  DynamicTestView.swift
//  UIComponent
//
//  Created by 김수환 on 12/16/24.
//  Copyright © 2024 com.Nazku. All rights reserved.
//

import SwiftUI
import UIComponent

struct DynamicTestView: View {
    var body: some View {
        DynamicView(
            topView: Rectangle().fill(.red),
            bottomView: Rectangle().fill(.blue)
        )
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    DynamicTestView()
}
