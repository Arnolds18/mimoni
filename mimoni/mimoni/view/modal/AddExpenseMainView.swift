//
//  AddExpenseMainView.swift
//  mimoni
//
//  Created by Arnold Sidiprasetija on 20/07/22.
//

import SwiftUI

struct AddExpenseMainView: View {
    @Environment(\.dismiss) private var dismiss
    
    @FocusState private var isInputActive: Bool
    @State var totalBudget : Int = 0
    @State var budgetCategory : String = ""
    @State var recomendationEnabled: Bool = false
    @Binding var random:Bool
    
    
    var numberFormatter : NumberFormatter{
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.zeroSymbol = ""
        return numberFormatter
    }
    
    var body: some View {
        NavigationView {
            VStack(){
                Text("Kebutuhan")
                    .font(.system(size: 22))
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(25)
                ZStack(){
                    RoundedRectangle(cornerRadius:20)
                        .fill(.white)
                        .frame(width: 350, height: 150, alignment: .leading)
                    CardViewExpenses()
                }
//                Spacer()
//                VStack(spacing: 2){
//                    Text("Input expenses")
//                        .frame(width: 320, height: 10, alignment: .leading)
//
//                }
//                .padding(.top)
                
//                Spacer()
                Form{
                    
                    HStack{
                        Text("Total")
                        Spacer()
                        TextField("Rp.0", value: $totalBudget, formatter: numberFormatter)
                            .multilineTextAlignment(.trailing)                .focused($isInputActive)
                            .keyboardType(.numberPad)
                            .toolbar {
                                ToolbarItemGroup(placement: .keyboard) {
                                    Spacer()
                                    Button("Done") {
                                        isInputActive = false
                                        random.toggle()
                                    }
                                }
                            }
                    }
                }
                .navigationBarTitle(Text("Expenses"), displayMode: .inline)
                .navigationBarItems(leading:
                                        Button("Cancel") {
                    dismiss()
                }.foregroundColor(Color.interactiveColor))
                
                .navigationBarItems(trailing:
                                        Button("Add") {
                    print("add")
                    random.toggle()
                }.foregroundColor(Color.interactiveColor))
            }
            .background(Color.whiteColor.ignoresSafeArea())
        }
    }
}

struct AddExpenseMainView_Previews: PreviewProvider {
    static var previews: some View {
        AddExpenseMainView(random: .constant(true))
    }
}
