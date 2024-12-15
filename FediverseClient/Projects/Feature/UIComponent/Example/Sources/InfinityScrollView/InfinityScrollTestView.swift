//
//  InfinityScrollTestView.swift
//  UIComponent
//
//  Created by 김수환 on 12/15/24.
//  Copyright © 2024 com.Nazku. All rights reserved.
//

import SwiftUI
import UIComponent

struct InfinityScrollTestView: View {
    var body: some View {
        HStack(spacing: 5) {
            InfinityScrollView(
                model: .init(
                    images: [
                        .checkmark,
                        .add,
                        .checkmark,
                        .add,
                        .checkmark,
                        .add,
                        .checkmark,
                        .add,
                        .checkmark,
                        .add,
                        .checkmark,
                        .add,
                        .checkmark,
                        .add,
                        .checkmark,
                        .add,
                        .checkmark,
                        .add,
                        .checkmark,
                        .add,
                        .checkmark,
                        .add,
                        .checkmark,
                        .add
                    ],
                    offset: 0,
                    width: 120,
                    height: 170,
                    speed: 0.02,
                    isHorizontal: false,
                    fromTR: false,
                    fromLR: true
                )
            )
            InfinityScrollView(
                model: .init(
                    images: [
                        .checkmark,
                        .add,
                        .checkmark,
                        .add,
                        .checkmark,
                        .add,
                        .checkmark,
                        .add,
                        .checkmark,
                        .add,
                        .checkmark,
                        .add,
                        .checkmark,
                        .add,
                        .checkmark,
                        .add,
                        .checkmark,
                        .add,
                        .checkmark,
                        .add,
                        .checkmark,
                        .add,
                        .checkmark,
                        .add
                    ],
                    offset: 0,
                    width: 120,
                    height: 170,
                    speed: 0.02,
                    isHorizontal: false,
                    fromTR: true,
                    fromLR: true
                )
            )
            InfinityScrollView(
                model: .init(
                    images: [
                        .checkmark,
                        .add,
                        .checkmark,
                        .add,
                        .checkmark,
                        .add,
                        .checkmark,
                        .add,
                        .checkmark,
                        .add,
                        .checkmark,
                        .add,
                        .checkmark,
                        .add,
                        .checkmark,
                        .add,
                        .checkmark,
                        .add,
                        .checkmark,
                        .add,
                        .checkmark,
                        .add,
                        .checkmark,
                        .add
                    ],
                    offset: 0,
                    width: 120,
                    height: 170,
                    speed: 0.02,
                    isHorizontal: false,
                    fromTR: false,
                    fromLR: true
                )
            )
            InfinityScrollView(
                model: .init(
                    images: [
                        .checkmark,
                        .add,
                        .checkmark,
                        .add,
                        .checkmark,
                        .add,
                        .checkmark,
                        .add,
                        .checkmark,
                        .add,
                        .checkmark,
                        .add,
                        .checkmark,
                        .add,
                        .checkmark,
                        .add,
                        .checkmark,
                        .add,
                        .checkmark,
                        .add,
                        .checkmark,
                        .add,
                        .checkmark,
                        .add
                    ],
                    offset: 0,
                    width: 120,
                    height: 170,
                    speed: 0.02,
                    isHorizontal: false,
                    fromTR: true,
                    fromLR: true
                )
            )
            InfinityScrollView(
                model: .init(
                    images: [
                        .checkmark,
                        .add,
                        .checkmark,
                        .add,
                        .checkmark,
                        .add,
                        .checkmark,
                        .add,
                        .checkmark,
                        .add,
                        .checkmark,
                        .add,
                        .checkmark,
                        .add,
                        .checkmark,
                        .add,
                        .checkmark,
                        .add,
                        .checkmark,
                        .add,
                        .checkmark,
                        .add,
                        .checkmark,
                        .add
                    ],
                    offset: 0,
                    width: 120,
                    height: 170,
                    speed: 0.02,
                    isHorizontal: false,
                    fromTR: false,
                    fromLR: true
                )
            )
        }
        .rotationEffect(.degrees(15))
        .ignoresSafeArea()
        .scaleEffect(1.3)
    }
}

#Preview {
    InfinityScrollTestView()
}
