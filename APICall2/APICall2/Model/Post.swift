//
//  ApiModel.swift
//  APICall2
//
//  Created by Spencer Hurd on 2/14/22.
//

import Foundation

// Codable is used for decoding and encoding the JSON data we get from our API call.

struct Post: Codable, Identifiable {
    
    var userId: Int
    var id: Int
    var title: String
    var body: String
    
}

/*
 SAMPLE DATA
 
 [
   {
     "userId": 1,
     "id": 1,
     "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
     "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
   },
   {
     "userId": 1,
     "id": 2,
     "title": "qui est esse",
     "body": "est rerum tempore vitae\nsequi sint nihil reprehenderit dolor beatae ea dolores neque\nfugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis\nqui aperiam non debitis possimus qui neque nisi nulla"
   },
   ...
 */
