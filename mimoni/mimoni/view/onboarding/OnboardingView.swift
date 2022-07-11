//
//  OnboardingView.swift
//  mimoni
//
//  Created by Nicky Santano on 21/06/22.
//

import Foundation
import SwiftUI

struct OnboardingView: View {
    @AppStorage("isOnboarding") var isOnboarding: Bool?
    @EnvironmentObject var viewlaunch: ViewLaunch
    var body: some View {
        VStack {
            
            Spacer()
                Text("Welcome To ")
                    .font(.system(size: 40))
                    .frame(width: 300, alignment: .center)
            
            Text("Moneh")
                .fontWeight(.heavy)
                .font(.system(size: 50))
                .frame(width: 300, alignment: .center)
            
            Spacer()
                
                VStack(alignment: .leading) {
                    NewDetail(image: "onboarding-1", imageColor: .pink, title: "YOUR BUDGETS SEEN BETTER", description: "Input budgets in different categories to see your expenses tracking.")
                    NewDetail(image: "onboarding-2", imageColor: .red, title: "DAILY BUDGET LIMIT", description: "Know the ideal maximum budget for you to spend daily, with notification.")
                    NewDetail(image: "onboarding-3", imageColor: .blue, title: "TRACK EXPENSES EASILY", description: "Add widget to your home screen to input expenses data easier.")
            }

            Spacer()
            
            Button(action: {
                isOnboarding = false
                UserDefaults.standard.set(true, forKey: "LaunchBefore")
//                withAnimation(){
//                    self.viewlaunch.currentPage = "ContentView"
//                }
            }){
            Text("Next")
                .foregroundColor(.white)
                .font(.headline)
                .frame(width: 350, height: 60)
                .background(Color.blue)
                .cornerRadius(15)
                .padding(.top, 50)
            }
        }
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
                    .frame(width: 50)
                    .foregroundColor(imageColor)
                    .padding()

                VStack(alignment: .leading) {
                    Text(title).bold()
                
                    Text(description)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }.frame(width: 340, height: 100)
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}

struct NewDetail_Previews: PreviewProvider {
    static var previews: some View {
        NewDetail(image: "heart.fill", imageColor: .pink, title: "More Personalized", description: "Top Stories picked for you and recommendations from siri.")
        .previewLayout(.sizeThatFits)
        .padding(10)
    }
}

