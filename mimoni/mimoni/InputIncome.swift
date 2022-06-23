//
//  InputIncome.swift
//  mimoni
//
//  Created by Arnold Sidiprasetija on 21/06/22.
//

import SwiftUI

struct InputIncome: View {
    @State private var income = 0
    @FocusState private var isInputActive: Bool
    
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
            TextField("Income", value: $income, format: .number)
                .focused($isInputActive)
                .textFieldStyle(.roundedBorder)
                .padding()
                .keyboardType(.numberPad)
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("Done") {
                            isInputActive = false
                        }
                    }
                }
            
            Button(action: {
                print("Continued")
            }){
                HStack{
                    Text("Continue")
                        .fontWeight(.semibold)
                }
                .font(.headline)
                .frame(width: 350, height: 60)
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(15)
                .padding(.top, 250)
                
            }
        }
        .padding()
    }
}

struct InputIncome_Previews: PreviewProvider {
    static var previews: some View {
        InputIncome()
    }
}
