//
//  Notes.swift
//  DependencyInjection
//
//  Created by Spencer Hurd on 2/28/22.
//

/**
 DEPENDENCY INJECTION in Swift
 
 Dependency Injection is providing the instance variable that an object needs (its dependencies) instead of having it construct them itself.
 
 It's a very useful technique for testing, since it allows dependencies to be mocked or stubbed out.
 
 Rather than relying on Singletons or instantiating our dependencies inside our Classes or Structs, we will use protocols to inject them through their constructor (init). This is safer and more architecturally sound in some ways than using the Singleton pattern or depending on the environment (in SwiftUI).
 
 PROBLEMS WITH SINGLETONS
 - There is only one
 - The initializer is fixed
 - They are global
 - Can't swap dependencies
 
 */
