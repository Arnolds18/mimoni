//
//  SisaUangCardView.swift
//  mimoni
//
//  Created by Liko Setiawan on 14/07/22.
//

import Foundation
import SwiftUI

struct SisaUangCardView: View{
    var body: some View{
        
        ZStack(alignment: .leading){
            
            Image("main screen-sisa uang")
                .resizable()
                .frame(width: 125, height: 125, alignment: .leading)
                .aspectRatio(contentMode: .fill)
//                .position(x: 40, y: 60)
            HStack{
                
                Spacer()
                VStack(spacing :2) {
                    Spacer()
                    Text("Sisa Uang")
                        .font(.system(size: 15))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("RP 2.000.000,-")
                        .font(.system(size: 22))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("Anda telah menyimpan uang Rp.100.600.00 pada bulan Juni!")
                        .font(.system(size: 7))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Spacer()
                    
                    
                }
                .frame(width: 256, height: 100)
                
                
                
            }
            
        }
        .frame(width: 380, height: 100)
        
    }
}

struct SisaUangCardView_Previews: PreviewProvider {
    static var previews: some View {
        SisaUangCardView()
//            .previewLayout(.fixed(width: 360, height: 125))
//            .previewInterfaceOrientation(.landscapeRight)
    }
}