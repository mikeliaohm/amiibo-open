//
//  AmiiboList.swift
//  Amiibo
//
//  Created by Mike Liao on 2019/11/3.
//  Copyright © 2019 Mike Liao. All rights reserved.
//

import SwiftUI

struct AmiiboList: View {
    @ObservedObject var amiiboListVM = AmiiboFigureListViewModel()
    
    init() {
        self.amiiboListVM.fetchAmiibo()
    }
    
    var body: some View {
        NavigationView {
            
            List(self.amiiboListVM.amiibos) { amiiboVM in
            
                AmiiboListRow(amiiboVM: amiiboVM)
            }
            .alert(isPresented: self.$amiiboListVM.showAlert) {
                self.amiiboListVM.alert
            }
            .navigationBarTitle("AmiiboList", displayMode: .inline)
            .navigationBarItems(leading:
                Button(
                    action: { self.amiiboListVM.fetchAmiibo()
                        
                }) {
                    Image(systemName: "arrow.clockwise.icloud")
                }
            )
        }
    }
}

struct AmiiboList_Previews: PreviewProvider {
    static var previews: some View {
        AmiiboList()
    }
}
