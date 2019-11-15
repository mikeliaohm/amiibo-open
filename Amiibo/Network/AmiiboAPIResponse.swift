//
//  AmiiboAPIResponse.swift
//  Amiibo
//
//  Created by Mike Liao on 2019/11/3.
//  Copyright © 2019 Mike Liao. All rights reserved.
//

import Foundation

struct AmiiboAPIResponse: Decodable {
    let amiibo: [AmiiboFigure]
}
