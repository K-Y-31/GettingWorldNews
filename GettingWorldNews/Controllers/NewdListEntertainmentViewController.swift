//
//  SecondViewController.swift
//  GettingWorldNews
//
//  Created by 木本瑛介 on 2021/03/25.
//

import UIKit
import XLPagerTabStrip

class NewsListEntertainmentViewController: UIViewController{
    
    private var articles = [Article]()
    private let cell_Id = "cell_id"
    
    @IBOutlet weak var NewsListEntertainmentCollectionView: UICollectionView!
    var itemInfo: IndicatorInfo = "Entertainment"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NewsListEntertainmentCollectionView.delegate = self
        NewsListEntertainmentCollectionView.dataSource = self
        NewsListEntertainmentCollectionView.backgroundColor = .white
        NewsListEntertainmentCollectionView.register(UINib(nibName: "NewsCell", bundle: nil), forCellWithReuseIdentifier: cell_Id)
        fetchNewsInfo()
        print(articles.count)
    }
    
    private func fetchNewsInfo() {
        API.shared.request(path:.top, category: .entertainment, type: NewsInfo.self) { (Newsinfo) in
            self.articles = Newsinfo.articles
            print(self.articles.count)
            self.NewsListEntertainmentCollectionView.reloadData()
        }
    }
}

extension NewsListEntertainmentViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let url = NSURL(string: articles[indexPath.row].url ?? "")
        UIApplication.shared.open(url! as URL , options: [:], completionHandler: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.view.frame.width
        return .init(width: width, height: 90)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.articles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = NewsListEntertainmentCollectionView.dequeueReusableCell(withReuseIdentifier: cell_Id, for: indexPath) as! NewsCell
        cell.articles = self.articles[indexPath.row]
        return cell
    }
}

extension NewsListEntertainmentViewController: IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }
}
