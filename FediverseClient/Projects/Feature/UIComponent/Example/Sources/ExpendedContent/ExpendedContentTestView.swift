//
//  ExpendedContentTestView.swift
//  UIComponent
//
//  Created by 김수환 on 12/10/24.
//  Copyright © 2024 com.Nazku. All rights reserved.
//

import SwiftUI

struct ExpendedContentTestView: View {
    @State var isPresented1: Bool = false
    @State var isPresented2: Bool = false
    
    var body: some View {
        VStack {
            Button {
                isPresented1.toggle()
            } label: {
                Capsule()
                    .fill(.black)
                    .frame(width: 120, height: 32)
            }
            .expendedContent(isPresented: $isPresented1, anchor: .top) {
                VStack {
                    Button {
                        isPresented1.toggle()
                    } label: {
                        Capsule()
                            .fill(.gray)
                            .frame(width: 120, height: 32)
                    }
                    RoundedRectangle(cornerRadius: 16)
                        .fill(.gray)
                        .padding(.horizontal, 16)
                }
            }
            
            Spacer()
            
            Button {
                isPresented2.toggle()
            } label: {
                Capsule()
                    .fill(.black)
                    .frame(width: 120, height: 32)
            }
            .expendedContent(isPresented: $isPresented2, anchor: .bottom) {
                VStack {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(.gray)
                        .padding(.horizontal, 16)
                    Button {
                        isPresented2.toggle()
                    } label: {
                        Capsule()
                            .fill(.gray)
                            .frame(width: 120, height: 32)
                    }
                }
            }
        }
    }
}

#Preview {
    ExpendedContentTestView()
}
