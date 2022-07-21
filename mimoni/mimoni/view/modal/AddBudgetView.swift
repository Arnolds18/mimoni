//
//  AddBudgetView.swift
//  mimoni
//
//  Created by Arnold Sidiprasetija on 27/06/22.
//

import SwiftUI

struct AddBudgetView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var segment: SegmentsViewModel
    
    @FocusState private var isInputActive: Bool
    @State var totalBudget : Int = 0
    @State var budgetCategory : String = ""
    @State var recomendationEnabled: Bool = false
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
                              .multilineTextAlignment(.trailing)                .focused($isInputActive)
                              .keyboardType(.numberPad)
                              .toolbar {
                                  ToolbarItemGroup(placement: .keyboard) {
                                      Spacer()
                                      Button("Done") {
                                          isInputActive = false
                                          ramdom.toggle()
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
//                      showAddBudget = false
                  }.foregroundColor(Color.interactiveColor))
                
                  .navigationBarItems(trailing:
                  Button("Add") {
                      print("add")
                      segment.segments.append(Segment(id: UUID(), title: budgetCategory, value: totalBudget, recommended: recomendationEnabled))
                      segment.objectWillChange.send()
                      ramdom.toggle()
                  }
                    .disabled(self.budgetCategory == "" || self.totalBudget <= 0  ? true : false)
                    .foregroundColor(self.budgetCategory == "" || self.totalBudget <= 0  ? Color.gray : Color.interactiveColor))
                  .background(Color.whiteColor)
                  
            }
        }
}

struct AddBudgetView_Previews: PreviewProvider {
    static var previews: some View {
        AddBudgetView(segment: SegmentsViewModel(), ramdom: .constant(true))
    }
}
