//
//  MainView.swift
//  DependencyInjection
//
//  Created by Spencer Hurd on 2/28/22.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var vm: MainViewModel
    
    init(dataService: DataServiceProtocol) {
        _vm = StateObject(wrappedValue: MainViewModel(dataService: dataService))
    }
    
    var body: some View {
        ScrollView {
            ForEach(vm.posts) { post in
                Text(String(post.id))
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    
    static let dummyDataService = MockDataService(data: nil)
    
    static var previews: some View {
        MainView(dataService: dummyDataService)
    }
}
