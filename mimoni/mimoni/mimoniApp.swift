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

    var body: some Scene {
        WindowGroup {
            if isOnboarding{
                OnboardingView()
            }else{
                ContentView()
            }
            
        }
    }
}
