//
//  ViewController.swift
//  GettingWorldNews
//
//  Created by 木本瑛介 on 2021/03/24.
//

import UIKit
import Alamofire
import XLPagerTabStrip

class NewsListGenaralViewController: UIViewController{
    
    private let cell_Id = "cell_id"
    private var articles = [Article]()
    var itemInfo: IndicatorInfo = "Genaral"

    
    @IBOutlet weak var NewsListCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchNewsInfo()
    }
    
    private func setupView() {
        NewsListCollectionView.backgroundColor = .white
        NewsListCollectionView.delegate = self
        NewsListCollectionView.dataSource = self
        NewsListCollectionView.register(UINib(nibName: "NewsCell", bundle: nil), forCellWithReuseIdentifier: cell_Id)
    }
    
    private func fetchNewsInfo() {
        API.shared.request(path:.top, category: .general, type: NewsInfo.self) { (Newsinfo) in
            self.articles = Newsinfo.articles
            self.NewsListCollectionView.reloadData()
        }
    }
}

extension NewsListGenaralViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
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
        let cell = NewsListCollectionView.dequeueReusableCell(withReuseIdentifier: cell_Id, for: indexPath) as! NewsCell
        cell.articles = articles[indexPath.row]
        return cell
    }
}

extension NewsListGenaralViewController: IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }
}

