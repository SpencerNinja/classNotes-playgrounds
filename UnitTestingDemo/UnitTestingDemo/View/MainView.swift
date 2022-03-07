//
//  ContentView.swift
//  UnitTestingDemo
//
//  Created by Spencer Hurd on 3/7/22.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var mainVM: MainViewModel
    
    init(isPremium: Bool?) {
        _mainVM = StateObject(wrappedValue: MainViewModel(isPremium: isPremium!))
    }
    
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainView()
//    }
//}
