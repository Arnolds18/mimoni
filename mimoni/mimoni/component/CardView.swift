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
    @Binding var segmentList: Segment
    
    var body: some View{
        VStack(alignment: .leading, spacing: 5){
            HStack{
                
                ZStack(alignment: .leading){
                    Circle() //circle yang belakang
                        .trim(from: 0, to: 1)
                        .stroke(Color.yellow.opacity(0.25), lineWidth: 10)
                        .frame(width: (UIScreen.main.bounds.width - 150) / 4, height: (UIScreen.main.bounds.width - 220) / 3)
                    
                    
                    
                    Circle() //circle depan buat tau datanya berapa
                        .trim(from: 0, to: 0.3) //nanti to nya dari batas dari budget yang di set - data total pengeluaran
                        .stroke(Color.yellow, lineWidth: 10)
                        .frame(width: (UIScreen.main.bounds.width - 150) / 4, height: (UIScreen.main.bounds.width - 220) / 3)
                }
                .padding(.top)
//                .frame(width: 70, height: 90)
                Spacer()
            }
            
            
//                        Spacer()
            Text(segmentList.title) //nanti ini title segment
                .font(.system(size: 16)).bold()
                .padding(.top)
//                .frame(width: 100, height: 50)
            
            HStack{
                Text("Sisa:")
                    .font(.system(size: 12))
                    .foregroundColor(.black)
//                    .padding(.top)
                Text("Rp \(segmentList.value)")
                    .font(.system(size: 13)).bold()
                    .foregroundColor(.black)
//                    .padding(.top)
            }
//                        .padding(.vertical)
            //            Spacer()
        }
        .padding(15)
        .background(Color.white)
        .cornerRadius(20)
        .frame(width: 165, height: 170)
        
    }
    
}

//calculating percentage (nunggu core data ada)
//https://www.youtube.com/watch?v=OixdgS7vyXc (menit 9:25)
func getPercent(){
    
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            CardView(segmentList: .constant(Segment(title: "Test", value: 30, recommended: false)))
                .previewLayout(.sizeThatFits)
        }
    }
}
