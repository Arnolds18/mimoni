

import SwiftUI

struct EditBudgetView: View {
    @Environment(\.dismiss) var dismiss
    //@Binding var
    
    @FocusState private var isInputActive: Bool
    @State var totalBudget : Int = 0
    @State var budgetCategory : String = ""
    @State var recomendationEnabled: Bool = false
    
    @Binding var segmentItem: Segment
    @Binding var ramdom:Bool
    
    var numberFormatter : NumberFormatter{
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.zeroSymbol = ""
        return numberFormatter
    }
    
    var body: some View {
        NavigationView {
            
            Form{
                HStack{
                    Text("Kategori Budget")
                    TextField("Lain-lain", text: $budgetCategory)
                        .multilineTextAlignment(.trailing)
                }
                HStack{
                    Text("Total")
                    Spacer()
                    TextField("Rp.0", value: $totalBudget, formatter: numberFormatter)
                        .multilineTextAlignment(.trailing)
                        .focused($isInputActive)
                        .keyboardType(.numberPad)
                        .toolbar {
                            ToolbarItemGroup(placement: .keyboard) {
                                Spacer()
                                Button("Done") {
                                    isInputActive = false
                                }
                            }
                        }
                }
                HStack{
                    Toggle(isOn: $recomendationEnabled) {
                        Text("Rekomendasi")
                    }
                }
            }
            .navigationBarTitle(Text("Budget"), displayMode: .inline)
            .navigationBarItems(leading:
                                    Button("Cancel") {
                dismiss()
            })
            .navigationBarItems(trailing:
                                    Button("Edit") {
                print("edit")
                
                segmentItem.value = totalBudget
                segmentItem.title = budgetCategory
                segmentItem.recommended = recomendationEnabled
                isInputActive = false
                ramdom.toggle()
                
            })
        }.onAppear{
            totalBudget = segmentItem.value
            budgetCategory = segmentItem.title
            recomendationEnabled = segmentItem.recommended
        }
    }
}

//struct AddBudgetView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddBudgetView()
//    }
//}
