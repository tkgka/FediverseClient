//
//  InteractiveToastTestView.swift
//  UIComponent
//
//  Created by 김수환 on 12/16/24.
//  Copyright © 2024 com.Nazku. All rights reserved.
//

import SwiftUI

struct InteractiveToastTestView: View {
    @State var isExpanded: Bool = false
    var body: some View {
        VStack {
            Spacer()
            InteractiveToastView(isExpanded: $isExpanded)
                .onTapGesture {
                    isExpanded.toggle()
                }
        }
    }
}

#Preview {
    InteractiveToastTestView()
}

struct InteractiveToastView: View {
    
    @Binding var isExpanded: Bool
    
    var body: some View {
        let layout = isExpanded ? AnyLayout(VStackLayout(spacing: 8)) : AnyLayout(ZStackLayout())
        layout {
            ForEach(0...5, id: \.self) { index in
                toastCell()
                    .visualEffect { content, proxy in
                        content
                            .scaleEffect(isExpanded ? 1 : scale(5 - index), anchor: .bottom)
                            .offset(y: isExpanded ? 0 : offsetY(5 - index))
                    }
                    .transition(.asymmetric(insertion: .offset(y: 100), removal: .push(from: .top)))
            }
        }
        .animation(.bouncy, value: isExpanded)
    }
    
    
    @ViewBuilder
    private func toastCell() -> some View {
        Capsule()
            .fill(.white)
            .shadow(radius: 3)
            .frame(height: 50)
            .padding(.horizontal, 16)
    }
    
    nonisolated private func offsetY(_ index: Int) -> CGFloat {
        -min(CGFloat(index) * 15, 30)
    }
    
    nonisolated private func scale(_ index: Int) -> CGFloat {
        1 - min(CGFloat(index) * 0.1, 1)
    }
}
