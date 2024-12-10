//
//  PopUpTestView.swift
//  UIComponent
//
//  Created by 김수환 on 12/10/24.
//  Copyright © 2024 com.Nazku. All rights reserved.
//

import SwiftUI
import UIComponent

struct PopUpTestView: View {
    
    @State var isPresented: Bool = false
    
    var body: some View {
        Button("Show Pop-Up") {
            isPresented = true
        }
        .popUpSheet(isPresented: $isPresented) {
            VStack {
                HStack {
                    Text("Delete")
                        .font(.title)
                        .bold()
                        .padding(.top, 24)
                    Spacer()
                    Button {
                        isPresented.toggle()
                    } label: {
                        Image(systemName: "xmark")
                    }
                    
                }
                RoundedRectangle(cornerRadius: 24)
                    .fill(.red)
                    .padding(.horizontal, 4)
                    .frame(height: 180)
                
                HStack {
                    Toggle(isOn: $isPresented) {
                        Text("Delete")
                    }
                }
                HStack {
                    Toggle(isOn: $isPresented) {
                        Text("Delete")
                    }
                }
                HStack {
                    Toggle(isOn: $isPresented) {
                        Text("Delete")
                    }
                }
                HStack {
                    Toggle(isOn: $isPresented) {
                        Text("Delete")
                    }
                }
                HStack {
                    Capsule()
                        .fill(.gray)
                        .overlay {
                            Text("No")
                        }
                    Capsule()
                        .fill(.red)
                        .overlay {
                            Text("Yes")
                                .foregroundStyle(.white)
                        }
                }
                .frame(height: 48)
                .padding(.top, 16)
            }
            .padding(.horizontal, 24)
        }
    }
}

#Preview {
    PopUpTestView()
}
