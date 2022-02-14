//
//  APIView.swift
//  APICall2
//
//  Created by Spencer Hurd on 2/14/22.
//

import SwiftUI

struct ApiView: View {
    
    @StateObject var apiVM: ApiViewModel = ApiViewModel()
    
    var body: some View {
        ForEach(apiVM.posts) { post in
            Text("Title: \(post.title)")
        }
    }
    
}

struct APIView_Previews: PreviewProvider {
    static var previews: some View {
        ApiView()
    }
}


