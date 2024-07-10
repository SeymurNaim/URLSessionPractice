//
//  NetworkManager.swift
//  URLSessionPractice
//
//  Created by Apple on 10.07.24.
//

//import UIKit
//
//
//protocol ApiManagerService {
//    func fetchData(for category: TopStoryCategory, completion: @escaping (NewsModel?, Error?) -> Void)
//}
//
//class ApiManager: ApiManagerService {
//    func fetchData(for category: TopStoryCategory, completion: @escaping (NewsModel?, Error?) -> Void) {
//        guard let urlString = category.url, let url = URL(string: urlString) else {
//            completion(nil, NSError(domain: "Invalid URL", code: 0, userInfo: nil))
//            return
//        }
//
//        let task = URLSession.shared.dataTask(with: url) { data, response, error in
//            guard let data = data, error == nil else {
//                DispatchQueue.main.async {
//                    completion(nil, error)
//                }
//                return
//            }
//            do {
//                let fetchedData = try JSONDecoder().decode(NewsModel.self, from: data)
//                DispatchQueue.main.async {
//                    completion(fetchedData, nil)
//                }
//            } catch {
//                DispatchQueue.main.async {
//                    completion(nil, error)
//                }
//            }
//        }
//        task.resume()
//    }
//}


