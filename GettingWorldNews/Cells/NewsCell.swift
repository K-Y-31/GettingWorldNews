//
//  NewsCell.swift
//  GettingWorldNews
//
//  Created by 木本瑛介 on 2021/03/24.
//

import UIKit
import Nuke

class NewsCell: UICollectionViewCell {
    
    private let format = "yyy/MM/dd"
    
    var articles: Article? {
        didSet {
            if let url = URL(string: articles?.urlToImage ?? "") {
                Nuke.loadImage(with: url, into: ArticleImageView)
            }
            if let publishedAt = articles?.publishedAt {
                let date = self.stringFromDate(date: publishedAt, format: format)
                ArticlePublishedAt.text = date
            }
            ArticleTitleLabel.text = articles?.title
            ArticleDescipriton.text = articles?.description
        }
    }
    
    @IBOutlet weak var ArticleImageView: UIImageView!
    @IBOutlet weak var ArticleTitleLabel: UILabel!
    @IBOutlet weak var ArticleDescipriton: UILabel!
    @IBOutlet weak var ArticlePublishedAt: UILabel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    private func stringFromDate(date: Date, format: String) -> String {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.dateFormat = format
        return formatter.string(from: date)
    }
}
