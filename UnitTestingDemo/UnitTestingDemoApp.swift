//
//  UnitTestingDemoApp.swift
//  UnitTestingDemo
//
//  Created by Spencer Hurd on 3/7/22.
//

import SwiftUI

@main
struct UnitTestingDemoApp: App {
    
    @StateObject var mainVM: MainViewModel = MainViewModel(isPremium: nil)
    
    var body: some Scene {
        WindowGroup {
            MainView(isPremium: false)
        }
    }
}
