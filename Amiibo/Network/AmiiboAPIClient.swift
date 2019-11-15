//
//  AmiiboAPIClient.swift
//  Amiibo
//
//  Created by Mike Liao on 2019/11/3.
//  Copyright © 2019 Mike Liao. All rights reserved.
//

import Foundation

final class AmiiboAPIClient {
    private let baseURL = URL(string: "https://www.amiiboapi.com/api/amiibo/")!
    public static var shared = AmiiboAPIClient()
}

// MARK: implement get method
extension AmiiboAPIClient {
    
    public func get(completion: @escaping (Result<AmiiboAPIResponse, NetworkError>) -> Void) {
        
        let task = URLSession.shared.dataTask(with: self.baseURL) { data, response, error in
            
            guard let response = response as? HTTPURLResponse else {
                completion(.failure(.cannotReachServer))
                return
            }
            
            if !(200...299).contains(response.statusCode) {
                completion(.failure(.responseError(code: response.statusCode, message: "server returns error code")))
                return
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let responseData = try JSONDecoder().decode(AmiiboAPIResponse.self, from: data)
                completion(.success(responseData))
            } catch {
                completion(.failure(.decodingError))
            }
            
        }
        
        task.resume()
    }
}
