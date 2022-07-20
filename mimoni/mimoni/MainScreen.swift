//
//  MainScreen.swift
//  mimoni
//
//  Created by Liko Setiawan on 12/07/22.
//

import Foundation
import SwiftUI

struct MainScreen: View {
        @State var totalSpend = Segment(title: "Test", value: 30, recommended: false)
        @State var totalCategory = Segment(title: "Test", value: 100, recommended: false)
    
    
    var body: some View {
        
        NavigationView{
            
            VStack(spacing : 20 ){
                ZStack{
                    RoundedRectangle(cornerRadius:20)
                        .fill(.white)
                        .frame(width: 360, height: 125, alignment: .leading)
                        .shadow(color: .gray, radius: 2, x: 0, y: 0)
                    SisaUangCardView()
                }
                ZStack{
                    RoundedRectangle(cornerRadius:20)
                        .fill(.white)
                        .frame(width: 360, height: 80, alignment: .leading)
                        .shadow(color: .gray, radius: 1, x: 0, y: 0)
                    RecommendationCardView()
                }
                VStack(){
                    Text("Budget")
                        .font(.system(size: 24)).bold()
                    
                }
                .frame(width: 345, height: 10, alignment: .leading)
                
                HStack{
                    VStack(spacing: -10){
                        CardView(totalSpend: $totalSpend, totalCategory: $totalCategory)
                        CardView(totalSpend: $totalSpend, totalCategory: $totalCategory)
                    }
                    .frame(width: 180, height: 350)
                    
                    
                    VStack(spacing: -10){
                        CardView(totalSpend: $totalSpend, totalCategory: $totalCategory)
                        CardView(totalSpend: $totalSpend, totalCategory: $totalCategory)
                    }
                    .frame(width: 180, height: 150)
                    
                    
                }
                    .frame(width: 150, height: 360)
                
                
                //                Spacer()
                //                    .frame(width: 100, height: -100)
            }
            .navigationTitle("Summary")
            
            
        }
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
