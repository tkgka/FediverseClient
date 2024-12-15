//
//  InfinityScrollViewModel.swift
//  UIComponent
//
//  Created by 김수환 on 12/15/24.
//  Copyright © 2024 com.Nazku. All rights reserved.
//

import SwiftUI

public final class InfinityScrollViewModel: ObservableObject {
    
    @Published var images: [UIImage]
    @Published var offset: CGFloat = 0
    
    let width: CGFloat
    let height: CGFloat
    let spacing: CGFloat
    let speed: Double
    let isHorizontal: Bool
    lazy var buffer: CGFloat = CGFloat(images.count - 2) * (isHorizontal ? width : height)
    let fromTB: Bool
    let fromLR: Bool
    
    
    public init(
        images: [UIImage],
        offset: CGFloat,
        width: CGFloat,
        height: CGFloat,
        spacing: CGFloat = 5,
        speed: Double,
        isHorizontal: Bool,
        fromTR: Bool,
        fromLR: Bool
    ) {
        self.images = images
        self.offset = offset
        self.width = width
        self.height = height
        self.spacing = spacing
        self.speed = speed
        self.isHorizontal = isHorizontal
        self.fromTB = fromTR
        self.fromLR = fromLR
    }
}
