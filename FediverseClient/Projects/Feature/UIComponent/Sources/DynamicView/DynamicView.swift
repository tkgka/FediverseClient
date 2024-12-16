//
//  DynamicView.swift
//  UIComponent
//
//  Created by 김수환 on 12/16/24.
//  Copyright © 2024 com.Nazku. All rights reserved.
//

import SwiftUI

public struct DynamicView<TopView: View, BottomView: View>: View {
    
    var topView: TopView
    var bottomView: BottomView
    
    @State var draggedValue: CGFloat = 0
    
    public init(topView: TopView, bottomView: BottomView) {
        self.topView = topView
        self.bottomView = bottomView
        self.draggedValue = draggedValue
    }
    
    public var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                topView
                    .frame(height: geometry.size.height/2 + draggedValue + 16)
                    .offset(y: 16)
                Rectangle()
                    .fill(.clear)
                    .frame(height: 6)
                    .overlay(content: {
                        Capsule()
                            .frame(width: 40, height: 6)
                    })
                    .offset(y: -16)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                draggedValue += value.translation.height
                            }
                            .onEnded { value in
                                if abs(draggedValue) > geometry.size.height/3 {
                                    withAnimation {
                                        if draggedValue > 0 {
                                            draggedValue = geometry.size.height/2 - 40
                                        } else {
                                            draggedValue = -geometry.size.height/2
                                        }
                                    }
                                }
                            }
                    )
                bottomView
                    .frame(height: geometry.size.height/2 - draggedValue)
            }
            .offset(y: -16)
            .ignoresSafeArea(edges: .bottom)
        }
    }
}
