//
//  AmiiboFigureListViewModel.swift
//  Amiibo
//
//  Created by Mike Liao on 2019/11/3.
//  Copyright © 2019 Mike Liao. All rights reserved.
//

import Foundation
import SwiftUI

final class AmiiboFigureListViewModel: ObservableObject {
    
    @Published var amiibos = [AmiiboFigureViewModel]()
    @Published var showAlert: Bool = false
    
    func fetchAmiibo() {
        
        let apiClient = AmiiboAPIClient()
        apiClient.get { result in
            
            switch result {
            case .success(let responseData):
                DispatchQueue.main.async {
                    self.amiibos = responseData.amiibo.map(AmiiboFigureViewModel.init)
                }
            case .failure(let error):
                print("[AmiiboFigureListViewModel]: \(error)")
                self.showAlert = true
            }
        }
    }
    
}

extension AmiiboFigureListViewModel {
    
    var alert: Alert {
        
        Alert(
            title: Text("Failed to fetch amiibos"),
            message: Text("Server error"),
            dismissButton: .default(Text("OK"), action: { self.showAlert = false })
        )
    }
}
