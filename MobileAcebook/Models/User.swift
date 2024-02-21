//
//  User.swift
//  MobileAcebook
//
//  Created by Josué Estévez Fernández on 01/10/2023.
//

public struct User: Codable {
    let username: String?
    let password: String
    let email: String
}

struct UserWrapper: Codable {
    let ownerData: User
}
