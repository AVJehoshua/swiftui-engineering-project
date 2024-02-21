//
//  AuthenticationServiceProtocol.swift
//  MobileAcebook
//
//  Created by Josué Estévez Fernández on 01/10/2023.
//

// Line 12 - completion: @escaping (bool) -> Void ---- 'completion' is a convention used in async funcs, represents a closure will be called once operation is completed. || @escaping adheres to async func rules || Bool indicates the result of sign up - if unsuccessful,
//


public protocol AuthenticationServiceProtocol {
    func signUp(user: User, completion: @escaping (Bool) -> Void)
}


