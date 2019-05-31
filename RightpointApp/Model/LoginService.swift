//
//  LoginService.swift
//  testApp
//
//  Created by Craig Spitzkoff on 12/20/18.
//  Copyright © 2018 Craig Spitzkoff. All rights reserved.
//

import Foundation

/// Main interface for logging into the service.
class LoginService: NSObject {

    /// Log In to the service
    ///
    /// - Note:
    ///   The completion handler will be called on a background thread.
    ///   Handle requisite UI updates appropriately on the main thread.
    ///
    /// - Parameters:
    ///   - username: username - correct username is `rightpoint`
    ///   - password: password - correct password is `test`
    ///   - completion: completion handler, which takes a LoginServiceResult argument.
    func login(username: String, password: String, completion: @escaping (_ result: LoginServiceResult) -> Void) {
        
        // simulate a 3 second delay in our login API
        DispatchQueue.init(label: "Login").asyncAfter(deadline: DispatchTime.now() + 3) {

            let result: LoginServiceResult!
            
            if username.lowercased() != "rightpoint" {
                result = LoginServiceResult(success: false, users: [], errorCode: .invalidUsername)
            } else if password != "test" {
                result = LoginServiceResult(success: false, users: [], errorCode: .invalidUsername)
            } else {
                
                // generate nested lists of users - count array is the count of users in each nested level.
                let users = self.generateUsers(count: [50, 8, 4])
                result = LoginServiceResult(success: true,
                                            users: users,
                                            errorCode: LoginErrorCode.none)
            }
            
            completion(result)

        }
        
    }

    /// Name generator object - used to generate random lists of names
    let generator = NameGenerator()
    
    /// Generate a hierarchy of users
    ///
    /// - Parameter count: Integer array, where each integer represents the number of
    ///                    users to be generated at that level of the hierarchy
    /// - Returns: generated array of User objects
    func generateUsers(count: [Int]) -> [User] {
        
        let nextLevelsCounts = count.dropFirst()
        
        let users = generator.generateRandomNames(count: count[0]).map({ (name) -> User in
            User(firstName: name.firstName,
                 lastName: name.lastName,
                 directReports: nextLevelsCounts.count > 0 ? generateUsers(count: Array(nextLevelsCounts)) : [])
        })
        
        return users
    }
    
}

struct User {
    let firstName: String
    let lastName: String
    let directReports: [User]
}

struct LoginServiceResult {
    let success: Bool
    let users: [User]
    let errorCode: LoginErrorCode
}

enum LoginErrorCode {
    case none
    case invalidUsername
    case invalidPassword
}
