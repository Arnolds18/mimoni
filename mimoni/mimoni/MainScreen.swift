//
//  MainScreen.swift
//  mimoni
//
//  Created by Liko Setiawan on 12/07/22.
//

import Foundation
import SwiftUI

struct MainScreen: View {
    private var data : [Int] = Array(1...20)
    private let adaptiveColumns = [
        
        GridItem(.adaptive(minimum: 170))
    ]
    //    @State var linkOne: Bool = false
    @State var totalSpend = Segment(title: "Test", value: 30, recommended: false)
    @State var totalCategory = Segment(title: "Test", value: 100, recommended: false)
    @AppStorage("isFirstLaunch") var isFirstLaunch: Bool = true
    @State var isShowOnBoarding: Bool = false
    
    var check: Bool = false
    var body: some View {
        
        NavigationView{
            ScrollView{
                VStack(spacing : 20 ){
                    if(check){
                        ZStack{
                            RoundedRectangle(cornerRadius:20)
                                .fill(.white)
                                .frame(width: 360, height: 125, alignment: .leading)
                            SisaUangCardView()
                        }
                        ZStack{
                            RoundedRectangle(cornerRadius:20)
                                .fill(.white)
                                .frame(width: 360, height: 80, alignment: .leading)
                            RecommendationCardView()
                        }
                    }
                    VStack(){
                        Text("Budget")
                            .font(.system(size: 24)).bold()
                        
                    }
                    .frame(width: 345, height: 10, alignment: .leading)
                    
                    LazyVGrid(columns: adaptiveColumns, spacing: 10) {
                        ForEach(data, id: \.self){ number in
                            ZStack{
                                CardView(totalSpend: $totalSpend, totalCategory: $totalCategory)
                            }
                            
                        }
                        
                    }
                    .padding()
                    
                    //                    HStack{
                    //                        VStack(spacing: 3){
                    //                            CardView(totalSpend: $totalSpend, totalCategory: $totalCategory)
                    //                            CardView(totalSpend: $totalSpend, totalCategory: $totalCategory)
                    //                        }
                    //                        .frame(width: 180, height: 350)
                    //
                    //
                    //                        VStack(spacing: 3){
                    //                            CardView(totalSpend: $totalSpend, totalCategory: $totalCategory)
                    //                            CardView(totalSpend: $totalSpend, totalCategory: $totalCategory)
                    //
                    //                        }
                    //                        .frame(width: 180, height: 150)
                    //
                    //
                    //                    }
                    //                    .frame(width: 150, height: 360)
                    
                    //                    .frame(width: 100, height: -100)
                }
            }
            .navigationTitle("Summary")
            .background(Color.whiteColor.ignoresSafeArea())
        }
        .onAppear{
            if isFirstLaunch {
                isShowOnBoarding.toggle()
                isFirstLaunch = false
            }
        }
        .fullScreenCover(isPresented: $isShowOnBoarding) {
            OnboardingView(isShowOnBoarding: $isShowOnBoarding)
        }
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
        
    }
}
