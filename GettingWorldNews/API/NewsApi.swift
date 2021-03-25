//
//  NewsApi.swift
//  GettingWorldNews
//
//  Created by 木本瑛介 on 2021/03/25.
//

import Foundation
import Alamofire

class API {
    
    static let shared = API()
    
    private let baseurl = "https://newsapi.org/v2/"
    private var params = [String:Any]()
    
    func request<T: Decodable>(path: PathType, category: Category, type: T.Type, completion: @escaping (T) -> Void) {
        var path = path.rawValue
        if path == "top" {
            path += "-headlines"
        }
        let url = "https://newsapi.org/v2/top-headlines?country=jp&category=technology&apiKey=bfae329457b14d42800541b5f8448f0d"
        
        let url2 = baseurl + path + "?"
        var params = self.params
        params["country"] = "jp"
        params["apiKey"] = "bfae329457b14d42800541b5f8448f0d"
        params["category"] = category.rawValue
        
        let request = AF.request(url)
        request.responseJSON { (response) in
            guard let statusCode = response.response?.statusCode else { return }
            if statusCode <= 300 {
                do {
                    guard let data = response.data else { return }
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601
                    let value = try decoder.decode(T.self, from: data)
                    completion(value)
                }
                catch {
                    print("Faled convert. \(error)")
                }
            }
        }
    }
}
