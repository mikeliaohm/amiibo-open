//
//  RemoteImage.swift
//  Amiibo
//
//  Created by Mike Liao on 2019/11/2.
//  Copyright © 2019 Mike Liao. All rights reserved.
//

import Foundation

final class RemoteImage {
    
    static var shared = RemoteImage()
 
    func loadImage(url: URL, completion: @escaping (Result<Data, NetworkError>) -> Void) {
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            print("[RemoteImage]: Loading images...")
            
            completion(.success(data))
        }
        
        task.resume()
    }
    
}
