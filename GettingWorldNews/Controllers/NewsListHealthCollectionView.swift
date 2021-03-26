//
//  NewsListHealthCollectionView.swift
//  GettingWorldNews
//
//  Created by 木本瑛介 on 2021/03/26.
//

import UIKit
import XLPagerTabStrip

class NewsListHealthCollectionView: UIViewController {
    
    private var articles = [Article]()
    private let cell_Id = "cell_id"
    var iteminfo: IndicatorInfo = "Health"
    
    @IBOutlet weak var NewsListHealthCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NewsListHealthCollectionView.delegate = self
        NewsListHealthCollectionView.dataSource = self
        NewsListHealthCollectionView.register(UINib(nibName: "NewsCell", bundle: nil), forCellWithReuseIdentifier: cell_Id)
        fetchNewsInfo()
    }
    
    private func fetchNewsInfo() {
        API.shared.request(path:.top, category: .health, type: NewsInfo.self) { (Newsinfo) in
            self.articles = Newsinfo.articles
            self.NewsListHealthCollectionView.reloadData()
        }
    }
}

extension NewsListHealthCollectionView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let url = NSURL(string: articles[indexPath.row].url ?? "")
        UIApplication.shared.open(url! as URL, options: [:], completionHandler: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.view.frame.width
        return .init(width: width, height: 90)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = NewsListHealthCollectionView.dequeueReusableCell(withReuseIdentifier: cell_Id, for: indexPath) as! NewsCell
        cell.articles = articles[indexPath.row]
        return cell
    }
}

extension NewsListHealthCollectionView: IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return iteminfo
    }
}
