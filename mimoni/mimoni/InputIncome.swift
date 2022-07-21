//
//  InputIncome.swift
//  mimoni
//
//  Created by Arnold Sidiprasetija on 21/06/22.
//

import SwiftUI

struct InputIncome: View {
    @State var income : Int = 0
    @State var isShowingDetailView =  false
    @FocusState private var isInputActive: Bool
    @Binding var isShowOnBoarding: Bool
    
    var numberFormatter : NumberFormatter{
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.zeroSymbol = ""
        return numberFormatter
    }
    
    var body: some View {
        VStack{
            VStack{
                Text("Income")
                    .fontWeight(.bold)
                    .font(.system(size: 31))
                Text("write down your income")
                    .fontWeight(.regular)
                    .font(.system(size: 18))
                    .frame(height: 100, alignment:.topLeading)
            }
            
            TextField("Income", value: $income, formatter: numberFormatter)
                .focused($isInputActive)
                .padding()
                .textFieldStyle(OvalTextFieldStyle())
                .keyboardType(.numberPad)
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("Done") {
                            isInputActive = false
                        }
                    }
                }
            Spacer()
            NavigationLink(destination: SetupBudget(income: self.$income, income2: self.income, isShowOnBoarding: $isShowOnBoarding)) {
                HStack{
                    Text("Continue")
                        .fontWeight(.semibold)
                }
                .font(.headline)
                .frame(width: 340, height: 50)
                .foregroundColor(self.income > 0 ? .blackColor : .white)
                .background(self.income > 0 ? Color.interactiveColor : .gray)
                .cornerRadius(15)
            }.disabled(self.income > 0 ? false : true)
        }
        .frame(maxWidth:.infinity)
        .navigationBarItems(trailing:
                                Button("Skip") {
            isShowOnBoarding = false
        }
            .foregroundColor(Color.interactiveColor))
        
        .background(Color.whiteColor.ignoresSafeArea())
        
    }
}

struct InputIncome_Previews: PreviewProvider {
    static var previews: some View {
        InputIncome(isShowOnBoarding: .constant(true))
    }
}
