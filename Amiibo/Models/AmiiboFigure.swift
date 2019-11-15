//
//  AmiiboFigure.swift
//  Amiibo
//
//  Created by Mike Liao on 2019/11/2.
//  Copyright © 2019 Mike Liao. All rights reserved.
//

import Foundation

struct AmiiboFigure: Codable {
    let amiiboSeries: String
    let character: String
    let gameSeries: String
    let head: String
    let image: String
    let name: String
    let release: Release
    let tail: String
    let type: String
}
