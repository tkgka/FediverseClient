//
//  InfinityScrollView.swift
//  UIComponent
//
//  Created by 김수환 on 12/15/24.
//  Copyright © 2024 com.Nazku. All rights reserved.
//

import SwiftUI

public struct InfinityScrollView: View {
    
    @ObservedObject var model: InfinityScrollViewModel
    
    public init(model: InfinityScrollViewModel) {
        self.model = model
    }
    
    public var body: some View {
        GeometryReader { geometry in
            carouselContents(proxy: geometry)
                .onAppear {
                    startTimer()
                }
        }
        .frame(
            width: model.isHorizontal ? nil : model.width,
            height: model.isHorizontal ? model.height : nil
        )
    }
    
    @ViewBuilder
    private func carouselContents(proxy: GeometryProxy) -> some View {
        Group {
            if model.isHorizontal {
                HStack(spacing: model.spacing) {
                    carouselContent(proxy: proxy)
                }
                .offset(x: model.offset)
            } else {
                VStack(spacing: model.spacing) {
                    carouselContent(proxy: proxy)
                }
                .offset(y: model.offset)
            }
        }
    }
    
    @ViewBuilder
    private func carouselContent(proxy: GeometryProxy) -> some View {
        ForEach(model.images, id: \.self) { logoImage in
            GeometryReader { geometry in
                Image(uiImage: logoImage)
                    .resizable().scaledToFill()
                    .onChange(of: model.isHorizontal
                              ? geometry.frame(in: .global).midX
                              : geometry.frame(in: .global).midY
                    ) { oldValue, newValue in
                        handleArrangement(newValue: newValue, geometry: geometry)
                    }
            }
            .frame(width: model.width, height: model.height)
            .clipShape(.rect(cornerRadius: 8))
        }
    }
    
    private func handleArrangement(newValue: CGFloat, geometry: GeometryProxy) {
        let thereshold = model.isHorizontal
        ? geometry.size.width
        : geometry.size.height
        
        let itemSize = model.isHorizontal
        ? model.width
        : model.height
        
        if model.isHorizontal {
            if (
                model.fromLR && newValue >= thereshold + model.buffer
                || !model.fromLR && newValue <= itemSize - model.buffer
            ) {
                rearrangeItem(isMovingForward: model.fromLR, isHorizontal: true)
            }
        } else {
            if (
                model.fromTB && newValue >= thereshold + model.buffer
                || !model.fromTB && newValue <= itemSize - model.buffer
            ) {
                rearrangeItem(isMovingForward: model.fromTB, isHorizontal: false)
            }
        }
    }
    
    private func rearrangeItem(isMovingForward: Bool, isHorizontal: Bool) {
        if isMovingForward {
            let item = model.images.removeLast()
            model.images.insert(item, at: 0)
            model.offset -= (isHorizontal ? model.width : model.height) + model.spacing
        } else {
            let item = model.images.removeFirst()
            model.images.append(item)
            model.offset += (isHorizontal ? model.width : model.height) + model.spacing
        }
    }
    
    private func startTimer() {
        Timer.scheduledTimer(withTimeInterval: model.speed, repeats: true) { _ in
            model.offset += model.isHorizontal
            ? (model.fromLR ? 1 : -1)
            : (model.fromTB ? 1 : -1)
        }
    }
}
