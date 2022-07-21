//
//  CardViewExpenses.swift
//  mimoni
//
//  Created by Liko Setiawan on 20/07/22.
//

import Foundation
import SwiftUI

struct CardViewExpenses: View{
    var body: some View{
        HStack{
            
            ZStack(alignment: .leading){
                
                
                Circle() //circle yang belakang
                    .trim(from: 0, to: 1)
                    .stroke(Color.orange.opacity(0.25), lineWidth: 15)
                    .frame(width: (UIScreen.main.bounds.width - 100) / 3, height: (UIScreen.main.bounds.width - 90) / 3)
                
                
                
                Circle() //circle depan buat tau datanya berapa
                    .trim(from: 0, to: 0.25) //nanti to nya dari batas dari budget yang di set - data total pengeluaran
                    .stroke(Color.orange, lineWidth: 15)
                    .frame(width: (UIScreen.main.bounds.width - 100) / 3, height: (UIScreen.main.bounds.width - 90) / 3)
                    .rotationEffect(.degrees(-90))
                Text("25%")
                    .frame(maxWidth: 100, alignment: .center)
                    .font(.system(size: 15))
                
            }
            .padding()
//            Spacer()
            HStack{
                VStack(spacing :4) {
                    Spacer()
                    Text("Sisa Uang")
                        .font(.system(size: 15))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("RP 400.000,-")
                        .font(.system(size: 22).bold())
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("Pengeluaran: -Rp.0")
                        .font(.system(size: 13))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Spacer()
                    
                    
                }
                .frame(width: 186, height: 100)
                
                
                
            }
            
            
            
            
            
        }
        
        
        
    }
}

struct CardViewExpenses_Previews: PreviewProvider {
    static var previews: some View {
        CardViewExpenses()
            .previewLayout(.fixed(width: 350, height: 150))
    }
}
