//
//  NewsListTechnology.swift
//  GettingWorldNews
//
//  Created by 木本瑛介 on 2021/03/26.
//

import UIKit
import XLPagerTabStrip

class NewsListTechnologyViewController: UIViewController {
    
    @IBOutlet weak var NewsListTechnologyCollectionView: UICollectionView!
    var iteminfo: IndicatorInfo = "Technology"
    
    private let cell_Id = "cell_id"
    private var articles = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NewsListTechnologyCollectionView.delegate = self
        NewsListTechnologyCollectionView.dataSource = self
        NewsListTechnologyCollectionView.register(UINib(nibName: "NewsCell", bundle: nil), forCellWithReuseIdentifier: cell_Id)
        fetchNewsInfo()
    }
    
    private func fetchNewsInfo() {
        API.shared.request(path:.top, category: .technology, type: NewsInfo.self) { (Newsinfo) in
            self.articles = Newsinfo.articles
            self.NewsListTechnologyCollectionView.reloadData()
        }
    }
}

extension NewsListTechnologyViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
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
        let cell = NewsListTechnologyCollectionView.dequeueReusableCell(withReuseIdentifier: cell_Id, for:indexPath) as! NewsCell
        cell.articles = articles[indexPath.row]
        return cell
    }
}

extension NewsListTechnologyViewController: IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return iteminfo
    }
}
