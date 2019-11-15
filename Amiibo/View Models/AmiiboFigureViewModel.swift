//
//  AmiiboFigureViewModel.swift
//  Amiibo
//
//  Created by Mike Liao on 2019/11/2.
//  Copyright © 2019 Mike Liao. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

final class AmiiboFigureViewModel: ObservableObject, Identifiable {
    
    let amiibo: AmiiboFigure
    @Published var image: Image = Image(systemName: "xmark.octagon")
    
    init(amiibo: AmiiboFigure) {
        self.amiibo = amiibo
    }
    
    var series: String {
        self.amiibo.amiiboSeries
    }
    
    var character: String {
        self.amiibo.character
    }
    
    var game: String {
        self.amiibo.gameSeries
    }
    
    var imageURL: URL? {
        URL(string: self.amiibo.image)
    }
    
    var releaseAU: Date? {
        if let release = self.amiibo.release.au {
            return self.dateFormatter.date(from: release)
        }
        
        return nil
    }
    
    var releaseEU: Date? {
        if let release = self.amiibo.release.eu {
            return self.dateFormatter.date(from: release)
        }
        return nil
    }
    
    var releaseJP: Date? {
        if let release = self.amiibo.release.jp {
            return self.dateFormatter.date(from: release)
        }
        return nil
    }
    
    var releaseNA: Date? {
        if let release = self.amiibo.release.na {
            return self.dateFormatter.date(from: release)
        }
        return nil
    }
    
    func loadImage() {
        if let imageURL = imageURL {
            RemoteImage.shared.loadImage(url: imageURL) { result in
                switch result {
                case .success(let response):
                    
                    if let uiImage = UIImage(data: response) {
                        
                        DispatchQueue.main.async {
                            self.image = Image(uiImage: uiImage)
                        }
                    }
                    
                case .failure(let error):
                    print(error)
                }
            }
        }
        
    }
    
}

// MARK: date formatter
extension AmiiboFigureViewModel {
    
    private var dateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter
    }
    
}

// MARK: extension Date
extension Date {
    
    func toString(dateFormat format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
