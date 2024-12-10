//
//  ExpendedContentTestView.swift
//  UIComponent
//
//  Created by 김수환 on 12/10/24.
//  Copyright © 2024 com.Nazku. All rights reserved.
//

import SwiftUI

struct ExpendedContentTestView: View {
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .expendedContent() {
                    Text("12\n43\n12\n43\n12\n43\n12\n43\n12\n43\n12\n43\n")
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding(.top, 128)
            Spacer()
            Text("!@3")
        }
    }
}

#Preview {
    ExpendedContentTestView()
}


struct ExpendedContentView<Content: View, BackgroundContent: View>: View {
    @State private var isExpanded: Bool = false // State property to manage expansion
    let backgroundContent: BackgroundContent
    let content: Content
    
    init(
        @ViewBuilder backgroundContent: @escaping () -> BackgroundContent,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.backgroundContent = backgroundContent()
        self.content = content()
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            backgroundContent
                .onLongPressGesture {
                    withAnimation {
                        isExpanded.toggle() // Toggle the state when tapped
                    }
                }
            if isExpanded {
                content
                    .background(
                        RoundedRectangle(cornerRadius: 32)
                            .fill(.white)
                    )
            }
        }
    }
}

extension View {
    public func expendedContent<ExpendedContent: View>(
        @ViewBuilder content: @escaping () -> ExpendedContent
    ) -> some View {
        ExpendedContentView(
            backgroundContent: {
                self
            }, content: {
                content()
            }
        )
    }
}
