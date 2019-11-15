//
//  NetworkError.swift
//  Amiibo
//
//  Created by Mike Liao on 2019/11/2.
//  Copyright © 2019 Mike Liao. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case noData
    case cannotReachServer
    case responseError(code: Int, message: String)
    case decodingError
}
