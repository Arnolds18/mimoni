//
//  SetupBudget.swift
//  mimoni
//
//  Created by Nicky Santano on 24/06/22.
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
    @StateObject var viewModel = StocksViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                List{
                    ForEach(viewModel.stocks){ stock in
                        StockRow(title: stock.title)
                    }
                }
                .navigationTitle("Hello")
                .toolbar{
                    ToolbarItemGroup(placement: .navigationBarTrailing){
                        Button{
                            print("Modal view shown")
                        }label: {
                            Label("Add", systemImage: "plus")
                        }
                    }
                }
            }
        }
    }
}

struct StockRow: View{
    
    let title: String
    
    var body: some View{
        Label(title: {Text(title)}, icon: {Image(systemName: "")})
    }
}

struct SetupBudget_Previews: PreviewProvider {
    static var previews: some View {
        SetupBudget().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
