//
//  Protocols.swift
//  DependencyInjection
//
//  Created by Spencer Hurd on 2/28/22.
//

import Foundation
import Combine

protocol DataServiceProtocol {
    
    func fetchData() -> AnyPublisher<[Post], Error> 
    
}
