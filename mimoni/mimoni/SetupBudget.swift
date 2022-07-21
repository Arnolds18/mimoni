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
    
    var title: String
    var value: Int
    var recommended: Bool
}

class SegmentsViewModel: ObservableObject{
    @Published var segments: [Segment] = [
        Segment(title: "Kebutuhan", value: 0, recommended: false),
        Segment(title: "Keinginan", value: 0, recommended: false),
        Segment(title: "Tabungan", value: 0, recommended: false),
        Segment(title: "Dana Darurat", value: 0, recommended: false),
    ]
}

//extension SegmentsViewModel: Equatable {
//    static func ==(lhs: SegmentsViewModel, rhs: SegmentsViewModel) -> Bool {
//        let areEqual = lhs.segments == rhs.segments
//
//        return areEqual
//    }
//
//
//}


struct SetupBudget: View{
//    @Environment(\.dismiss) private var dismiss
    @Binding var income: Int
    
    //Sudah Nick
    //Ini Gara2 ObservedObject ->StateObject
    @StateObject var viewModel = SegmentsViewModel()
    @State private var showAddBudget: Bool = false
    @State private var totalListBudget = 0

    var body: some View {
            VStack{
                Text("Budget")
                    .fontWeight(.bold)
                    .font(.system(size: 31))
                Text("Rp. \(income - totalListBudget)") //- totalBudget
                    .fontWeight(.bold)
                    .font(.system(size: 31))
                ModalPresenter {
                    List{
                        ForEach(0..<viewModel.segments.count, id: \.self){ segment in
                            ModalLink(destination: EditBudgetView(segmentItem: $viewModel.segments[segment], ramdom: $showAddBudget)) {
                                SegmentRow(value: $viewModel.segments[segment].value, title: $viewModel.segments[segment].title, recommended: $viewModel.segments[segment].recommended)
                            }

                            .foregroundColor(.black)
                        }
                        .listRowSeparator(.hidden)
                        ModalLink(destination: AddBudgetView( segment: viewModel, ramdom: $showAddBudget), label: {
                            Label {
                                Text("Add Category")
                                    .foregroundColor(.black)
                            } icon: {
                                Image(systemName: "plus.circle.fill")
                                    .foregroundColor(.interactiveColor)
                            }
                        })
                    }
                }
                NavigationLink(destination: SetupBudget(income: self.$income)) {
                    HStack{
                        Text("Continue\(income)")
                            .fontWeight(.semibold)
                        
                    }
                    .font(.headline)
                    .frame(width: 340, height: 50)
                    .foregroundColor(self.income == 0 ? .blackColor : .whiteColor)
                    .background(self.income == 0 ? Color.interactiveColor : Color.gray)
                    .cornerRadius(15)
                    .padding()
                }.disabled(self.income == 0 ? false : true)
                
                .onChange(of: showAddBudget) { newValue in
                    totalListBudget = 0
                    for i in viewModel.segments{
                        print(i.value) //ngitung totalBudget aja
                        
                        totalListBudget = totalListBudget + i.value
                    }
                    print("onChange hereeeeee")
                }
                
                
            }

//            .navigationBarBackButtonHidden(true)
            .navigationBarItems(trailing:
            Button("Skip") {
                print("skip tapped")
            }
                .foregroundColor(Color.interactiveColor))
        
//            .navigationBarItems(leading:
//                                    NavBarBackButton(dismiss:self.dismiss))
        
            .background(Color.whiteColor.ignoresSafeArea())
        

    }
    
    struct SegmentRow: View {
        
        @Binding var value: Int
        @Binding var title: String
        @Binding var recommended: Bool
        
        var body: some View{
            VStack(alignment: .leading) {
                HStack{
                    Text(title)
                    Text("\(value)")
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
