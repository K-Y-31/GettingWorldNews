//
//  ViewController.swift
//  GettingWorldNews
//
//  Created by 木本瑛介 on 2021/03/24.
//

import UIKit
import Alamofire

class NewsListViewController: UIViewController {
    
    private let cell_Id = "cell_id"
    private var articles = [Article]()

    @IBOutlet weak var NewsListCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NewsListCollectionView.backgroundColor = .white
        NewsListCollectionView.delegate = self
        NewsListCollectionView.dataSource = self
        NewsListCollectionView.register(UINib(nibName: "NewsCell", bundle: nil), forCellWithReuseIdentifier: cell_Id)
        fetchNewsInfo()
    }
    
    private func fetchNewsInfo() {
        let baseUrl = "https://newsapi.org/v2/top-headlines?country=jp&category=technology&apiKey=bfae329457b14d42800541b5f8448f0d"
        let request = AF.request(baseUrl)
        request.responseJSON { (response) in
            do {
                guard let data = request.data else { return }
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let value = try decoder.decode(NewsInfo.self, from: data)
                self.articles = value.articles
                self.NewsListCollectionView.reloadData()
            }
            catch {
                print("Faield convert \(error)")
            }
        }
        
    }
}

extension NewsListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
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

