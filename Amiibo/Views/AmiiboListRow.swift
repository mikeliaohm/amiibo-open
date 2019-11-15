//
//  AmiiboListRow.swift
//  Amiibo
//
//  Created by Mike Liao on 2019/11/3.
//  Copyright © 2019 Mike Liao. All rights reserved.
//

import SwiftUI

struct AmiiboListRow: View {
    let amiiboVM: AmiiboFigureViewModel
    
    var body: some View {
        NavigationLink(destination: AmiiboDetail(amiiboVM: self.amiiboVM)) {
            
            VStack(alignment: .leading) {
                Text(self.amiiboVM.character)
                Text(self.amiiboVM.series)
                Text(self.amiiboVM.game)
            }
            .padding(.leading)
            
        }
    }
}

struct AmiiboListRow_Previews: PreviewProvider {
    static var previews: some View {
        AmiiboListRow(amiiboVM: AmiiboFigureViewModel(amiibo: amiibo1))
            .previewLayout(.sizeThatFits)
    }
}
