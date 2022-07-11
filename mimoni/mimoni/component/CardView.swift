//
//  CardView.swift
//  mimoni
//
//  Created by Nicky Santano on 11/07/22.
//

import Foundation
import SwiftUI

struct CardView: View{
    
    var body: some View{
        VStack(alignment: .leading){
            HStack{
                
                ZStack(alignment: .leading){
                    Circle() //circle yang belakang
                        .trim(from: 0, to: 1)
                        .stroke(Color.green.opacity(0.05), lineWidth: 10)
                        .frame(width: (UIScreen.main.bounds.width - 150) / 3, height: (UIScreen.main.bounds.width - 150) / 3)
                       
                    
                    Circle() //circle depan buat tau datanya berapa
                        .trim(from: 0, to: 1) //nanti to nya dari data pengeluaran / batas dari budget yang di set
                        .stroke(Color.green, lineWidth: 10)
                        .frame(width: (UIScreen.main.bounds.width - 150) / 3, height: (UIScreen.main.bounds.width - 150) / 3)
                }
                Spacer()
            }
                
            
            Spacer()
            Text("Kebutuhan") //nanti ini title segment
                .font(.title)
                .padding(.top)
            HStack{
                Text("Sisa:")
                Text("Rp25000")
                    .font(.headline)
            }
            .padding(.vertical)
            Spacer()
        }
        .padding(10)
        .background(Color.blue)
        .cornerRadius(20)
        .frame(width: 250, height: 250)
        
    }
    
}

//calculating percentage (nunggu core data ada)
//https://www.youtube.com/watch?v=OixdgS7vyXc (menit 9:25)
func getPercent(){
    
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            CardView()
                .previewLayout(.sizeThatFits)
        }
    }
}
