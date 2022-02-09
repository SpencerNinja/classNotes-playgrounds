//
//  Book.swift
//  BasicAPI
//
//  Created by Spencer Hurd on 2/9/22.
//

import Foundation

struct ApiBooks: Codable {
    var docs: [Book]
    
    struct Book: Codable {
        var _id: String
        var name: String
    }
}


/*
 {"docs":
     [
         {"_id":"5cf5805fb53e011a64671582","name":"The Fellowship Of The Ring"},
         {"_id":"5cf58077b53e011a64671583","name":"The Two Towers"},
         {"_id":"5cf58080b53e011a64671584","name":"The Return Of The King"}
     ],
 "total":3,
 "limit":1000,
 "offset":0,
 "page":1,
 "pages":1}
 */
