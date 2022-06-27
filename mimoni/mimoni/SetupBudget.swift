//
//  SetupBudget.swift
//  mimoni
//

//  Created by Arnold Sidiprasetija on 24/06/22.

//

import SwiftUI

struct Stock: Identifiable{
    var id = UUID()
    
    let title: String
}

class StocksViewModel: ObservableObject{
    @Published var stocks: [Stock] = [
        Stock(title: "Kebutuhan"),
        Stock(title: "Keinginan"),
        Stock(title: "Tabungan"),
        Stock(title: "Dana Darurat"),
    ]
}

struct SetupBudget: View{
    @Binding var income: Int
    @StateObject var viewModel = StocksViewModel()
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
                List{
                    ForEach(viewModel.stocks){ stock in
                        StockRow(title: stock.title)
                    }
                }
            }
        }
        .toolbar{
            ToolbarItemGroup(placement: .navigationBarTrailing){
                Button(action: {
                    showAddBudget = true
                }, label: {
                    Label("Add", systemImage: "plus")
                })
            }
        }
        .sheet(isPresented: $showAddBudget){
            AddBudgetView()
        }
    }
    
    
    
    struct StockRow: View{
        
        let title: String
        
        var body: some View{
            Label(title: {Text(title)}, icon: {Image(systemName: "")})
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
