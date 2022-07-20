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
    
    init() {
        UITableView.appearance().backgroundColor = .clear
        UINavigationBar.appearance().backgroundColor = .clear
    }
    
    var body: some Scene {
        WindowGroup {
            
            MainScreen()
                .onOpenURL { url in
                    self.linkOne = url == URL(string: "mimoni://AddExpense")!
                }.sheet(isPresented: $linkOne, content: {
                    AddExpenseView(random: $linkOne)
                })
        }
    }
}
