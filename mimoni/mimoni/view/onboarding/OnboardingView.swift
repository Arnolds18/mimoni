//
//  OnboardingView.swift
//  mimoni
//
//  Created by Nicky Santano on 21/06/22.
//

import Foundation
import SwiftUI

struct OnboardingView: View {
    @Binding var isShowOnBoarding: Bool
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.whiteColor.ignoresSafeArea()
                VStack {
                    Image("onboardingAppIcon")
                        .resizable()
                        .scaledToFit()
                    
                    Spacer()
                    Text("Selamat datang di")
                        .font(.system(size: 32))
                        .frame(width: 300, alignment: .center)
                    
                    Text("Moneh")
                        .fontWeight(.heavy)
                        .font(.system(size: 31))
                        .frame(width: 300, alignment: .center)
                        .padding(.bottom,10)
                    
                    Spacer()
                    
                    VStack(alignment: .leading) {
                        NewDetail(image: "onboarding-1", imageColor: .pink, title: "ANGGARAN, LEBIH BAIK.", description: "Masukin anggaran kamu ke kategori yang beda, buat tracking pengeluaran!")
                        NewDetail(image: "onboarding-2", imageColor: .red, title: "BATAS PENGELUARAN", description: "Dapet notifikasi untuk budget maximum harian kamu.")
                        NewDetail(image: "onboarding-3", imageColor: .blue, title: "LACAK DENGAN MUDAH", description: "Tambah widget ke home screen kamu, mempermudah masukin expenses.")
                    }
                    
                    Spacer()
                    
                    NavigationLink(destination: InputIncome( isShowOnBoarding: $isShowOnBoarding)){
                        HStack{
                            Text("Continue")
                                .fontWeight(.semibold)

                        }
                        .font(.headline)
                        .frame(width: 340, height: 50)
                        .foregroundColor(.blackColor)
                        .background(Color.interactiveColor)
                        .cornerRadius(15)
                        .padding()
                    }
                }
            }
//            .background(Color.blue.edgesIgnoringSafeArea(.all))
        }
        .navigationBarHidden(true)
        .accentColor(Color.interactiveColor)
    }
    
}

struct NewDetail: View {
    var image: String
    var imageColor: Color
    var title: String
    var description: String
    
    var body: some View {
        HStack(alignment: .center) {
            HStack {
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 75)
                    .foregroundColor(imageColor)
                    .padding()
                
                VStack(alignment: .leading) {
                    Text(title).bold()
                    
                    Text(description)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }.frame(width: 340, height: 100)
        }.padding(.bottom,10)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(isShowOnBoarding: .constant(true))
    }
}

struct NewDetail_Previews: PreviewProvider {
    static var previews: some View {
        NewDetail(image: "heart.fill", imageColor: .pink, title: "More Personalized", description: "Top Stories picked for you and recommendations from siri.")
            .previewLayout(.sizeThatFits)
            .padding(10)
    }
}

