//
//  WebService.swift
//  Mob-Weather
//
//  Created by Burak Donat on 11.09.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import Foundation

struct WebService {
    func performRequest<T: Decodable>(url: String, completion: @escaping (T) -> Void) {
        if let url = URL(string: url) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print("ERROR", error?.localizedDescription as Any)
                } else {
                    if let safeData = data {
                        if let decodedData = try? JSONDecoder().decode(T.self, from: safeData) {
                            completion(decodedData)
                        }
                    }
                }
            }.resume()
        }
    }
}
