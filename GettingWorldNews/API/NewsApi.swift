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
    private var url: String = ""
//    private let baseurl = "https://newsapi.org/v2/"
//    private var params = [String:Any]()
    
    func request<T: Decodable>(path: PathType, category: Category, type: T.Type, completion: @escaping (T) -> Void) {
//        var path = path.rawValue
        
        let url_tech = "https://newsapi.org/v2/top-headlines?country=jp&category=technology&apiKey=bfae329457b14d42800541b5f8448f0d"
        let url_business = "https://newsapi.org/v2/top-headlines?country=jp&category=business&apiKey=bfae329457b14d42800541b5f8448f0d"
        let url_entertaiment = "https://newsapi.org/v2/top-headlines?country=jp&category=entertainment&apiKey=bfae329457b14d42800541b5f8448f0d"
        let url_general = "https://newsapi.org/v2/top-headlines?country=jp&category=general&apiKey=bfae329457b14d42800541b5f8448f0d"
        let url_health = "https://newsapi.org/v2/top-headlines?country=jp&category=health&apiKey=bfae329457b14d42800541b5f8448f0d"
        let url_science = "https://newsapi.org/v2/top-headlines?country=jp&category=science&apiKey=bfae329457b14d42800541b5f8448f0d"
        let url_sports = "https://newsapi.org/v2/top-headlines?country=jp&category=sports&apiKey=bfae329457b14d42800541b5f8448f0d"
        
        
        if category.rawValue == Category.technology.rawValue {
            url = url_tech
        }
        else if category.rawValue == Category.business.rawValue {
            url = url_business
        }
        else if category.rawValue == Category.entertainment.rawValue {
            url = url_entertaiment
        }
        else if category.rawValue == Category.general.rawValue {
            url = url_general
        }
        else if category.rawValue == Category.science.rawValue {
            url = url_science
        }
        else if category.rawValue == Category.sports.rawValue {
            url = url_sports
        }
        else if category.rawValue == Category.health.rawValue {
            url = url_health
        }
        
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
