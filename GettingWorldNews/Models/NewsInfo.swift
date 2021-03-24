//
//  NewsInfo.swift
//  GettingWorldNews
//
//  Created by 木本瑛介 on 2021/03/24.
//

import Foundation

struct NewsInfo: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let source: Source
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: Date?
}

struct Source: Decodable {
    let id: String?
    let name: String?
}
