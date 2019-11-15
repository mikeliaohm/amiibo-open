//
//  AmiiboDetail.swift
//  Amiibo
//
//  Created by Mike Liao on 2019/11/2.
//  Copyright © 2019 Mike Liao. All rights reserved.
//

import SwiftUI

struct AmiiboDetail: View {
    @ObservedObject var amiiboVM: AmiiboFigureViewModel
    
    init(amiiboVM: AmiiboFigureViewModel) {
        self.amiiboVM = amiiboVM
//        self.amiiboVM.loadImage()
    }
    
    var body: some View {
        
        VStack {
            
            HStack {
                VStack {
                    Image(systemName: "gamecontroller")
                        .padding(.bottom, 30)
                    Image(systemName: "info.circle")
                }
                .onAppear {
                    self.amiiboVM.loadImage()
                }
                
                VStack(alignment: .leading) {
                    Text(self.amiiboVM.game)
                        .padding(.bottom, 30)
                    Text(self.amiiboVM.series)
                }
                .padding(.leading)
            }
            .foregroundColor(Color.gray)
            .font(.largeTitle)
            .offset(y: -60)
            
            HStack(alignment: .bottom) {
                self.amiiboVM.image
                    .resizable()
                    .scaledToFit()
                    .frame(height: 250)
                
                Text(self.amiiboVM.character)
                    .fontWeight(.thin)
                    .bold()
                    .font(Font.system(.largeTitle, design: .rounded))
            }
            
            Divider()
                .padding()
            
            HStack {
                
                ReleaseSchedule(country: "au", release: self.amiiboVM.releaseAU)
                ReleaseSchedule(country: "eu", release: self.amiiboVM.releaseEU)
                ReleaseSchedule(country: "jp", release: self.amiiboVM.releaseJP)
                ReleaseSchedule(country: "us", release: self.amiiboVM.releaseNA)
                
            }
            .font(.headline)

        }
    
    }
}

struct AmiiboDetail_Previews: PreviewProvider {
    static var previews: some View {
        AmiiboDetail(amiiboVM: AmiiboFigureViewModel(amiibo: amiibo1))
    }
}

