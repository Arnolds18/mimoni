//
//  EmptyState.swift
//  mimoni
//
//  Created by Arnold Sidiprasetija on 22/07/22.
//

import SwiftUI

struct EmptyState: View {
    @State private var showInputIncome = false
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(spacing : 20 ){
                    VStack(){
                        HStack{
                            Text("Budgets")
                                .font(.system(size: 22)).bold()
                            Spacer()
                            Button {
                                self.showInputIncome.toggle()
                            } label: {
                                Image(systemName: "plus.circle.fill").resizable()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(Color.interactiveColor)
                            }
                        }
                        .padding()
                        
                    }
                    .frame(width: 385, height: 80, alignment: .leading)
                    
                    Image("EmptyState").resizable()
                        .scaledToFit()
                        .frame(width: 400, height: 190, alignment: .center)
                    Spacer()
                    VStack(){
                        Text("Oops, belum ada data!")
                            .font(.system(size: 19)).bold()
                        Spacer()
                        Text("Biar bisa kontrol uang bulanan kamu, yuk, add data budgeting kamu sekarang!")
                            .font(.system(size: 12)).bold()
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                            .frame(width: 240)
                        
                    }
                }
            }
            .navigationTitle("Summary")
            .background(Color.whiteColor.ignoresSafeArea())
        }
        .fullScreenCover(isPresented: $showInputIncome) {
            NavigationView{
            InputIncome(isShowOnBoarding: $showInputIncome)
            }
        }
    }
}

struct EmptyState_Previews: PreviewProvider {
    static var previews: some View {
        EmptyState()
    }
}
