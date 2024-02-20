//
//  Post.swift
//  MobileAcebook
//
//  Created by Tom Mazzag on 20/02/2024.
//

import Foundation

struct Post: Codable, Identifiable {
    let id: String
    let message: String
    let createdBy: String
    let createdAt: String
    let comments: Int
    let likes: [String]
    
    private enum CodingKeys: String, CodingKey {
        case id = "_id"
        case message
        case createdBy
        case createdAt
        case likes
        case comments
    }
    
    var formattedCreatedAt: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ" // Input format
        if let date = dateFormatter.date(from: createdAt) { // If the date is valid / the corect format
            dateFormatter.dateFormat = "dd MM yyyy, HH:mm" // Format you want to return
            return dateFormatter.string(from: date)
        } else {
            return "Invalid Date"
        }
    }
}

struct PostWrapper: Codable {
    let posts: [Post]
}

