//
//  CardView.swift
//  mimoni
//
//  Created by Nicky Santano on 11/07/22.
//

import Foundation
import SwiftUI
import Charts

struct CardView: View{
    @Binding var totalSpend: Segment
    @Binding var totalCategory: Segment
    
    var body: some View{
        VStack(alignment: .leading, spacing: 5){
            HStack{
                
                ZStack(alignment: .leading){
                    Circle() //circle yang belakang
                        .trim(from: 0, to: 1)
                        .stroke(Color.green.opacity(0.25), lineWidth: 10)
                        .frame(width: (UIScreen.main.bounds.width - 150) / 4, height: (UIScreen.main.bounds.width - 220) / 3)
                    
                    
                    
                    Circle() //circle depan buat tau datanya berapa
                        .trim(from: 0, to: 0.3) //nanti to nya dari batas dari budget yang di set - data total pengeluaran
                        .stroke(Color.green, lineWidth: 10)
                        .frame(width: (UIScreen.main.bounds.width - 150) / 4, height: (UIScreen.main.bounds.width - 220) / 3)
                }
                .padding(.top)
//                .frame(width: 70, height: 90)
                Spacer()
            }
            
            
//                        Spacer()
            Text("Kebutuhan") //nanti ini title segment
                .font(.system(size: 16)).bold()
                .padding(.top)
//                .frame(width: 100, height: 50)
            
            HStack{
                Text("Sisa:")
                    .font(.system(size: 12))
//                    .padding(.top)
                Text("Rp 25.000")
                    .font(.system(size: 13)).bold()
//                    .padding(.top)
            }
//                        .padding(.vertical)
            //            Spacer()
        }
        .padding(15)
        .background(Color.gray.opacity(0.5))
        .cornerRadius(20)
        .frame(width: 165, height: 190)
        
    }
    
}

//calculating percentage (nunggu core data ada)
//https://www.youtube.com/watch?v=OixdgS7vyXc (menit 9:25)
func getPercent(){
    
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            CardView(totalSpend: .constant(Segment(title: "Test", value: 30, recommended: false)), totalCategory: .constant(Segment(title: "Test", value: 100, recommended: false)))
                .previewLayout(.sizeThatFits)
        }
    }
}
