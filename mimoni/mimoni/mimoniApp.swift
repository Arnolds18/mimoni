//
//  mimoniApp.swift
//  mimoni
//
//  Created by Arnold Sidiprasetija on 21/06/22.
//

import SwiftUI

@main
struct mimoniApp: App {
    @AppStorage("isOnboarding") var isOnboarding = true

    
    init() {
        UITableView.appearance().backgroundColor = .clear
        UINavigationBar.appearance().backgroundColor = .clear
    }
    
    var body: some Scene {
        WindowGroup {

            if isOnboarding{
                OnboardingView()
            }else{
                InputIncome()
            }
            
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            
        }
    }
}
