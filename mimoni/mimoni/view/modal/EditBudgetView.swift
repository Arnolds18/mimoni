

import SwiftUI

struct EditBudgetView: View {
    @Environment(\.dismiss) private var dismiss
    
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
            ZStack {
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
                VStack{
                    Text("Untuk membatasi pengeluaran yang melebihi batas, kamu bisa dapat rekomendasi pengeluaran maksimum harian untuk kebutuhan yang akan ditampilkan di summary screen.")
                        .font(.system(size: 11))
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity ,alignment: .topLeading)
                        .padding(.bottom, 320)
                        .padding(23)
                    
                }
            }
            .background(Color.whiteColor)
            .navigationBarTitle(Text("Budget"), displayMode: .inline)
            .navigationBarItems(leading:
                                    Button("Cancel") {
                dismiss()
            }.foregroundColor(Color.interactiveColor))
            .navigationBarItems(trailing:
                                    Button("Add") {
                print("edit")
                
                segmentItem.value = totalBudget
                segmentItem.title = budgetCategory
                segmentItem.recommended = recomendationEnabled
                isInputActive = false
                ramdom.toggle()
                
            }.foregroundColor(Color.interactiveColor))
        }.onAppear{
            totalBudget = segmentItem.value
            budgetCategory = segmentItem.title
            recomendationEnabled = segmentItem.recommended
        }
    }
}

//struct EditBudgetView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditBudgetView(segment: SegmentsViewModel(), ramdom: .constant(true), segmentItem: Segment)
//    }
//}
