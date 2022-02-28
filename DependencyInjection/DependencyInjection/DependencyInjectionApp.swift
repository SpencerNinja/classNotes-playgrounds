//
//  DependencyInjectionApp.swift
//  DependencyInjection
//
//  Created by Spencer Hurd on 2/28/22.
//

import SwiftUI

@main
struct DependencyInjectionApp: App {
    
    let dataService = ProductionDataService(url: URL(string: Constants.BASE_URL)!)
    
    var body: some Scene {
        WindowGroup {
            MainView(dataService: dataService)
        }
    }
}
