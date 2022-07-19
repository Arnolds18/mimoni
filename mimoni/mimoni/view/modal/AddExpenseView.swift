//
//  AddExexpenseView.swift
//  mimoni
//
//  Created by Arnold Sidiprasetija on 15/07/22.
//

import SwiftUI

struct AddExpenseView: View {
    @Environment(\.dismiss) private var dismiss
    
    var budgetCategory = ["Kebutuhan", "Keinginan", "Tabungan", "Dana Darurat"]
    @State private var selectedBudgetCategory = "Kebutuhan"
    @FocusState private var isInputActive: Bool
    @State var totalBudget : Int = 0
    @Binding var random:Bool
    
    
    var numberFormatter : NumberFormatter{
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.zeroSymbol = ""
        return numberFormatter
    }
    
    var body: some View {
        NavigationView {
            VStack{
//                VStack(alignment: .trailing, spacing: 10){
//                    Text("Input Budget Expenses")
//                        .fontWeight(.semibold)
//                        .font(.system(size: 25))
//                        .multilineTextAlignment(.leading)
//                }
                Picker("", selection: $selectedBudgetCategory) {
                    ForEach(budgetCategory, id: \.self) {
                        Text($0)
                    }
                }.pickerStyle(WheelPickerStyle())
                
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
            }
            .navigationBarTitle(Text(""), displayMode: .inline)
            .navigationBarItems(leading:
                                    Button("Cancel") {
                dismiss()
            }.foregroundColor(Color.interactiveColor))
            
            .navigationBarItems(trailing:
                                    Button("Add") {
                print("add")
            }.foregroundColor(Color.interactiveColor))
            .background(Color.whiteColor.ignoresSafeArea())
            
        }
    }
}

struct AddExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        AddExpenseView(random: .constant(true))
    }
}
