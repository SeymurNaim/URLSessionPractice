//
//  Helper.swift
//  URLSessionPractice
//
//  Created by Apple on 10.07.24.
//

import Foundation


enum AppURL: String {
    case base = "https://jsonplaceholder.typicode.com/"
}

enum TabbarSections: Int {
    case post = 0
    case comments = 1
    case albums = 2
    case photos = 3
    case users = 4
    
    var url: String? {
        switch self {
        case .post:
            return "\(AppURL.base.rawValue)/posts"
        case .comments:
            return "\(AppURL.base.rawValue)/1/comments"
        case .albums:
            return "\(AppURL.base.rawValue)/albums"
        case .photos:
            return "\(AppURL.base.rawValue)/photos"
        case .users:
            return "\(AppURL.base.rawValue)/users"
        }
    }
}
