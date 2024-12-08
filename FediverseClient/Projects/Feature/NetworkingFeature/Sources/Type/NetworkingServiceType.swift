//
//  NetworkingServiceType.swift
//  NetworkingFeature
//
//  Created by 김수환 on 12/2/24.
//  Copyright © 2024 test.tuist. All rights reserved.
//

import Foundation

public protocol NetworkingServiceType {
    
    func request<T: NetworkingDTOType>(api: NetworkingAPIType, dtoType: T.Type) async -> T.EntityType?
    func request(api: NetworkingAPIType) async -> Data?
}
