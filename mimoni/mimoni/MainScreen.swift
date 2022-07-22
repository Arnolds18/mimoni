//
//  MainScreen.swift
//  mimoni
//
//  Created by Liko Setiawan on 12/07/22.
//

import Foundation
import SwiftUI

struct MainScreen: View {
    var data : [Int] = Array(1...20)
    let adaptiveColumns = [
        
        GridItem(.adaptive(minimum: 170))
    ]
    //    @State var linkOne: Bool = false
    @State var totalSpend = Segment(title: "Test", value: 30, recommended: false)
    @State var totalCategory = Segment(title: "Test", value: 100, recommended: false)
    @AppStorage("isFirstLaunch") var isFirstLaunch: Bool = true
    @State var isShowOnBoarding: Bool = false
    @Binding var segments : [Segment]
    
    @State private var isModalOpen = false
    
    
    var body: some View {
        
        NavigationView{
            ScrollView{
                VStack(spacing : 20 ){
                    ZStack{
                        RoundedRectangle(cornerRadius:20)
                            .fill(.white)
                            .frame(width: 360, height: 125, alignment: .leading)
                        SisaUangCardView(income: 10000)
                    }
                    ZStack{
                        RoundedRectangle(cornerRadius:20)
                            .fill(.white)
                            .frame(width: 360, height: 80, alignment: .leading)
                        RecommendationCardView()
                    }
                    VStack(){
                        Text("Budget")
                            .font(.system(size: 24)).bold()
                            .foregroundColor(.black)
                        
                    }
                    .frame(width: 345, height: 10, alignment: .leading)
                    
                    LazyVGrid(columns: adaptiveColumns, spacing: 10) {
                        ForEach($segments, id: \.self){ segment in
                            Button(action: {
                                isModalOpen.toggle()
                            }
                            ){
                                ZStack{
                                    CardView(segmentList: segment)
                                }
                                
                            }
                            .sheet(isPresented: $isModalOpen){
                                AddExpenseMainView(random: .constant(true))
                                
                            }
                            .buttonStyle(CustomButtonStyle(isSelected: true))
                        }
                        
                    }
                    .padding()
                    
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
            OnboardingView(isShowOnBoarding: $isShowOnBoarding, segments: $segments)
        }
    }
    
}


struct CustomButtonStyle : ButtonStyle {
    var isSelected: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
        
        
    }
}
    
    struct MainScreen_Previews: PreviewProvider {
        static var previews: some View {
            MainScreen( segments: .constant([Segment]()))
            
        }
    }
