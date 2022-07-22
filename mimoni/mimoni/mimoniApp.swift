//
//  mimoniApp.swift
//  mimoni
//
//  Created by Arnold Sidiprasetija on 21/06/22.
//

import SwiftUI

@main
struct mimoniApp: App {
    @State var linkOne: Bool = false
    
    @State var segments: [Segment] = [
        Segment(title: "Kebutuhan", value: 10000, recommended: false),
        Segment(title: "Keinginan", value: 2000, recommended: false),
        Segment(title: "Tabungan", value: 50000, recommended: false),
        Segment(title: "Dana Darurat", value: 20000, recommended: false),
    ]
    
    init() {
        UITableView.appearance().backgroundColor = .clear
        UINavigationBar.appearance().backgroundColor = .clear
        
    }
    
    var body: some Scene {
        WindowGroup {
            
            MainScreen(segments: $segments)
                .onOpenURL { url in
                    self.linkOne = url == URL(string: "mimoni://AddExpense")!
                }.sheet(isPresented: $linkOne, content: {
                    AddExpenseView(random: $linkOne)
                }).onAppear(){
                    print("AAAAAASEGMENTTTTT \(segments)")
                }
        }
    }
}
