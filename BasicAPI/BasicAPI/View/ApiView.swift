//
//  ApiView.swift
//  BasicAPI
//
//  Created by Spencer Hurd on 2/9/22.
//

import SwiftUI

struct ApiView: View {
    
    @StateObject var apiViewModel = ApiViewModel()
    
    var body: some View {
        ForEach(apiViewModel.apiResponses) { post in
            Text(post.title)
        }
    }
}

struct ApiView_Previews: PreviewProvider {
    static var previews: some View {
        ApiView()
    }
}
