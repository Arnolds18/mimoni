//
//  SetupBudget.swift
//  mimoni
//

//  Created by Arnold Sidiprasetija on 24/06/22.

//

import SwiftUI
import ModalView

struct Segment: Identifiable{
    var id = UUID()
    
    let title: String
    let value: Double
}

class SegmentsViewModel: ObservableObject{
    @Published var segments: [Segment] = [
        Segment(title: "Kebutuhan", value: 0),
        Segment(title: "Keinginan", value: 0),
        Segment(title: "Tabungan", value: 0),
        Segment(title: "Dana Darurat", value: 0),
    ]
}

struct SetupBudget: View{
    @Binding var income: Int
    @StateObject var viewModel = SegmentsViewModel()
    @State private var showAddBudget: Bool = false
    
    
    var body: some View {
        NavigationView{
            VStack{
                Text("Income")
                    .fontWeight(.bold)
                    .font(.system(size: 31))
                Text("Rp. \(income)")
                    .fontWeight(.bold)
                    .font(.system(size: 31))
                ModalPresenter {
                    List{
                        ForEach(viewModel.segments){ segment in
                            ModalLink(destination: EditBudgetView( totalBudget: .constant(5), budgetCategory: .constant("Halo"))) {
                                SegmentRow(value: segment.value, title: segment.title)
                            }
                            
                        }.listRowSeparator(.hidden)
                            //showAddBudget = true
                            //viewModel.segments.append(Segment(id: UUID(), title: "Kareo", value: 21312.00))
                        ModalLink(destination: AddBudgetView( segment: viewModel), label: {
                                Label("Add Category", systemImage: "plus.circle.fill")
                            })
                        
                        .sheet(isPresented: $showAddBudget){
                            //AddBudgetView()
                    }
                    }
                    NavigationLink(destination: SetupBudget(income: self.$income)) {
                        HStack{
                            Text("Continue")
                                .fontWeight(.semibold)
                        }
                        .font(.headline)
                        .frame(width: 350, height: 60)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(15)
//                        .padding(.top, 250)
                        
                    }
                }
        }
    }
}
    
    struct SegmentRow: View {
        
        let value: Double
        let title: String
        var body: some View{
            VStack(alignment: .leading) {
                HStack{
                Text(title)
                    Text("\(value)").background(Color.blue)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                }
                Divider()
            }.listRowSeparator(.hidden)
            
        }
        
    }
    
    //struct SetupBudget_Previews: PreviewProvider {
    //    static var previews: some View {
    //        SetupBudget().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    //    }
    struct SetupBudget_Previews: PreviewProvider {
        static var previews: some View {
            SetupBudget(income: .constant(1000))
        }
    }
}
