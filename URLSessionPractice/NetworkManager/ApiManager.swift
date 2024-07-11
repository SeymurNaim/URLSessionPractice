//
//  NetworkManager.swift
//  URLSessionPractice
//
//  Created by Apple on 10.07.24.
//

import UIKit


protocol ApiManagerService {
    associatedtype DataType
    func fetchData(for category: TabbarSections, completion: @escaping (DataType?, Error?) -> Void)
}



class ApiManager<T: Decodable>: ApiManagerService {
    typealias DataType = T

    func fetchData(for category: TabbarSections, completion: @escaping (DataType?, Error?) -> Void) {
        guard let urlString = category.url, let url = URL(string: urlString) else {
            completion(nil, NSError(domain: "Invalid URL", code: 0, userInfo: nil))
            return
        }

        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else {
                return
            }
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
                return
            }
            do {
                let fetchedData = try JSONDecoder().decode(DataType.self, from: data)
                DispatchQueue.main.async {
                    completion(fetchedData, nil)
                }
            } catch {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
            }
        }
        task.resume()
    }
}



