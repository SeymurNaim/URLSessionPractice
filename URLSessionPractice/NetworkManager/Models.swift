//
//  Models.swift
//  URLSessionPractice
//
//  Created by Apple on 10.07.24.
//

import Foundation


struct PostModel: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

struct CommentModel: Codable {
    let postId: Int
    let id: Int
    let name: String
    let email: String
    let body: String
}

struct AlbumsModel: Codable {
    let userId: Int
    let id: Int
    let title: String
}

struct PhotosModel: Codable {
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}

struct UsersModel: Codable {
    let id: Int
    let name: String
    let userName: String
    let email: String
    let address: Address
    let phone: String
    let website: String
    let company: Company
}

struct Address: Codable {
    let street, suite, city, zipcode: String
    let geo: Geo
}

struct Geo: Codable {
    let lat, lng: String
}

struct Company: Codable {
    let name, catchPhrase, bs: String
}

