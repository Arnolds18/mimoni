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
    let dataController = DataController.shared
    @Environment(\.scenePhase) var scenePhase
    
    init() {
        UITableView.appearance().backgroundColor = .clear
        UINavigationBar.appearance().backgroundColor = .clear
    }
    
    var body: some Scene {
        WindowGroup {
            
            MainScreen()
                .environment(\.managedObjectContext,
                              dataController.container.viewContext)
                
                .onOpenURL { url in
                    self.linkOne = url == URL(string: "mimoni://AddExpense")!
                }.sheet(isPresented: $linkOne, content: {
                    AddExpenseView(random: $linkOne)
                })
        }.onChange (of: scenePhase) { (newScenePhase) in
            switch newScenePhase {
            case .background:
                print("Scene is in background")
                dataController.save()
            case .inactive:
                print("Scene is inactive")
            case .active:
                print("Scene is active")
            @unknown default:
                print("Apple must have changed something")
            }
        }
    }
}
