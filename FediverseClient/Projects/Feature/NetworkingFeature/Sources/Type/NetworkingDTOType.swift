//
//  NetworkingDTOType.swift
//  NetworkingFeature
//
//  Created by 김수환 on 12/2/24.
//  Copyright © 2024 test.tuist. All rights reserved.
//

import Foundation

public protocol NetworkingDTOType: Codable {
    
    associatedtype EntityType: NetworkingEntityType
    func toEntity() -> EntityType
}
